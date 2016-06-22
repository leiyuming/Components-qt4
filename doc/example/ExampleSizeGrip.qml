import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Rectangle {
        anchors.centerIn: parent
        width: 100; height: 100
        color: "yellow"
        SizeGrip {}
    }
}