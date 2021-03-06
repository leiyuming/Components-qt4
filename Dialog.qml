import QtQuick 1.1

MouseArea {
    property bool moveEnable: true
    property variant clickPos: "1,1" 
    width: childrenRect.width; height: childrenRect.height
    anchors.fill: parent
    onPressed: clickPos = Qt.point(mouse.x,mouse.y) 
    onPositionChanged: { 
        if (moveEnable) {
            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            dialog.pos = Qt.point(dialog.pos.x + delta.x, dialog.pos.y + delta.y)
        }
    } 
}
