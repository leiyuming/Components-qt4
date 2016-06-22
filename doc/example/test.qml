import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Row {
        anchors.centerIn: parent
        spacing: 10
        Button {
            Rectangle {
                width: 100; height: 30; color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "show window"
                }
            }
            onClicked: {
                var testWindow = Util.showWindow("file:TwoSideWindow.qml")
                testWindow.windowTitle = "testWindow"
            }
        }
    }
}