import QtQuick 1.1

Button {
    id: switcher
    __type__: "switcher"
    property bool checked: true
    property alias background: _background
    property alias indicator: _indicator

    onClicked: checked = !checked

    Loader {
        id: _background
        width: 60; height: 25
        sourceComponent: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0; color: "#848FA4" }
                GradientStop { position: 1; color: "#92A0BD" }
            }
            radius: 3; smooth: true
            border { width: 1; color: "#4B5666" }
            Text {
                text: qsTr("ON")
                color: "white"
                font.family: "微软雅黑"
                anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 5 }
            }
            Text {
                text: qsTr("OFF")
                color: "white"
                font.family: "微软雅黑"
                anchors { verticalCenter: parent.verticalCenter; right: parent.right; rightMargin: 5 }
            }
        }
    }

    Loader {
        id: _indicator
        anchors.verticalCenter: parent.verticalCenter
        width: 30; height: 25
        sourceComponent: Rectangle {
            radius: 3; smooth: true
            border { width: 1; color: "#4B5666" }
            gradient: Gradient {
                GradientStop { position: 0; color: "#fefefe" }
                GradientStop { position: 1; color: "#f2f2f2" }
            }
        }
        Behavior on x { NumberAnimation { duration: 100 } }
        states: [
            State {
                when: !switcher.checked
                PropertyChanges {
                    target: indicator
                    x: background.width - width
                }
            },
            State {
                when: switcher.checked
                PropertyChanges {
                    target: indicator
                    x: 0
                }
            }
        ]
    }
}
