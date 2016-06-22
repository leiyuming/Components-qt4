import QtQuick 1.1

Item {
    id: progressbar
    width: 200
    height: 62

    property int value: 50

    property Component background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0; color: "#848FA4" }
            GradientStop { position: 1; color: "#92A0BD" }
        }
        radius: 3; smooth: true
        border { width: 2; color: "#8B8B8C" }
        anchors.fill: parent
    }
    property Component block: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0; color: "#F3F9FF" }
            GradientStop { position: 1; color: "#E4F0FB" }
        }
        radius: 3; smooth: true
    }
    property alias highlighterContainer: _highlighterContainer
    property Component highlighter: Rectangle {
        anchors.top: parent.bottom
        width: parent.height; height: parent.width
        transform: Rotation {
            origin.x: 0
            origin.y: 0
            angle: 270
        }
        radius: 3; smooth: true

        gradient: Gradient {
            GradientStop { position: 0; color: "transparent" }
            GradientStop { position: 0.45; color: highlighterContainer.parent == _background ? "#99ffffff" : "#6682BEFF" }
            GradientStop { position: 0.55; color: highlighterContainer.parent == _background ? "#99ffffff" : "#6682BEFF" }
            GradientStop { position: 1; color: "transparent" }
        }
    }
    property alias title: _text
    property variant titleColors: ["white", "black"]

    Loader {
        id: _background
        anchors.fill: parent
        sourceComponent: background
    }

    Loader {
        id: _block
        anchors.verticalCenter: _background.verticalCenter
        height: parent.height
        width: (parent.width * value / 100).toFixed(0)
        sourceComponent: block
    }

    Item {
        id: _highlighterContainer
        parent: progressbar.value != -1 ? _block : _background
        clip: true; z: 1
        visible: enabled && (progressbar.value > 0 || progressbar.value == -1)
        anchors.centerIn: parent
        width: parent.width; height: parent.height
        Loader {
            id: _highlighter
            width: 314; height: progressbar.height
            SequentialAnimation {
                running: true
                loops: Animation.Infinite
                NumberAnimation {
                    target: _highlighter
                    property: "x"; from: -314; to: progressbar.width + 314
                    duration: 2500
                }
                ScriptAction { script: if (value == 100) highlighterContainer.visible = false; else highlighterContainer.visible = true }
                PauseAnimation { duration: 500 }
            }
            sourceComponent: highlighter
        }
    }

    Text {
        id: _text
        anchors.verticalCenter: parent.verticalCenter
        font.family: "微软雅黑"
        x: parent.width / 2
        anchors.centerIn: parent
        text: value + "%"
        color: _block.width < _text.x + _text.width / 2 ? progressbar.titleColors[0] : progressbar.titleColors[1]
    }
}
