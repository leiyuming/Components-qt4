import QtQuick 1.1

Item {
    id: scrollarea
    width: 300
    height: 300

    property alias controlArea: flickable
    default property alias centerview: _centerview.children
    property alias horizontalBar: _horizontalBar
    property alias verticalBar: _verticalBar
    property bool innerScroll: true
    property string horizontalBarPolicy: "auto" // "always", "never"
    property string verticalBarPolicy: "auto" // "always", "never"

    Flickable {
        id: flickable
        width: innerScroll
               ? scrollarea.width
               : verticalBar.visible ? scrollarea.width - verticalBar.width : scrollarea.width
        height: innerScroll
                ? scrollarea.height
                : horizontalBar.visible ? scrollarea.height - horizontalBar.height : scrollarea.height
        contentWidth: _centerview.width; contentHeight: _centerview.height
        clip: true

        Item { id: _centerview; width: childrenRect.width; height: childrenRect.height }
    }

    ScrollBar {
        id: _horizontalBar
        width: verticalBar.visible ? scrollarea.width - verticalBar.width : scrollarea.width
        height: 13
        anchors.bottom: parent.bottom
        opacity: horizontalBar.containsMouse || horizontalBar.indicator.mouse.containsMouse
        ? 1
        : innerScroll ? flickable.flickingHorizontally ? 1 : 0.01 : 1
        Behavior on opacity { NumberAnimation { duration: 300 } }
        value: flickable.contentX / (flickable.contentWidth - flickable.width) * 100
        indicator.width: flickable.visibleArea.widthRatio * horizontalBar.width
        visible: {
            switch (scrollarea.horizontalBarPolicy) {
            case "auto":
                return flickable.width < flickable.contentWidth
            case "always":
                return true
            case "never":
                return false
            }
        }
        onIndicatorPosChanged: {
            if (flickable.contentX <= 0 && dx < 0) return
            if (flickable.contentX >= flickable.contentWidth - flickable.width && dx > 0) return
            flickable.contentX += dx * (flickable.contentWidth - flickable.width) / (horizontalBar.width - horizontalBar.indicator.width)
            if (flickable.contentX < 0 && dx < 0) {
                flickable.contentX = 0
                return
            }
            if (flickable.contentX > flickable.contentWidth - flickable.width && dx > 0) {
                flickable.contentX = flickable.contentWidth - flickable.width
                return
            }
        }
    }
    ScrollBar {
        id: _verticalBar
        direction: Qt.Vertical
        width: 13
        height: horizontalBar.visible ? scrollarea.height - horizontalBar.height : scrollarea.height
        anchors.right: parent.right
        opacity: verticalBar.containsMouse || verticalBar.indicator.mouse.containsMouse
        ? 1
        : innerScroll ? flickable.flickingVertically ? 1 : 0.01 : 1
        Behavior on opacity { NumberAnimation { duration: 300 } }
        value: flickable.contentY / (flickable.contentHeight - flickable.height) * 100
        indicator.height: flickable.visibleArea.heightRatio * verticalBar.height
        visible: {
            switch (scrollarea.verticalBarPolicy) {
            case "auto":
                return flickable.height < flickable.contentHeight
            case "always":
                return true
            case "never":
                return false
            }
        }
        onIndicatorPosChanged: {
            if (flickable.contentY <= 0 && dy < 0) return
            if (flickable.contentY >= flickable.contentHeight - flickable.height && dy > 0) return
            flickable.contentY += dy * (flickable.contentHeight - flickable.height) / (verticalBar.height - verticalBar.indicator.height)
            if (flickable.contentY < 0 && dy < 0) {
                flickable.contentY = 0
                return
            }
            if (flickable.contentY > flickable.contentHeight - flickable.height && dy > 0) {
                flickable.contentY = flickable.contentHeight - flickable.height
                return
            }
        }
    }
}
