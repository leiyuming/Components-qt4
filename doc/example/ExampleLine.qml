import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Line {
        width: 300; height: 2
        anchors.centerIn: parent
        content: Rectangle { color: "black" }
    }
}