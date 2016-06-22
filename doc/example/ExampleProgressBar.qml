import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    ProgressBar {
        anchors.centerIn: parent
        width: 300; height: 20
        // background: Rectangle { color: "lightgray" }
        // block: Rectangle { color: "lightblue" }
        // highlighter: Rectangle { color: "green" }
    }
}