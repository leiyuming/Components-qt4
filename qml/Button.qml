import QtQuick 1.1
import Components 1.0

MouseArea {
    id: button
    width: childrenRect.width
    height: childrenRect.height
    hoverEnabled: true

    property SequentialAnimation initAnimation: null
    property SequentialAnimation destroyAnimation: null

    property string __type__: ""
    property bool enableCursor: false
    property string tip: ""
    property alias cursor: cursorarea.cursor

    function deleteLater() {
        if (destroyAnimation != null) {
            destroyAnimation.start()
        }
        else {
            button.destroy()
        }
    }

    CursorArea {
        id: cursorarea
        anchors.fill: parent
        cursor: parent.enableCursor ? Qt.PointingHandCursor : Qt.ArrowCursor
    }

    Tip { text: tip; anchors.fill: parent }

    Component.onCompleted: if (initAnimation != null) initAnimation.start()
}
