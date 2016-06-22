import QtQuick 1.1
import Components 1.0

Rectangle {
    width: 400; height: 300
    Rating {
        id: rating
        anchors.centerIn: parent
        enableEdit: true
    }
}