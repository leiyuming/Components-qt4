// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

MouseArea {
    id: scrollbar
    width: 200
    height: 20
    hoverEnabled: true
    clip: true
    property int value: 24
    property int step: 100
    property int direction: Qt.Horizontal

    property alias background: _background
    property alias indicator: _indicator

    signal indicatorPosChanged(int dx, int dy)

    onPressed: {
        if (direction == Qt.Horizontal) {
            if (mouseX  < indicator.x) {
                indicatorPosChanged(-step, 0)
            }
            else if (mouseX  > indicator.x) {
                indicatorPosChanged(step, 0)
            }
        }
        else {
            if (mouseY  < indicator.y) {
                indicatorPosChanged(0, -step)
            }
            else if (mouseY  > indicator.y){
                indicatorPosChanged(0, step)
            }
        }
    }

    Loader {
        id: _background
        width: scrollbar.direction == Qt.Horizontal ? scrollbar.width : 7
        height: scrollbar.direction == Qt.Horizontal ? 7 : scrollbar.height
        Binding { when: scrollbar.direction == Qt.Horizontal; target: background; property: "anchors.verticalCenter"; value: scrollbar.verticalCenter }
        Binding { when: scrollbar.direction != Qt.Horizontal; target: background; property: "anchors.horizontalCenter"; value: scrollbar.horizontalCenter }
        sourceComponent: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0; color: "#848FA4" }
                GradientStop { position: 1; color: "#92A0BD" }
            }
            radius: height / 2; smooth: true
            border { width: 1; color: "#8B8B8C" }
            anchors.fill: parent
        }
    }

    Loader {
        id: _indicator
        property alias mouse: mouse_indicator
        Binding { when: scrollbar.direction == Qt.Horizontal; target: indicator; property: "anchors.verticalCenter"; value: scrollbar.verticalCenter }
        Binding { when: scrollbar.direction != Qt.Horizontal; target: indicator; property: "anchors.horizontalCenter"; value: scrollbar.horizontalCenter }
        x: scrollbar.direction == Qt.Horizontal ? scrollbar.value * (scrollbar.width - scrollbar.indicator.width) / 100 : 0
        y: scrollbar.direction == Qt.Horizontal ? 0 : scrollbar.value * (scrollbar.height - scrollbar.indicator.height) / 100
        width: scrollbar.direction == Qt.Horizontal ? scrollbar.width / 4 : scrollbar.width
        height: scrollbar.direction == Qt.Horizontal ? scrollbar.height : scrollbar.height / 4
        sourceComponent: Rectangle {
            radius: width / 2; smooth: true
            gradient: Gradient {
                GradientStop { position: 0; color: mouse.pressed ? "#f2f2f2" : "#fefefe" }
                GradientStop { position: 1; color: mouse.containsMouse && !mouse.pressed ? "#fefefe" : "#f2f2f2" }
            }
            border { width: 1; color: "#8B8B8C" }
        }

        MouseArea {
            id: mouse_indicator
            hoverEnabled: true
            anchors.fill: parent
            property int pressedX: 0
            property int pressedY: 0
            preventStealing: true
            onPressedChanged: {
                pressedX = pressed ? mouseX : 0
                pressedY = pressed ? mouseY : 0
            }

            onPositionChanged: {
                if (pressed) {
                    indicatorPosChanged(mouseX - pressedX, mouseY - pressedY)
                }
            }
        }
    }
}
