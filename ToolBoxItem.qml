import QtQuick 1.1
import Components 1.0

Item {
	id: toolboxitem
    width: parent.width; height: childrenRect.height
	clip: true
    property Component header: Component { Rectangle {} }
    property Component view: Component { Rectangle {} }

    Behavior on height { NumberAnimation { duration: 300; easing.type: Easing.OutQuart } }

	Column {
		Loader { 
			id: _header; sourceComponent: header 
        	onLoaded: {
        		width: item.width; height: item.height
        	}
		}
        Loader { 
        	id: _view; sourceComponent: view
        	onLoaded: {
        		width: item.width; height: item.height
        	}
        }
	}
}
