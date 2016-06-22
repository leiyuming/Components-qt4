import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    RadioButton {
        id: checkbox
        anchors.centerIn: parent
        title {
            text: "RadioButton"
            color: "black"
        }
    }
}