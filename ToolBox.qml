import QtQuick 1.1
import Components 1.0
import "ToolBox.js" as Core

ScrollArea {
    id: toolbox
    width: 300; height: 400
    default property alias centerView: container.children
    clip: true
    innerScroll: false

    Column {
        id: container
        onChildrenChanged: {
            var index = container.children.length - 1
            Core.addHeadLayerItem(index, container.children[index].header, {})
        }
    }
    Item {
        id: headerTopLayer; clip: true
        parent: toolbox
        width: toolbox.width
        anchors.top: toolbox.top
        Connections {
            target: toolbox.controlArea
            onContentYChanged: Core.update()
            onContentHeightChanged: Core.update()
        }
    }
}


















