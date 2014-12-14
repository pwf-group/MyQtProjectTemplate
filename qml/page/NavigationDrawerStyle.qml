import QtQuick 2.4
import UIConstants 1.0
import "../material_ui" as MaterialUI
import "../qml_bootstrap/variables/fontawesome.js" as FontAwesome

Item {
    id: itemRoot
    width: parent.width
    height: 72 * dp
    signal itemClicked (var item, var index);

    Rectangle{
        anchors.fill: parent
        color: "transparent"
        border.width: 1 * dp
        border.color: "#eeeeee"

        MaterialUI.Label {
            font.family: "FontAwesome"
            font.pointSize: UIConstants.titleFontSize
            text: model.icon
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            anchors.fill: parent
            anchors.leftMargin: 16 * dp
        }

        MaterialUI.Label {
            id: content
            font.family: UIConstants.sansFontFamily
            font.pointSize: UIConstants.bodyFontSize
            font.bold: Font.DemiBold
            text: model.text
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            anchors.fill: parent
            anchors.leftMargin: 72 * dp
        }
    }

    MaterialUI.PaperRipple {
        id: ripple
        radius: 3 * dp
        mouseArea: mouseArea
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: itemRoot.itemClicked(model, model.index)
    }
}
