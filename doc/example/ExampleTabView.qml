import QtQuick 1.1
import Components 1.0

TabView {
    id: tabview
    width: 500; height: 500
    index: 0

    headerAlignment: "top-left"
    header.delegate: Component {
        Button {
            Rectangle { width: tabview.headerItemWidth; height: tabview.headerItemHeight
                color: content[index].title; opacity: 0.6
            }
            Text { text: content[index].title; anchors.centerIn: parent; color: "white" }
            onClicked: { tabview.index = index }
        }
    }
    headerItemWidth: 80
    headerItemHeight: 30
    header.highlight: Rectangle {
        width: tabview.headerItemWidth; height: tabview.headerItemHeight; color: "black"
    }
    onInit: {
        if (mode == "all") {
            for (var i = 0; i < content.length; i++) {
                if (i != tabview.index) {
                    content[i].x = tabview.width
                }
            }
        }
        else {
            if (content.length - 1 != tabview.index) {
                content[content.length - 1].x = tabview.width
            }
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
