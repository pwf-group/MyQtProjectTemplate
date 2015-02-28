import QtQuick 2.4
import QtQuick.Window 2.0
import UIConstants 1.0
import "../material_ui" as MaterialUI

MaterialUI.Card {
    id: settingDisplayCard
    width: parent.width
    height: displayList.height + 20 * dp

    Column {
        id: displayList
        spacing: 3 * dp
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 10 * dp
        }

        MaterialUI.Label {
            font.pointSize: UIConstants.subheadFontSize
            font.bold: Font.DemiBold
            text: "Display Info"
        }

        Rectangle {
            width: parent.width
            height: 2 * dp
            color: UIConstants.themeColor
        }

        Row {
            MaterialUI.Label { text: "Screen Size: "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1x%2").arg(Screen.width).arg(Screen.height) }
        }

        Row {
            MaterialUI.Label { text: "Logical Pixel Density : "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1").arg(Screen.logicalPixelDensity) }
        }

        Row {
            MaterialUI.Label { text: "Physical Pixel Density : "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1").arg(Screen.pixelDensity) }
        }

//        Row {
//            MaterialUI.Label { text: "Density-independent Pixels Ratio : "; font.bold: Font.DemiBold }
//            MaterialUI.Label { text: qsTr("%1").arg(Screen.devicePixelRatio) }
//        }

        Row {
            MaterialUI.Label { text: "App dp : "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1").arg(dp) }
        }
    }
}

