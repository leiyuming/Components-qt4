var buttons = new Array()
var jsTest = {}

function add(button) {
    buttons.push(button)
    var button_index = buttons.length - 1
    button.checked = radiogroup.index == button_index ? true : false
    button.clicked.connect( function () {
        radiogroup.index = button_index
    } )
}

function addList(list) {
    for (var i = 0; i < list.length; i++) {
        var __type__ = typeof(list[i].__type__)
        if (__type__== "string" && list[i].__type__ == "RadioButton") {
            add(list[i])
        }
    }
}

function remove(index) {
    buttons.splice(index, 1)
}

function refresh() {
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].checked = false
    }
    if (index > -1 && index < buttons.length) {
        buttons[index].checked = true
    }
}
