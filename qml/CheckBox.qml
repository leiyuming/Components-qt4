import QtQuick 1.1

Button {
    id: checkbox
    __type__: "CheckBox"
    property bool checked: false
    property alias title: _text
    property alias indicator: _indicator
    property alias container: _container
    onClicked: checked = !checked

    Row {
        id: _container
        spacing: 5
        Loader {
            id: _indicator
            anchors.verticalCenter: parent.verticalCenter
            sourceComponent: Image {
                source: checked ? "./resource/checkbox_checked.png" : "./resource/checkbox_unchecked.png"
            }
        }
        Text {
            id: _text
            anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
        }
    }
}
