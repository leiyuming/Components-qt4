import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Rectangle {
        anchors.centerIn: parent
        width: 100; height: 100
        color: "yellow"
        Spliter {
            id: spliter
            x: parent.width - width
            width: 2; height: parent.height
            onPositionChanged: {parent.width = parent.width + dx}
            Rectangle {
                anchors.fill: parent; color: "black"
            }
        }
    }
}