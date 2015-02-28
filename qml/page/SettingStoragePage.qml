import QtQuick 2.4
import UIConstants 1.0
import "../material_ui" as MaterialUI

MaterialUI.Card {
    id: settingDisplayCard
    width: parent.width
    height: displayList.height + 20 * dp

    Column {
        id: displayList
        spacing: 15 * dp
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

        SettingStorageSwitchStyle {
            textDesc : "Offline map enabled"
            checked: settings.offlineMap
            onCheckedChanged: {
                settings.offlineMap = checked
            }
        }

        SettingStorageSwitchStyle {
            textDesc : "Map night mode"
            checked: settings.nightMode
            onCheckedChanged: {
                settings.nightMode = checked
            }
        }

        Rectangle {
            width: parent.width
            height: logoutBtn.height
            MaterialUI.FlatButton {
                id: logoutBtn
                anchors.right: parent.right
                text: "Logout"
                onClicked: {
                    settings.login = false
                    app.logout()
                }
            }
        }
    }
}

