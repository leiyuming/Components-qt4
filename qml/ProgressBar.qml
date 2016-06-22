import QtQuick 1.1

Item {
    id: progressbar
    width: 200
    height: 62

    property int value: 24

    property alias background: _background
    property alias block: _block
    property alias highlighterContainer: _highlighterContainer
    property alias highlighter: _highlighter
    property alias title: _text
    property variant titleColors: ["white", "black"]

    Loader {
        id: _background
        anchors.fill: parent
        sourceComponent: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0; color: "#848FA4" }
                GradientStop { position: 1; color: "#92A0BD" }
            }
            radius: 3; smooth: true
            border { width: 2; color: "#8B8B8C" }
            anchors.fill: parent
        }
    }

    Loader {
        id: _block
        anchors.verticalCenter: background.verticalCenter
        height: parent.height
        width: parent.width * value / 100
        sourceComponent: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0; color: "#F3F9FF" }
                GradientStop { position: 1; color: "#E4F0FB" }
            }
            radius: 3; smooth: true
        }
    }

    Item {
        id: _highlighterContainer
        parent: progressbar.value != -1 ? block : background
        clip: true; z: 1
        visible: enabled && (progressbar.value > 0 || progressbar.value == -1)
        anchors.centerIn: parent
        width: parent.width; height: parent.height
        Loader {
            id: _highlighter
            width: progressbar.width; height: progressbar.height
            sourceComponent: Rectangle {
                id: hitem
                property double dColor: 0
                anchors.top: parent.bottom
                transform: Rotation {
                    origin.x: 0
                    origin.y: 0
                    angle: 270
                }
                width: parent.height
                height: progressbar.width
                radius: 3; smooth: true
                clip: true
                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: hitem
                        property: "x"; from: -progressbar.width; to: progressbar.width
                        duration: progressbar.width * 10
                    }
                    ScriptAction { script: if (value == 100) highlighterContainer.visible = false; else highlighterContainer.visible = true }
                    PauseAnimation { duration: 1000 }
                }

                gradient: Gradient {
                    GradientStop { position: 0; color: "transparent" }
                    GradientStop { position: 0.45; color: highlighterContainer.parent == background ? "#99ffffff" : "#6682BEFF" }
                    GradientStop { position: 0.55; color: highlighterContainer.parent == background ? "#99ffffff" : "#6682BEFF" }
                    GradientStop { position: 1; color: "transparent" }
                }
            }
        }
    }

    Text {
        id: _text
        anchors.verticalCenter: parent.verticalCenter
        font.family: "微软雅黑"
        x: parent.width / 2
        anchors.centerIn: parent
        text: value + "%"
        color: block.width < _text.x + _text.width / 2 ? progressbar.titleColors[0] : progressbar.titleColors[1]
    }
}
