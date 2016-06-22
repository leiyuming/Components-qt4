import QtQuick 1.1

Item {
    id: frame
    width: 400; height: 300; clip: true

    signal mousePressed(int x, int y)
    signal mouseMoved(int x, int y)
    signal init()
    signal close()

    property variant retrunMessage: {}

    property SequentialAnimation initAnimation: SequentialAnimation {
        ParallelAnimation {
            NumberAnimation { target: frame; property: "scale"; from: 0.5; to: 1; duration: 200 }
            NumberAnimation { target: frame; property: "opacity"; from: 0; to: 1; duration: 200 }
        }
        ScriptAction { script: init() }
    }

    property SequentialAnimation closeAnimation: SequentialAnimation {
        ParallelAnimation {
            NumberAnimation { target: frame; property: "scale"; from: 1; to: 0.5; duration: 200 }
            NumberAnimation { target: frame; property: "opacity"; from: 1; to: 0; duration: 200 }
        }
        ScriptAction { script: close() }
    }

    Keys.onEscapePressed: {
        closeAnimation.start()
    }

    MouseArea {
        anchors.fill: parent
        onPressed: mousePressed(mouse.x, mouse.y)
        onPositionChanged: mouseMoved(mouse.x, mouse.y)
    }

    Component.onCompleted: initAnimation.start()
}
