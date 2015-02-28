import QtQuick 2.3
import QtQuick.Controls 1.3
import UIConstants 1.0
import "../material_ui" as MaterialUI

Item {
    ListView {
        id: itemList
        model: Qt.fontFamilies()
        anchors.fill: parent
        anchors.topMargin: 48 * dp
        anchors.bottomMargin: 48 * dp
        boundsBehavior: Flickable.StopAtBounds

        delegate: Item {
            id: itemRoot
            width: parent.width
            height: 72 * dp

            Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.width: 1 * dp
                border.color: UIConstants.themeBorderColor
                //border.color: "#cccccc"

                Label {
                    font.family: modelData
                    font.pointSize: UIConstants.subheadFontSize
                    text: modelData
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    anchors.fill: parent
                    anchors.leftMargin: 16 * dp
                }
            }
        }
    }
}
