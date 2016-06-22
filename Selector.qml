import QtQuick 1.1

Item {
    id: selector
    property int speed: 500
    property string color: "white"
    property int lineWidth: 1

    anchors.fill: parent
    clip: true
    Line { id: line_top; x: 0
        anchors.top: parent.top
        width: parent.width; height: selector.lineWidth
        content: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.3; color: selector.color }
                GradientStop { position: 0.7; color: selector.color }
                GradientStop { position: 1.0; color: "transparent" }
            }
        }
    }
    Line { id: line_bottom; x: 0
        anchors.bottom: parent.bottom
        width: parent.width; height: selector.lineWidth
        content: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.3; color: selector.color }
                GradientStop { position: 0.7; color: selector.color }
                GradientStop { position: 1.0; color: "transparent" }
            }
        }
    }
    Line { id: line_left; direction: Qt.Vertical
        anchors.left: parent.left; y: -height
        width: selector.lineWidth; height: parent.height;
        content: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.3; color: selector.color }
                GradientStop { position: 0.7; color: selector.color }
                GradientStop { position: 1.0; color: "transparent" }
            }
        }
    }
    Line { id: line_right; direction: Qt.Vertical
        anchors.right: parent.right; y: height
        width: selector.lineWidth; height: parent.height
        content: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.3; color: selector.color }
                GradientStop { position: 0.7; color: selector.color }
                GradientStop { position: 1.0; color: "transparent" }
            }
        }
    }

    onWidthChanged: animation.restart()
    onHeightChanged: animation.restart()

    SequentialAnimation {
        id: animation
        running: true; loops: -1
        ParallelAnimation {
            NumberAnimation { target: line_top; property: "x"; duration: 1000
                from: 0; to: width
            }
            NumberAnimation { target: line_bottom; property: "x"; duration: 1000
                from: 0; to: -width
            }
            NumberAnimation { target: line_right; property: "y"; duration: 1000
                from: -height; to: 0
            }
            NumberAnimation { target: line_left; property: "y"; duration: 1000
                from: height; to: 0
            }
        }
        ParallelAnimation {
            NumberAnimation { target: line_top; property: "x"; duration: 1000
                from: -width; to: 0
            }
            NumberAnimation { target: line_bottom; property: "x"; duration: 1000
                from: width; to: 0
            }
            NumberAnimation { target: line_right; property: "y"; duration: 1000
                from: 0; to: height
            }
            NumberAnimation { target: line_left; property: "y"; duration: 1000
                from: 0; to: -height
            }
        }
    }
}
