import QtQuick 1.1
import Components 1.0

StackView {
    id: stackview
    width: 600
    height: 400

    Component {
        id: testItem
        Rectangle {
            property string title
            width: stackview.width; height: stackview.height - 60
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            border { width: 1; color: "black" }
            Component.onCompleted: title = "Rect " + stackview.depth
            Button {
                id: button_push
                tip: "push"
                Rectangle {
                    width: 80; height: 30; radius: 15; smooth: true
                    border { width: 1; color: "#8C8C8D" }
                    gradient: Gradient {
                        GradientStop { position: 0; color: button_push.pressed ? "#CEE1F8" : button_push.containsMouse ? "#E8F3FF" : "#fefefe" }
                        GradientStop { position: 1; color: button_push.pressed ? "#E9F3FF" : button_push.containsMouse ? "#CDE1F8" : "#f2f2f2" }
                    }
                    Text {
                        text: "Push"
                        anchors.centerIn: parent
                        font.family: "微软雅黑"
                        style: Text.Sunken; styleColor: "#88888888"
                    }
                }
                onClicked: stackview.push("file:TabViewExample.qml")
            }
        }
    }
    Row {
        id: buttonbar
        anchors.bottom: parent.bottom
        Button {
            id: button_push
            tip: "push"
            Rectangle {
                width: 80; height: 30; radius: 15; smooth: true
                border { width: 1; color: "#8C8C8D" }
                gradient: Gradient {
                    GradientStop { position: 0; color: button_push.pressed ? "#CEE1F8" : button_push.containsMouse ? "#E8F3FF" : "#fefefe" }
                    GradientStop { position: 1; color: button_push.pressed ? "#E9F3FF" : button_push.containsMouse ? "#CDE1F8" : "#f2f2f2" }
                }
                Text {
                    text: "Push"
                    anchors.centerIn: parent
                    font.family: "微软雅黑"
                    style: Text.Sunken; styleColor: "#88888888"
                }
            }
            onClicked: stackview.push(testItem)
        }
        Button {
            id: button_pop
            tip: "pop"
            anchors.bottom: parent.bottom
            Rectangle {
                width: 80; height: 30; radius: 15; smooth: true
                border { width: 1; color: "#8C8C8D" }
                gradient: Gradient {
                    GradientStop { position: 0; color: button_pop.pressed ? "#CEE1F8" : button_pop.containsMouse ? "#E8F3FF" : "#fefefe" }
                    GradientStop { position: 1; color: button_pop.pressed ? "#E9F3FF" : button_pop.containsMouse ? "#CDE1F8" : "#f2f2f2" }
                }
                Text {
                    text: "Pop"
                    anchors.centerIn: parent
                    font.family: "微软雅黑"
                    style: Text.Sunken; styleColor: "#88888888"
                }
            }
            onClicked: stackview.pop()
        }
        Repeater {
            model: stackview.depth
            delegate: Button {
                id: button
                Rectangle {
                    width: 80; height: 30; radius: 15; smooth: true
                    border { width: 1; color: "#8C8C8D" }
                    gradient: Gradient {
                        GradientStop { position: 0; color: button.pressed ? "#CEE1F8" : button.containsMouse ? "#E8F3FF" : "#fefefe" }
                        GradientStop { position: 1; color: button.pressed ? "#E9F3FF" : button.containsMouse ? "#CDE1F8" : "#f2f2f2" }
                    }
                    Text {
                        text: stackview.getView(index).title
                        anchors.centerIn: parent
                        font.family: "微软雅黑"
                        style: Text.Sunken; styleColor: "#88888888"
                    }
                }
                onClicked: {
                    stackview.popIndex(index)
                }
            }
        }
    }
}
