import QtQuick 1.1
import Components 1.0

ScrollArea {
    id: flickable
    width: 800; height: 600
    anchors.fill: parent
    anchors.margins: 20
    controlArea.contentHeight: flow.height + 40
    Flow {
        id: flow
        spacing: 10
        width: flickable.width - 40
        x: 20; y: 20
        GroupBox {
            id: groupbox
            Rectangle {
                width: 400; height: 250
                border { width: 2; color: "#4B5666" }
                Flow {
                    spacing: 20
                    anchors.fill: parent
                    anchors.margins: 10
                    IndicatorImage {
                        source: "file:resource/rating_foreground.png"
                    }

                    ProgressBar {
                        id: progressbar
                        width: 300
                        height: 14
                        title.font.pixelSize: 10
                        Behavior on value { NumberAnimation { duration: 300 } }
                    }
                    Slider {
                        id: slider
                        width: 300; height: 8
                        onValueChanged: progressbar.value = value
                    }
                    Slider {
                        id: verticalslider
                        width: 8; height: 150
                        onValueChanged: progressbar.value = value
                        direction: Qt.Vertical
                    }
                    IndicatorCircle { radius: 13; Text { anchors.centerIn: parent; text: progressbar.title.text }
                        indicator: Rectangle {
                            width: 4; height: 4; smooth: true
                            color: "#8C98B1"
                        }
                    }
                    IndicatorLine { width: 380
                        height: 20
                        indicator: Column {
                            Text { text: "囧"; font.pixelSize: 12 }
                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: 8; height: 8; radius: 4; smooth: true
                                color: "#8C98B1"
                            }
                        }
                    }
                }
            }
        }

        Link {
            text: "我是超链接"
            url: "www.baidu.com"
            color: mouse.containsMouse ? "steelblue" : "black"
            Selector{ color: "#88000000"; lineWidth: 1; anchors.margins: -4}
        }
        Rating {
            total: 5
            value: 0
            enableEdit: true
        }
        Button {
            id: button
            tip: "我是按钮"
            Rectangle {
                width: 80; height: 30; radius: 15; smooth: true
                border { width: 1; color: "#8C8C8D" }
                gradient: Gradient {
                    GradientStop { position: 0; color: button.pressed ? "#CEE1F8" : button.containsMouse ? "#E8F3FF" : "#fefefe" }
                    GradientStop { position: 1; color: button.pressed ? "#E9F3FF" : button.containsMouse ? "#CDE1F8" : "#f2f2f2" }
                }
                Text {
                    text: "Button"
                    anchors.centerIn: parent
                    font.family: "微软雅黑"
                    style: Text.Sunken; styleColor: "#88888888"
                }
            }
            onClicked: {
//                console.debug(Util.showDialog("file:Dialog.qml"))
//                var parameter = {"windowTitle": "window"/*, "windowFlags": Qt.Tool*/}
//                var window = Util.showWindow("file:Window.qml", parameter)
//                window.windowEvent.connect(
//                            function (event) {
//                                console.debug(event.message)
//                            }
//                            )
                var parameter = {"windowTitle": "window"/*, "windowFlags": Qt.Tool*/}
                var window = Util.popWindow("file:Window.qml", parameter, button)
                window.windowEvent.connect(
                            function windowEvent(event) {
                                console.debug(event.message)
                            }
                            )
            }
        }
        ScrollText {
            id: scrolltext
            width: 100; height: 30
            SequentialAnimation {
                running: true; loops: Animation.Infinite
                ScriptAction { script: scrolltext.text = "我是文字" }
                PauseAnimation { duration: 2000 }
                ScriptAction { script: scrolltext.text = "我也是文字" }
                PauseAnimation { duration: 2000 }
            }
        }

        Frame {
            id: frame
            width: 400; height: 300
            Rectangle {
                anchors.fill: parent
                color: "#88000000"
            }
            ScrollArea {
                id: scrollarea
                width: parent.width - 40; height: parent.height - 40
                anchors.centerIn: parent
                innerScroll: false
                TabView {
                    id: tabview
                    width: 300; height: 300
                    index: 0

                    headerAlignment: "top-left"
                    header.delegate: Component {
                        Button {
                            Rectangle { width: headerItemWidth; height: headerItemHeight
                                color: content[index].title; opacity: 0.6
                            }
                            Text { text: content[index].title; anchors.centerIn: parent; color: "white" }
                            onClicked: { tabview.index = index }
                        }
                    }
                    header.highlight: Rectangle {
                        width: tabview.headerItemWidth; height: 30; color: "white"
                    }

                    onInit: {
                        if (content.length - 1 != tabview.index) {
                            content[content.length - 1].x = tabview.width
                        }
                    }

                    Rectangle {
                        property string title: "Red"
                        width: parent.width; height: parent.height
                        color: "#e3e3e3"
                        Rectangle {
                            anchors.fill: parent; anchors.margins: 20
                            color: "#ff7f7f"
                            Text {
                                width: parent.width - 20
                                anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                                text: "Roses are red"
                                font.pixelSize: 20
                                wrapMode: Text.WordWrap
                            }
                        }
                    }

                    Rectangle {
                        property string title: "Green"
                        width: parent.width; height: parent.height
                        color: "#e3e3e3"

                        Rectangle {
                            anchors.fill: parent; anchors.margins: 20
                            color: "#7fff7f"
                            Text {
                                width: parent.width - 20
                                anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                                text: "Flower stems are green"
                                font.pixelSize: 20
                                wrapMode: Text.WordWrap
                            }
                        }
                    }

                    Rectangle {
                        property string title: "Blue"
                        width: parent.width; height: parent.height
                        color: "#e3e3e3"

                        Rectangle {
                            anchors.fill: parent; anchors.margins: 20
                            color: "#7f7fff"
                            Text {
                                width: parent.width - 20
                                anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                                text: "Violets are blue"
                                font.pixelSize: 20
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                }
            }
            Spliter {
                id: spliter
                x: parent.width - width
                width: 2; height: parent.height
                onPositionChanged: {parent.width = parent.width + dx}
                Rectangle {
                    anchors.fill: parent; color: "skyblue"
                }
            }
            SizeGrip { }
        }

        CheckBox {
            id: checkbox
            title.text: "CheckBox"
            container.spacing: 1
            indicator.sourceComponent: Image {
                source: checkbox.checked ? "file:resource/checkbox_checked.png" : "file:resource/checkbox_unchecked.png"
            }

            tip: "我是复选框"
            onClicked: {
                var parameter = {"windowTitle": "window"/*, "windowFlags": Qt.Tool*/}
                var window = Util.popWindow("file:Window.qml", parameter, checkbox)
                window.windowEvent.connect(
                            function windowEvent(event) {
                                console.debug(event.message)
                                window.windowEvent.disconnect(windowEvent)
                            }
                            )
            }
        }

        Switcher {
            tip: "我是开关"
        }

        Column {
            spacing: 5
            Text { text: "index:" + radiogroup.index }
            RadioGroup { id: radiogroup; index: 0 }
            RadioButton { title.text: "RadioButton" }
            RadioButton { title.text: "RadioButton" }
            RadioButton { title.text: "RadioButton" }
            RadioButton { title.text: "RadioButton" }
            RadioButton { title.text: "RadioButton" }
            Component.onCompleted: { radiogroup.addList(children) }
        }

        Banner {
            id: banner
            //            circleMode: false
            timer.interval: 2500
            Rectangle { width: 200; height: 200; color: "red" }
            Rectangle { width: 200; height: 200; color: "orangered" }
            Rectangle { width: 200; height: 200; color: "yellow" }
            Rectangle { width: 200; height: 200; color: "green" }
            Rectangle { width: 200; height: 200; color: "blue" }
            Rectangle { width: 200; height: 200; color: "purple" }
            Rectangle { width: 200; height: 200; color: "magenta" }
            Row {
                anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom; bottomMargin: 10 }
                parent: banner
                spacing: 5
                Repeater {
                    model: banner.container.length
                    delegate: Rectangle {
                        width: 12; height: 12; radius: width / 2; smooth: true
                        color: index == banner.index ? "#92A0BD" : "black"
                        Behavior on color { ColorAnimation { duration: 500 } }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                banner.index = index
                            }
                        }
                    }
                }
            }
        }

        Line {
            width: 200; height: 1
        }
        FrameAnimation {
            url: "file:resource/connecting"
            frameCount: 10
            fileType: "png"
            timer.interval: 1000
        }
        PartImageAnimation {
            image.source: "file:resource/connecting.png"
            partCount: 10
            timer.interval: 200
        }

        LineEdit {
            message.text: "请输入查询信息"
        }
    }
}
