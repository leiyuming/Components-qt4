import QtQuick 1.1
import Components 1.0

Rectangle {
    id: weatherinfo
    width: parent.width; height: parent.height
    color: "skyblue"
    border { width: 1; color: "black" }
    Text {
        anchors.centerIn: parent
        text: "天气设置"
        color: "white"
    }
    Button {
        Rectangle {
            width: 80; height: 30
            Text {
                text: "return"
            }
        }
        onClicked: flipable.flipped = !flipable.flipped
    }
}
