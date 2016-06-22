import QtQuick 1.1
import Components 1.0

CursorArea {
    id: spliter
    z: 100
    property int direction: Qt.Horizontal
    property variant range: [0, 1000]
    signal positionChanged(int dx, int dy)
    cursor: {
        if (direction == Qt.Horizontal) {
            return mousearea.containsMouse ? Qt.SplitHCursor : Qt.ArrowCursor
        }
        else {
            return mousearea.containsMouse ? Qt.SplitVCursor : Qt.ArrowCursor
        }
    }

    MouseArea {
        id: mousearea
        property int pressX: spliter.x
        property int pressY: spliter.y
        anchors.fill: parent
        hoverEnabled: true
        drag.target: spliter
        drag.axis: direction == Qt.Horizontal ? Drag.XAxis : Drag.YAxis
        drag.minimumX: range[0]
        drag.maximumX: range[1]
        drag.minimumY: range[0]
        drag.maximumY: range[1]

        onPositionChanged: {
            if (pressed) {
                spliter.positionChanged(spliter.x - pressX, spliter.y - pressY)
                pressX = spliter.x
                pressY = spliter.y
            }
        }
    }
}
