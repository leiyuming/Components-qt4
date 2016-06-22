import QtQuick 1.1

Item {
    id: banner
    width: 200; height: 200
    clip: true
    property int index: 0
    property alias timer: _timer
    property bool circleMode: true
    default property alias container: bannerContainer.children

    signal init()

    property ParallelAnimation animation: ParallelAnimation {
        property alias preAnimation: _preAnimation
        property alias nextAnimation: _nextAnimation
        NumberAnimation { id: _preAnimation }
        NumberAnimation { id: _nextAnimation }
    }

    onInit: {
        if (index != container.length - 1) {
            container[container.length - 1].x = banner.width
        }
    }

    onIndexChanged: {
        banner.timer.stop()
        switchItem(bannerContainer.lastIndex, banner.index)
        bannerContainer.lastIndex = banner.index
        banner.timer.start()
    }

    function switchItem(preIndex, nextIndex) {
        if (preIndex == nextIndex) return
        animation.preAnimation.target = container[preIndex]
        animation.nextAnimation.target = container[nextIndex]
        animation.preAnimation.property = "x"
        animation.nextAnimation.property = "x"
        if (circleMode) {
            animation.preAnimation.from = 0
            animation.preAnimation.to = -banner.width
            animation.nextAnimation.from = banner.width
            animation.nextAnimation.to = 0
        }
        else {
            if (preIndex < nextIndex) {
                animation.preAnimation.from = 0
                animation.preAnimation.to = -banner.width
                animation.nextAnimation.from = banner.width
                animation.nextAnimation.to = 0
            }
            else {
                animation.preAnimation.from = 0
                animation.preAnimation.to = banner.width
                animation.nextAnimation.from = -banner.width
                animation.nextAnimation.to = 0
            }
        }
        animation.start()
    }

    Item {
        id: bannerContainer
        property int lastIndex: banner.index
        anchors.fill: parent
        clip: true
        onChildrenChanged: banner.init()
    }

    Timer {
        id: _timer
        interval: 4000; running: true; repeat: true
        onTriggered: {
            if (container.length > 1) {
                if (index < container.length - 1) {
                    index++
                }
                else {
                    index = 0
                }
            }
        }
    }
}
