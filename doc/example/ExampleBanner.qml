import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Banner {
        id: banner
        anchors.centerIn: parent
        Rectangle {
            width: 200; height: 200; color: "lightgray"
            Text { text: "view 1"; anchors.centerIn: parent }
        }
        Rectangle {
            width: 200; height: 200; color: "gray"
            Text { text: "view 2"; anchors.centerIn: parent }
        }
        Rectangle {
            width: 200; height: 200; color: "dimgray"
            Text { text: "view 3"; anchors.centerIn: parent }
        }
    }
    Row {
        spacing: 5
        anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom; bottomMargin: 10 }
        Repeater {
            model: banner.container.length
            delegate: Rectangle {
                width: 12; height: 12; radius: width / 2; smooth: true
                color: index == banner.index ? "red" : "black"
                Behavior on color { ColorAnimation { duration: 500 } }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        banner.index = index
                    }
                }
            }
        }
    }
}