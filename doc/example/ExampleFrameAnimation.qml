import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    FrameAnimation {
        anchors.centerIn: parent
        url: "file:ExampleFrameAnimation/connecting"
        frameCount: 10
        fileType: "png"
        timer.interval: 100
    }
}