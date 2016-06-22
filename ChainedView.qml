import QtQuick 1.1
import "ChainedView.js" as Engine

Item {
    id: chainedview
    width: 400
    height: 300

    function show(view, parameter) {
        return Engine.show(view, parameter)
    }

    function clear() {
        return Engine.clear()
    }

    function getCurrentView() {
        return Engine.currentItem
    }

    SequentialAnimation {
        id: animation
        property alias nextItem: nextItemAnimation.target
        property alias preItem: preItemAnimation.target
        ParallelAnimation {
//            NumberAnimation { id: nextItemAnimation; property: "opacity"; from: 0; to: 1 }
            NumberAnimation { id: nextItemAnimation; property: "x"; from: width; to: 0 }
//            NumberAnimation { id: preItemAnimation; property: "opacity"; from: 1; to: 0 }
            NumberAnimation { id: preItemAnimation; property: "x"; from: 0; to: -width }
        }
        ScriptAction { script: animation.preItem.destroy(100) }
    }
}
