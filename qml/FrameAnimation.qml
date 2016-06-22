import QtQuick 1.1

Image {
    id: frameanimation
    property string url
    property string fileType
    property int frameCount: 0
    property int index: 1
    property alias timer: _timer

    onIndexChanged: {
        if (fileType == "" || url  == "") return
        source = url + index + "." + fileType
    }

    Timer {
        id: _timer
        interval: 100; repeat: true; running: true
        triggeredOnStart: true
        onTriggered: {
            if (frameCount < 1) return
            if (index < frameCount) {
                index++
            }
            else {
                index = 1
            }
        }
    }
}
