import QtQuick 1.1

MouseArea {
    id: slider
    width: 200
    height: 10
    hoverEnabled: true
    property int minimum: 0
    property int maximum: 100
    property int value: 24
    property int step: 10
    property int direction: Qt.Horizontal

    property alias background: _background
    property alias indicator: _indicator
    property alias block: _block
    transform: Rotation { origin.x: slider.width / 2; origin.y: slider.height / 2; angle: slider.direction == Qt.Horizontal ? 0 : 180}

    onPressed: {
        if (direction == Qt.Horizontal) {
            if (mouseX  < _indicator.x) {
                if (value > step + minimum) {
                    value = value - step
                }
                else {
                    value = minimum
                }
            }
            else if (mouseX  > _indicator.x) {
                if (value < maximum - step) {
                    value = value + step
                }
                else {
                    value = maximum
                }
            }
        }
        else {
            if (mouseY  < _indicator.y) {
                if (value > step + minimum) {
                    value = value - step
                }
                else {
                    value = minimum
                }
            }
            else if (mouseY  > _indicator.y){
                if (value < maximum - step) {
                    value = value + step
                }
                else {
                    value = maximum
                }
            }
        }
    }

    Loader {
        id: _background
        width: slider.width; height: slider.height
        anchors.centerIn: parent
        sourceComponent: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0; color: "#848FA4" }
                GradientStop { position: 1; color: "#92A0BD" }
            }
            radius: height / 2; smooth: true
            border { width: 2; color: "#8B8B8C" }
            anchors.fill: parent
        }
    }

    Loader {
        id: _block
        width: slider.direction == Qt.Horizontal ? indicator.x + indicator.width / 2 : _background.width
        height: slider.direction == Qt.Horizontal ? _background.height : indicator.y + indicator.height / 2
        Binding { when: slider.direction == Qt.Horizontal; target: _block; property: "anchors.verticalCenter"; value: slider.verticalCenter }
        Binding { when: slider.direction != Qt.Horizontal; target: _block; property: "anchors.horizontalCenter"; value: slider.horizontalCenter }
        sourceComponent: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0; color: "#F3F9FF" }
                GradientStop { position: 1; color: "#E4F0FB" }
            }
            radius: height / 2; smooth: true
        }
    }

    Loader {
        id: _indicator
        property alias mouse: mouse_indicator
        Binding { when: slider.direction == Qt.Horizontal; target: indicator; property: "anchors.verticalCenter"; value: slider.verticalCenter }
        Binding { when: slider.direction != Qt.Horizontal; target: indicator; property: "anchors.horizontalCenter"; value: slider.horizontalCenter }
        x: slider.direction == Qt.Horizontal ? (value - minimum) * slider.width / (maximum - minimum) - _indicator.width / 2 : 0
        y: slider.direction == Qt.Horizontal ? 0 : (value - minimum) * slider.height / (maximum - minimum) - _indicator.height / 2
        width: 20
        height: 20
        sourceComponent: Rectangle {
            radius: width / 2; smooth: true
            gradient: Gradient {
                GradientStop { position: 0; color: mouse.pressed ? "#f2f2f2" : "#fefefe" }
                GradientStop { position: 1; color: mouse.containsMouse && !mouse.pressed ? "#fefefe" : "#f2f2f2" }
            }
            border { width: 1; color: "#8B8B8C" }
        }
        onXChanged: {
            if (mouse.pressed && slider.direction == Qt.Horizontal) {
                slider.value = ((_indicator.x + _indicator.width / 2) * (maximum - minimum) / slider.width + minimum).toFixed(2)
                if (slider.value > slider.maximum) slider.value = slider.maximum;
                else if (slider.value < slider.minimum) slider.value = slider.minimum;
            }
        }
        onYChanged:  {
            if (mouse.pressed && slider.direction != Qt.Horizontal) {
                slider.value = ((_indicator.y + _indicator.height / 2) * (maximum - minimum) / (slider.height) + minimum).toFixed(2)
                if (slider.value > slider.maximum) slider.value = slider.maximum;
                else if (slider.value < slider.minimum) slider.value = slider.minimum;
            }
        }

        MouseArea {
            id: mouse_indicator
            hoverEnabled: true
            anchors.fill: parent
            enabled: slider.enabled
            drag.target: parent
            drag.axis: Drag.XandYAxis
            drag.minimumX: slider.direction == Qt.Horizontal ? -indicator.width / 2 : 0
            drag.maximumX: slider.direction == Qt.Horizontal ? slider.width - indicator.width / 2: 0
            drag.minimumY: slider.direction == Qt.Horizontal ? 0 : -indicator.height / 2
            drag.maximumY: slider.direction == Qt.Horizontal ? 0 : slider.height - indicator.height / 2
        }
    }
}
