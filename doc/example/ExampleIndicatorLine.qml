import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    IndicatorLine {
        width: 300; height: 20
        anchors.centerIn: parent
        indicator: Rectangle {
            width: 8; height: 8; radius: 4; smooth: true
            color: "dimgray"
        }
    }
}