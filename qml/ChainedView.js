var config = {}
var currentItem = null
var __component__
var __parameter__

function initConfig() {
    config.enableAnimation = true
}

function setConfig(key, value) {
    config[key] = value
}

function createComponent(view) {
    __component__ = Qt.createComponent(view);
    if (__component__.status == Component.Ready)
        finishCreation();
    else
        __component__.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (__component__.status == Component.Ready) {
        var view = __component__.createObject(chainedview, __parameter__);
        if (view == null) {
            console.log("Error creating object");
        }
        else { // success
            if (currentItem != null) {
                animation.nextItem = view
                animation.preItem = currentItem
                animation.start()
            }
            currentItem = view
        }
    }
    else if (__component__.status == Component.Error) {
        console.log("Error loading component:", __component__.errorString());
    }
}

function show(view, parameter) {
    __parameter__ = {}
    if (typeof(parameter) != "undefined") {
        __parameter__ = parameter
    }
    if (config.enableAnimation && currentItem != null) {
        __parameter__.opacity = 0
    }
    switch (typeof(view)) {
    case "object": {
        __component__ = view
        finishCreation()
    }
    break
    case "string": {
        createComponent(view)
    }
    break
    }
}
