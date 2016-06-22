import QtQuick 1.1
import "ChainedView.js" as Engine

Item {
    id: chainedview
    width: 400
    height: 300

    function show(view, parameter) {
        return Engine.show(view, parameter)
    }

    SequentialAnimation {
        id: animation
        property alias nextItem: nextItemAnimation.target
        property alias preItem: preItemAnimation.target
        ParallelAnimation {
            NumberAnimation { id: nextItemAnimation; property: "opacity"; from: 0; to: 1 }
            NumberAnimation { target: animation.nextItem; property: "x"; from: width; to: 0 }
            NumberAnimation { id: preItemAnimation; property: "opacity"; from: 1; to: 0 }
            NumberAnimation { target: animation.preItem; property: "x"; from: 0; to: -width }
        }
        ScriptAction { script: animation.preItem.destroy(100) }
    }
}
