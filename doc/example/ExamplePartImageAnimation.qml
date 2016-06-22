import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    PartImageAnimation {
        anchors.centerIn: parent
        image.source: "file:ExamplePartImageAnimation/connecting.png"
        partCount: 10
        timer.interval: 100
    }
}