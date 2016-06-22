import QtQuick 1.1

Item {
    id: indicatorline
    width: 200
    height: childrenRect.height
    clip: true

    property int spacing: 5
    property int count: 7
    property int _spacing: 5
    property int _interval: (indicatorline._spacing * 5000 / indicatorline.width).toFixed(0)

    property Component indicator: Rectangle {
        width: 6; height: 6; radius: 3; smooth: true
        color: "black"
    }

    Repeater {
        id: repeater
        model: indicatorline.count
        delegate: Item {
            id: indicatoritem
            Loader {
                id: indicatorContainer
                x: -item.width
                sourceComponent: indicatorline.indicator
                Binding {
                    target: indicatorline
                    property: "_spacing"
                    value: {
                        if (indicatorContainer.item) {
                            return indicatorline._spacing = indicatorContainer.item.width + indicatorline.spacing
                        }
                        else {
                            return indicatorline.spacing
                        }
                    }
                }
            }
            SequentialAnimation {
                running: true;loops: -1
                PauseAnimation { duration: indicatorline._interval * index }
                ParallelAnimation {
                    SequentialAnimation {
                        NumberAnimation { target: indicatorContainer; property: "x"; from: 0; to: indicatorline.width * 0.3; duration: 800; easing.type: Easing.OutQuart }
                        PauseAnimation { duration: 500 }
                        NumberAnimation { target: indicatorContainer; property: "x"; to: indicatorline.width * 0.6; duration: 800; easing.type: Easing.InQuart }
                    }
                    SequentialAnimation {
                        NumberAnimation { target: indicatoritem; property: "x"; from: -indicatorContainer.item.width;to: indicatorline.width * 0.4; duration: 2100; easing.type: Easing.Linear }
                    }
                }
                PauseAnimation { duration: indicatorline._interval * (indicatorline.count - index) + 500 }
            }
        }
    }
}
