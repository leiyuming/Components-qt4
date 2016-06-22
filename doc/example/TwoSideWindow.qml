import QtQuick 1.1
import Components 1.0

Window {
    width: 400; height: 300
    Flipable {
        id: flipable
        width: parent.width; height: parent.height

        property bool flipped: false

        front: WeatherInfo {}
        back: WeatherSetting {}

        transform: Rotation {
            id: rotation
            origin.x: 0
            origin.y: flipable.height/2
            axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: flipable.x / flipable.width * 180    // the default angle
        }

        states: State {
            name: "back"
            // PropertyChanges { target: rotation; angle: 180 }
            PropertyChanges { target: flipable; x: width }
            when: flipable.flipped
        }

        transitions: Transition {
            // NumberAnimation { target: rotation; property: "angle"; duration: 4000 }
            SmoothedAnimation { target: flipable; property: "x"; duration: 500 }
        }
    }
 }