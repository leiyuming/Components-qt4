// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: partimage
    property alias image: _image
    property int partCount: 1
    property int index: 0
    property int direction: Qt.Vertical

    width: direction == Qt.Vertical ? _image.width : _image.width / partCount
    height: direction == Qt.Vertical ? _image.height / partCount : _image.height
    clip: true

    onIndexChanged: {
        if (direction == Qt.Vertical) {
            _image.y = -partimage.height * index
        }
        else {
            _image.x = -partimage.width * index
        }
    }

    Image {
        id: _image
    }
}
