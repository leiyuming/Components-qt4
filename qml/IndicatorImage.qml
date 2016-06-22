import QtQuick 1.1

Image {
    id: indicator
    smooth: true
    property alias animation: _animation
    transform: Rotation {
        id: rotation
        origin.x: indicator.width / 2
        origin.y: indicator.height / 2
    }
    NumberAnimation { id: _animation; target: rotation; property: "angle"; duration: 2000; running: true; loops: -1
        from: 0; to: 359
    }
}
