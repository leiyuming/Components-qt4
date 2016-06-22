import QtQuick 1.1

Item {
    id: line
    property int direction: Qt.Horizontal
    property Component content: Rectangle {
        property variant colors: ["transparent", "black", "transparent"]
        gradient: Gradient {
            GradientStop { position: 0.0; color: colors[0] }
            GradientStop { position: 0.3; color: colors[1] }
            GradientStop { position: 0.7; color: colors[1] }
            GradientStop { position: 1.0; color: colors[2] }
        }
    }

    Loader {
        id: creator
        transform: Rotation {
            origin.x: creator.width / 2
            origin.y: line.height / 2
            angle: direction == Qt.Horizontal ? 270 : 0
        }
        width: direction == Qt.Horizontal ? line.height : line.width
        height: direction == Qt.Horizontal ? line.width : line.height
        sourceComponent: line.content
    }
}
