import QtQuick 1.1
import Components 1.0

StackView {
    id: stackview
    width: 600
    height: 400

    Component {
        id: testView
        Rectangle {
            property string title
            width: stackview.width; height: stackview.height - 60
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            border { width: 1; color: "black" }
            Component.onCompleted: title = "Rect " + stackview.depth
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
                Text { text: "Push"; anchors.centerIn: parent }
            }
            onClicked: stackview.push(testView)
        }
        Button {
            id: button_pop
            tip: "pop"
            anchors.bottom: parent.bottom
            Rectangle {
                width: 80; height: 30; radius: 15; smooth: true
                border { width: 1; color: "#8C8C8D" }
                Text { text: "Pop"; anchors.centerIn: parent }
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
                    Text {
                        text: stackview.getView(index).title
                        anchors.centerIn: parent
                    }
                }
                onClicked: {
                    stackview.popIndex(index)
                }
            }
        }
    }
}
