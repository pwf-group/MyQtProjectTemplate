import QtQuick 2.4
import QtQuick.Controls 1.3
import "../material_ui" as MaterialUI

Rectangle {
    property alias textDesc     : textDesc.text
    property alias checked      : switchItem.checked

    width: parent.width; height: textDesc.height
    color: "transparent"

    MaterialUI.Label {
        id: textDesc
        anchors.left: parent.left
    }

    Switch {
        id: switchItem
        checked: true
        height: textDesc.height
        anchors.right: parent.right
    }
}
