import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    ScrollArea {
        id: scrollarea
        width: 200; height: 200
        anchors.centerIn: parent
        innerScroll: false
        Rectangle {
            width: 300; height: 400
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightsteelblue" }
                GradientStop { position: 1.0; color: "blue" }
            }
        }
        verticalBar.background.sourceComponent: Rectangle { color: "black" }
        verticalBar.indicator.sourceComponent: Rectangle { color: "blue" }
    }
}