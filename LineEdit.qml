// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Components 1.0

Item {
    id: lineedit
    width: 200
    height: 30

    property alias background: _background
    property alias message: text_message
    property alias content: text_content

    signal textChanged(string text)
    signal accepted(string text)

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true
    }

    CursorArea {
        anchors.fill: parent
        cursor: mousearea.containsMouse ? Qt.IBeamCursor : Qt.ArrowCursor
    }

    Loader {
        id: _background
        width: lineedit.width; height: lineedit.height
        sourceComponent: Rectangle {
            radius: 8; smooth: true
            border { width: 1; color: "#8C8C8C" }
            anchors.fill: parent
            anchors.margins: -5
            gradient: Gradient {
                GradientStop { position: 0; color: "#fefefe" }
                GradientStop { position: 1; color: "#f2f2f2" }
            }
            Rectangle {
                width: background.width; height: background.height
                anchors.centerIn: parent
                radius: 4; smooth: true
                border { width: 1; color: "#4B5666" }
                gradient: Gradient {
                    GradientStop { position: 0; color: "#848FA4" }
                    GradientStop { position: 1; color: "#92A0BD" }
                }
            }
        }
    }
    Text {
        id: text_message
        visible: text_content.text.length == 0
        width: parent.width - 10; clip: true
        color: "#f2f2f2"; font.pixelSize: 14
        font.family: "微软雅黑"
        horizontalAlignment: Text.AlignRight
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 5 }
    }
    TextInput {
        id: text_content
        width: parent.width - 10; clip: true
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 5 }
        color: "white"; font.pixelSize: 14
        font.family: "微软雅黑"
        cursorVisible: text_content.activeFocus
//        cursorDelegate: Component {
//            Rectangle {
//                id: contentCursor
//                color: text_content.color
//                width: 1; height: text_content.font.pixelSize
//                Behavior on opacity { NumberAnimation { duration: 300 } }
//                SequentialAnimation {
//                    running: true; loops: Animation.Infinite
//                    ScriptAction { script: contentCursor.opacity = 0 }
//                    PauseAnimation { duration: 600 }
//                    ScriptAction { script: contentCursor.opacity = 1 }
//                    PauseAnimation { duration: 900 }
//                }
//            }
//        }

        selectByMouse: true; smooth: true
        onTextChanged: lineedit.textChanged(text_content.text)
        onAccepted: lineedit.accepted(text_content.text)
    }
}
