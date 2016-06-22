import QtQuick 1.1
import Components 1.0

ChainedView {
    id: chainedview
    width: 600
    height: 400

    Component {
        id: view1
        Rectangle {
            width: chainedview.width; height: chainedview.height; color: "lightgray"
            Text { text: "view 1"; anchors.centerIn: parent }
            Button {
                anchors { bottom: parent.bottom; right: parent.right }
                Rectangle { width: 40; height: 20; color: "black" }
                onClicked: chainedview.show(view2)
            }
        }
    }

    Component {
        id: view2
        Rectangle {
            width: chainedview.width; height: chainedview.height; color: "gray"
            Text { text: "view 2"; anchors.centerIn: parent }
            Button {
                anchors { bottom: parent.bottom; right: parent.right }
                Rectangle { width: 40; height: 20; color: "black" }
                onClicked: chainedview.show("file:ExampleToolBox.qml", {"width": chainedview.width})
            }
        }
    }
    Component.onCompleted: show(view1)
}