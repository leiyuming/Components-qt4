import QtQuick 1.1
import Components 1.0

Item {
    id: rating
    width: row_background.width; height: row_background.height

    property int total: 5
    property int value: 0
    property bool enableEdit: false
    property int spacing: 0

    property Component background: Component {
        Image { source: "./resource/rating_background.png" }
    }

    property Component foreground: Component {
        Image { source: "./resource/rating_foreground.png" }
    }

    Row {
        id: row_background
        spacing: rating.spacing
        Repeater {
            model: total
            delegate: background
        }
    }
    Row {
        spacing: rating.spacing
        Repeater {
            model: value
            delegate: foreground
        }
    }

    CursorArea {
        anchors.fill: parent
        cursor: Qt.PointingHandCursor
    }

    MouseArea {
        property int lastValue: rating.value
        property int itemWidth: (rating.width + rating.spacing) / rating.total
        enabled: rating.enableEdit
        anchors.fill: parent
        hoverEnabled: true
        onMouseXChanged: rating.value = Math.ceil(mouseX / itemWidth)
        onEntered: lastValue = rating.value
        onExited:rating.value = lastValue
        onClicked: lastValue = Math.ceil(mouseX / itemWidth)
    }
}
