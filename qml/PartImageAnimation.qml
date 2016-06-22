// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

PartImage {
    property alias timer: _timer
    Timer {
        id: _timer
        interval: 100; repeat: true; running: true
        triggeredOnStart: true
        onTriggered: {
            if (partCount < 2) return
            if (index < partCount - 1) {
                index++
            }
            else {
                index = 0
            }
        }
    }
}
