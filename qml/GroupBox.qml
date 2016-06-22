import QtQuick 1.1

Item {
    id: groupbox
    clip: true
    width: 300; height: 200
    property alias titleBar: _titleBar
    property alias view: _view
    default property alias container: _view.children

    Loader {
        id: _titleBar
        width: groupbox.width; height: 30
        sourceComponent: Rectangle {
            smooth: true
            border { width: 1; color: "#4B5666" }
            gradient: Gradient {
                GradientStop { position: 0; color: "#92A0BD" }
                GradientStop { position: 1; color: "#848FA4" }
            }

            Text {
                text: "GroupBox"
                font.family: "微软雅黑"
                color: "white"
                font.pixelSize: 14
                anchors {
                    left: parent.left; leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }
            }

            Text {
                id: arrow
                text: "▶"; color: "white"; smooth: true
                font.pixelSize: 16; font.family: "微软雅黑"
                style: Text.Raised; styleColor: "#88000000"
                anchors { verticalCenter: parent.verticalCenter; right: parent.right; rightMargin: 5 }
                transform: Rotation { origin.x: arrow.width / 2; origin.y: arrow.height / 2
                    angle: view.state == "show" ? 90 : 0
                    Behavior on angle { NumberAnimation { duration: 200 } }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: view.state = (view.state == "show" ? "hide" : "show")
            }
        }
    }
    Item {
        id: _view
        anchors.top: titleBar.bottom
        clip: true
        Behavior on height { NumberAnimation { duration: 300; easing.type: Easing.OutQuad } }
        Behavior on opacity { NumberAnimation { duration: 400 } }
        width: childrenRect.width; height: state == "show" ? childrenRect.height : 0
        opacity: state == "show" ? 1 : 0
        state: "show"
        Binding {
            when: true
            target: groupbox
            property: "height"
            value: view.height + titleBar.height
        }
        Binding {
            when: true
            target: groupbox
            property: "width"
            value: view.width
        }
    }
}
