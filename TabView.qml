import QtQuick 1.1

Item {
    id: tabview

    signal init(string mode)

    default property alias content: stack.children
    property alias container: stack
    property int index: 0
    property alias header: headerCreator
    property int headerItemWidth: 80
    property int headerItemHeight: 30
    property string headerAlignment
    property int speed: 300
    // top-left;top-center;top-right;bottom-left;bottom-center;bottom-right;left-center;right-center;
    property SequentialAnimation switchAnimation: SequentialAnimation {
        property alias preViewAnimation: _preViewAnimation
        property alias nextViewAnimation: _nextViewAnimation
        property variant preState: { "start": 0, "forward": stack.width, "nagative": -stack.width }
        property variant nextState: { "end": 0, "forward": stack.width, "nagative": -stack.width }
        ParallelAnimation {
            NumberAnimation { id: _preViewAnimation; property: "x"; duration: tabview.speed }
            NumberAnimation { id: _nextViewAnimation; property: "x"; duration: tabview.speed }
        }
    }

    onIndexChanged: {
        switchView(index)
    }

    function switchView(index) {
        if (header.currentIndex == index) return;
        if (switchAnimation == null) {
            stack.children[index].visible = true
            stack.children[header.currentIndex].visible = false
            header.currentIndex = index
            return;
        }
        if (switchAnimation.running) return;
        switchAnimation.preViewAnimation.target = stack.children[header.currentIndex]
        switchAnimation.nextViewAnimation.target = stack.children[index]
        if (header.currentIndex < index) {
            switchAnimation.preViewAnimation.from = switchAnimation.preState.start
            switchAnimation.preViewAnimation.to = switchAnimation.preState.nagative
            switchAnimation.nextViewAnimation.from = switchAnimation.nextState.forward
            switchAnimation.nextViewAnimation.to = switchAnimation.nextState.end
        }
        else {
            switchAnimation.preViewAnimation.from = switchAnimation.preState.start
            switchAnimation.preViewAnimation.to = switchAnimation.preState.forward
            switchAnimation.nextViewAnimation.from = switchAnimation.nextState.nagative
            switchAnimation.nextViewAnimation.to = switchAnimation.nextState.end
        }
        switchAnimation.start()
        header.currentIndex = index
    }

    function updateHeader() {
        switch (tabview.headerAlignment) {
        case "top-left": {
            headerCreator.anchors.bottom = stack.top
            headerCreator.anchors.left = stack.left
            headerCreator.orientation = ListView.Horizontal
            stack.anchors.topMargin = tabview.headerItemHeight
        }
        break
        case "top-center": {
            headerCreator.anchors.bottom = stack.top
            headerCreator.anchors.horizontalCenter = stack.horizontalCenter
            headerCreator.orientation = ListView.Horizontal
            stack.anchors.topMargin = tabview.headerItemHeight
        }
        break
        case "top-right": {
            headerCreator.anchors.bottom = stack.top
            headerCreator.anchors.right = stack.right
            headerCreator.orientation = ListView.Horizontal
            stack.anchors.topMargin = tabview.headerItemHeight
        }
        break
        case "bottom-left": {
            headerCreator.anchors.top = stack.bottom
            headerCreator.anchors.left = stack.left
            headerCreator.orientation = ListView.Horizontal
            stack.anchors.bottomMargin = tabview.headerItemHeight
        }
        break
        case "bottom-center": {
            headerCreator.anchors.top = stack.bottom
            headerCreator.anchors.horizontalCenter = stack.horizontalCenter
            headerCreator.orientation = ListView.Horizontal
            stack.anchors.bottomMargin = tabview.headerItemHeight
        }
        break
        case "bottom-right": {
            headerCreator.anchors.top = stack.bottom
            headerCreator.anchors.right = stack.right
            headerCreator.orientation = ListView.Horizontal
            stack.anchors.bottomMargin = tabview.headerItemHeight
        }
        break
        case "left-top": {
            headerCreator.anchors.right = stack.left
            headerCreator.anchors.top = stack.top
            stack.anchors.leftMargin = tabview.headerItemWidth
        }
        break
        case "left-center": {
            headerCreator.anchors.right = stack.left
            headerCreator.anchors.verticalCenter = stack.verticalCenter
            stack.anchors.leftMargin = tabview.headerItemWidth
        }
        break
        case "left-bottom": {
            headerCreator.anchors.right = stack.left
            headerCreator.anchors.bottom = stack.bottom
            stack.anchors.leftMargin = tabview.headerItemWidth
        }
        break
        case "right-top": {
            headerCreator.anchors.left = stack.right
            headerCreator.anchors.top = stack.top
            stack.anchors.rightMargin = tabview.headerItemWidth
        }
        break
        case "right-center": {
            headerCreator.anchors.left = stack.right
            headerCreator.anchors.verticalCenter = stack.verticalCenter
            stack.anchors.rightMargin = tabview.headerItemWidth
        }
        break
        case "right-bottom": {
            headerCreator.anchors.left = stack.right
            headerCreator.anchors.bottom = stack.bottom
            stack.anchors.rightMargin = tabview.headerItemWidth
        }
        break
        }
    }

    onWidthChanged: init("all")
    onHeightChanged: init("all")
    onHeaderAlignmentChanged: updateHeader()
    onHeaderItemWidthChanged: updateHeader()
    onHeaderItemHeightChanged: updateHeader()

    ListView {
        id: headerCreator; clip: true; boundsBehavior: Flickable.StopAtBounds
        width: if (orientation == ListView.Horizontal) {
                   return tabview.headerItemWidth * stack.children.length + spacing * (stack.children.length - 1)
               }
               else {
                   return tabview.headerItemWidth
               }

        height: if (orientation == ListView.Horizontal) {
                    return tabview.headerItemHeight
                }
                else {
                    return tabview.headerItemHeight * stack.children.length + spacing * (stack.children.length - 1)
                }
        model: stack.children.length
    }

    Item {
        id: stack
        anchors.fill: parent
        clip: true
        onChildrenChanged: init("")
    }
}
