import QtQuick 1.1

Button {
    id: radiobutton
    __type__: "RadioButton"
    property bool checked: false
    property alias title: _text
    property alias indicator: _indicator
    property alias container: _container

    onClicked: checked = true

    Row {
        id: _container
        spacing: 5
        Loader {
            id: _indicator
            anchors.verticalCenter: parent.verticalCenter
            sourceComponent: Rectangle {
                width: 16; height: width; radius: width / 2
                color: "transparent"; smooth: true
                border { width: 1; color: "#4B5666" }
                Rectangle {
                    width: 11; height: width; radius: width / 2
                    smooth: true
                    anchors {
                        centerIn: parent
                        horizontalCenterOffset: 1
                        verticalCenterOffset: 1
                    }

                    border { width: 1; color: "#4B5666" }
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#8F9CB6"}
                        GradientStop { position: 0; color: "#848EA4"}
                    }

                    NumberAnimation on scale { running: checked;  from: 0; to: 1; duration: 100 }
                    NumberAnimation on scale { running: !checked; from: 1; to: 0; duration: 100 }
                }
            }
        }
        Text {
            id: _text
            anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
        }
    }
}
