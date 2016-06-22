import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    LineEdit {
        width: 300; height: 30
        anchors.centerIn: parent
        message {
            text: qsTr("请在这里输入内容")
            color: "yellow"
        }
        // background.sourceComponent: Rectangle { color: "dimgray" }
    }
}