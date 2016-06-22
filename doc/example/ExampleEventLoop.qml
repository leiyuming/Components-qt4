import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    EventLoop { id: eventloop }
    Row {
        anchors.centerIn: parent
        spacing: 10
        Button {
            Rectangle {
                width: 100; height: 30; color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "start"
                }
            }
            onClicked: {
                console.log("start eventloop...");
                eventloop.running = true;
                console.log("event loop quit!");
            }
        }
        Button {
            Rectangle {
                width: 100; height: 30; color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "stop"
                }
            }
            onClicked: {
                eventloop.running = false;
            }
        }
    }
}