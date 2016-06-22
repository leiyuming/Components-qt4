import QtQuick 1.1

Button {
    id: sizegrip
    cursor: Qt.SizeFDiagCursor
    enableCursor: true; z: 1
    preventStealing: true
    anchors { right: parent.right; bottom: parent.bottom }

    property variant minimum: {"width": 10, "height": 10}
    property variant maximum: {"width": 1000, "height": 1000}

    property int _pressedX: 0
    property int _pressedY: 0
    property Component indicator: Text {
        text: "◢"
    }

    Loader {
        sourceComponent: indicator
    }

    onPressed: {
        _pressedX = mouseX
        _pressedY = mouseY
    }

    onPositionChanged: {
        if (pressed) {
            if (sizegrip.parent.width < minimum.width && mouseX - _pressedX < 0) return
            if (sizegrip.parent.height < minimum.height && mouseY - _pressedY < 0) return
            if (sizegrip.parent.width > maximum.width && mouseX - _pressedX > 0) return
            if (sizegrip.parent.height > maximum.height && mouseY - _pressedY > 0) return
            sizegrip.parent.width += mouseX - _pressedX
            sizegrip.parent.height += mouseY - _pressedY
        }
    }
}
