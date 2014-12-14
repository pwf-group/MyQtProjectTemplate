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
        anchors { top: parent.top; margins: 10 * dp }
        spacing: 3 * dp

        MaterialUI.Label {
            anchors { left: parent.left; margins: 10 * dp }
            font.pointSize: UIConstants.subheadFontSize
            font.bold: Font.DemiBold
            text: "Display Info"
        }

        Row {
            anchors { left: parent.left; margins: 10 * dp }
            MaterialUI.Label { text: "Screen Size: "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1x%2").arg(Screen.width).arg(Screen.height) }
        }

        Row {
            anchors { left: parent.left; margins: 10 * dp }
            MaterialUI.Label { text: "Logical Pixel Density : "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1").arg(Screen.logicalPixelDensity) }
        }

        Row {
            anchors { left: parent.left; margins: 10 * dp }
            MaterialUI.Label { text: "Physical Pixel Density : "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1").arg(Screen.pixelDensity) }
        }

        Row {
            anchors { left: parent.left; margins: 10 * dp }
            MaterialUI.Label { text: "Density-independent Pixels Ratio : "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1").arg(Screen.devicePixelRatio) }
        }

        Row {
            anchors { left: parent.left; margins: 10 * dp }
            MaterialUI.Label { text: "App dp : "; font.bold: Font.DemiBold }
            MaterialUI.Label { text: qsTr("%1").arg(dp) }
        }
    }
}

