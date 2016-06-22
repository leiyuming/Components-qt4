import QtQuick 1.1

Item {
    id: line
    property int direction: Qt.Horizontal
    property variant colors: ["transparent", "#aaffffff", "transparent"]
    Rectangle {
        id: _line
        transform: Rotation {
            origin.x: _line.width / 2
            origin.y: line.height / 2
            angle: direction == Qt.Horizontal ? 270 : 0
        }
        width: direction == Qt.Horizontal ? line.height : line.width
        height: direction == Qt.Horizontal ? line.width : line.height

        gradient: Gradient {
            GradientStop { position: 0.0; color: line.colors[0] }
            GradientStop { position: 0.3; color: line.colors[1] }
            GradientStop { position: 0.7; color: line.colors[1] }
            GradientStop { position: 1.0; color: line.colors[2] }
        }
    }
}
