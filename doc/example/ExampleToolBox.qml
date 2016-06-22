import QtQuick 1.1
import Components 1.0

ToolBox {
    id: toolbox
    width: 300; height: 400
    verticalBar {
        indicator {
            sourceComponent: Rectangle { color: "black" }
            width: 9
        }
        background {
            sourceComponent: Rectangle { color: "gray" }
        }
    }
    Repeater {
        model: 5
        delegate: ToolBoxItem {
            id: toolboxitem
            width: toolbox.controlArea.width
            state: "expand"
            header: Button {
                enableCursor: true
                cursor: Qt.PointingHandCursor
                Rectangle {
                    id: headerItem
                    width: toolboxitem.width; height: 30
                    color: toolboxitem.state == "expand" ? "tomato" : "darkred"
                    Text { anchors.centerIn: parent; text: "title " + index }
                }
                onClicked: {
                    if (toolboxitem.state == "expand") {
                        toolboxitem.height = headerItem.height
                        toolboxitem.state = "unexpand"
                    }
                    else {
                        toolboxitem.height = toolboxitem.childrenRect.height
                        toolboxitem.state = "expand"
                    }
                }
            }
            view: Rectangle {
                width: toolbox.width; height: 200; color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
            }
        }
    }
}
