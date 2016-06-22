var config = {}
var container = []
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
        var view = __component__.createObject(stackview, __parameter__);
        if (view == null) {
            console.log("Error creating object");
        }
        else {
            container.push(view)
            if (config.enableAnimation && container.length > 1) {
                animation_push.topItem = view
                animation_push.stackItem = container[container.length - 2]
                animation_push.start()
            }
            stackview.depth++
        }
    }
    else if (__component__.status == Component.Error) {
        console.log("Error loading component:", __component__.errorString());
    }
}

function push(view, parameter) {
    __parameter__ = {}
    if (typeof(parameter) != "undefined") {
        __parameter__ = parameter
    }
    if (config.enableAnimation && container.length > 1) {
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

function pop() {
    if (container.length > 0) {
        stackview.depth--
        if (config.enableAnimation && container.length > 1) {
            animation_pop.topItem = container[container.length - 1]
            animation_pop.stackItem = container[container.length - 2]
            animation_pop.start()
        }
        else {
            container.pop().destroy(100)
        }
    }
}

function popIndex(index) {
    if (container.length > 0) {
        if (index == container.length - 1) return;
        var items = container.splice(index + 1, container.length - index - 2)
        stackview.depth -= items.length
        for (var i = 0; i < items.length; i++) {
            items[i].destroy(100)
        }
        stackview.depth--
        if (config.enableAnimation && container.length > 1) {
            animation_pop.topItem = container[container.length - 1]
            animation_pop.stackItem = container[container.length - 2]
            animation_pop.start()
        }
        else {
            container.pop().destroy(100)
        }
    }
}

function clear() {
    stackview.depth = 0
    while (container.length > 0) {
        container.pop().destroy(100)
    }
}

function getView(index) {
    return container[index]
}

//////////////////////////////////////////////////////
initConfig()
