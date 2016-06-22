import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    CheckBox {
        id: checkbox
        anchors.centerIn: parent
        title {
            text: "CheckBox"
            color: "black"
        }
    }
}