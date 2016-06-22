import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Button {
        id: button
        anchors.centerIn: parent
        Rectangle {
            width: 100;
            height: 40
            color: button.containsMouse ? "#d2d2d2" : "#b5b5b5"
            Text {
                text: qsTr("按钮")
                anchors.centerIn: parent
            }
        }
    }
}