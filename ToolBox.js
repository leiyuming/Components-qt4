function createComponent(obj, para, parent) {
    var component
    if (typeof(obj) == "string") {
        component = Qt.createComponent(obj);
    }
    else {
        component = obj
    }
    return component.createObject(parent, para);
}

function update() {
    for (var i = 0; i < container.children.length; i++) {
    	if (headerTopLayer.children[i] == null) break
        var item_y1 = toolbox.mapFromItem(container.children[i], 0, 0).y
        var item_y2 = item_y1 + container.children[i].height - headerTopLayer.children[i].height
        if (item_y1 <= 0 && item_y2 >= headerTopLayer.children[i].height) {
            headerTopLayer.children[i].y = 0
        }
        else if (item_y1 > 0) {
            headerTopLayer.children[i].y = item_y1
        }
        else if (item_y2 < 0) {
            headerTopLayer.children[i].y = item_y2
        }
    }
}

function addHeadLayerItem(index, headerItem, para) {
	if (typeof(headerItem) == "object") {
	    var item = createComponent(headerItem, para, headerTopLayer)
	    headerTopLayer.height = item.height
    }
}
