import QtQuick 2.4
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
            id: cardTitle
            font.pointSize: UIConstants.subheadFontSize
            font.bold: Font.DemiBold
            text: "Local Storage"
        }

        Rectangle {
            width: parent.width
            height: 2 * dp
            color: UIConstants.themeColor
        }

        SettingStorageStyle {
            textDesc : "Offline route"
            textSubDesc: "12 routes"
        }

        SettingStorageStyle {
            textDesc : "Save point"
            textSubDesc: "12 points"
        }

        SettingStorageStyle {
            textDesc : "Offline bus/rail stop"
            textSubDesc: "100 stops"
        }

        SettingStorageStyle {
            textDesc : "Offline map cache"
            textSubDesc: "56 MB offline tiles"
        }

        SettingStorageSwitchStyle {
            textDesc : "Offline map enabled"
            checked: false
        }
    }
}

