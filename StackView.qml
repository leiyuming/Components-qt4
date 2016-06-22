import QtQuick 1.1
import "StackView.js" as Engine

Item {
    id: stackview
    width: 400
    height: 300

    property int depth: 0

    function setConfig(key, value) {
        return Engine.setConfig(key, value)
    }

    function push(view, parameter) {
        return Engine.push(view, parameter)
    }
    function pop() {
        return Engine.pop()
    }

    function popIndex(index) {
        return Engine.popIndex(index)
    }

    function clear() {
        return Engine.clear()
    }

    function getView(index) {
        return Engine.getView(index)
    }

    function getCurrentView() {
        return getView(Engine.container.length - 1)
    }

    Component.onDestruction: {
        Engine.clear()
    }

    SequentialAnimation {
        id: animation_push
        property alias topItem: pushtopAnimation.target
        property alias stackItem: pushstackAnimation.target
        ParallelAnimation {
            NumberAnimation { id: pushtopAnimation; property: "opacity"; from: 0; to: 1 }
            NumberAnimation { target: animation_push.topItem; property: "scale"; from: 1.5; to: 1 }
            NumberAnimation { id: pushstackAnimation; property: "opacity"; from: 1; to: 0 }
            NumberAnimation { target: animation_push.stackItem; property: "scale"; from: 1; to: 0.5 }
        }
    }

    SequentialAnimation {
        id: animation_pop
        property alias topItem: poptopAnimation.target
        property alias stackItem: popstackAnimation.target
        ParallelAnimation {
            NumberAnimation { id: poptopAnimation; property: "opacity"; from: 1; to: 0 }
            NumberAnimation { target: animation_pop.topItem; property: "scale"; from: 1; to: 1.5 }
            NumberAnimation { id: popstackAnimation; property: "opacity"; from: 0; to: 1 }
            NumberAnimation { target: animation_pop.stackItem; property: "scale"; from: 0.5; to: 1 }
        }
        ScriptAction { script: Engine.container.pop().destroy(100) }
    }
}
