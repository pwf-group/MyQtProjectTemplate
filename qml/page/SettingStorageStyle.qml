import QtQuick 2.4
import UIConstants 1.0
import "../material_ui" as MaterialUI

Rectangle {
    property alias textDesc     : textDesc.text
    property alias textSubDesc  : textSubDesc.text
    property alias textButton   : textButton.text

    width: parent.width; height: descItem.height
    color: "transparent"

    Column {
        id: descItem
        spacing: 3 * dp
        MaterialUI.Label {
            id: textDesc
            anchors.left: parent.left
        }
        MaterialUI.Label {
            id: textSubDesc
            anchors { left: parent.left; leftMargin: 10 * dp }
            font.pointSize: UIConstants.captionFontSize
            color: UIConstants.displayTextColor
        }
    }

    MaterialUI.FlatButton {
        id: textButton;
        anchors {
            right: parent.right
            verticalCenter: descItem.verticalCenter
        }
        text: "Clear"
    }
}
