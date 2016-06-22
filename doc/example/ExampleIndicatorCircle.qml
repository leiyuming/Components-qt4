import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    IndicatorCircle {
        anchors.centerIn: parent
        indicator: Rectangle { width: 4; height: 4; color: "black"; smooth: true }
    }
}