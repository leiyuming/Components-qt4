import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Link {
        anchors.centerIn: parent
        url: "http://www.baidu.com"     
        text: qsTr("百度")   
    }
}