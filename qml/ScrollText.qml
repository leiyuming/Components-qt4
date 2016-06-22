import QtQuick 1.0

Item {
    id: scrolltext

    property alias textHandle: text_1

    property string text: ""

    Text { smooth: true
        id: text_1
        font.family: "微软雅黑"
        font.pixelSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width; wrapMode: Text.Wrap
    }
    Text { smooth: true
        id: text_2
        font.family: textHandle.font.family
        font.pixelSize: textHandle.font.pixelSize
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width; wrapMode: Text.Wrap
        color: textHandle.color
    }

    onTextChanged: { showMessage(text) }

    function showMessage(message) {
        if (text_1.text.length > 1) {
            text_2.text = message
            show_text_1.stop()
            show_text_2.start()
        }
        else {
            text_1.text = message
            show_text_2.stop()
            show_text_1.start()
        }
    }

    function reset() {
        text_1.text = ""
        text_2.text = ""
    }

    SequentialAnimation {
        id: show_text_1
        ParallelAnimation {
            NumberAnimation { target: text_1; property: "y"; duration: 400; from: textHandle.font.pixelSize; to: 0 }
            NumberAnimation { target: text_1; property: "opacity"; duration: 400; from: 0; to: 1 }
            NumberAnimation { target: text_2; property: "y"; duration: 400; from: 0; to: -textHandle.font.pixelSize }
            NumberAnimation { target: text_2; property: "opacity"; duration: 400; from: 1; to: 0 }
        }
        ScriptAction { script: { text_2.text = "" } }
    }
    SequentialAnimation {
        id: show_text_2
        ParallelAnimation {
            NumberAnimation { target: text_2; property: "y"; duration: 400; from: textHandle.font.pixelSize; to: 0 }
            NumberAnimation { target: text_2; property: "opacity"; duration: 400; from: 0; to: 1 }
            NumberAnimation { target: text_1; property: "y"; duration: 400; from: 0; to: -textHandle.font.pixelSize }
            NumberAnimation { target: text_1; property: "opacity"; duration: 400; from: 1; to: 0 }
        }
        ScriptAction { script: { text_1.text = "" } }
    }
}
