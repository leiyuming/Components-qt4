import QtQuick 1.1
import "RadioGroup.js" as Core

QtObject {
    id: radiogroup
    property int index: -1
    onIndexChanged: Core.refresh()

    function add(button) {
        Core.add(button)
    }

    function addList(list) {
        Core.addList(list)
    }

    function remove(index) {
        Core.add(index)
    }

    function refresh() {
        Core.refresh()
    }
}
