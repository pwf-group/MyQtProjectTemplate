import QtQuick 2.4

Item {
    id: root
    Flickable {
        anchors.fill: parent
        contentWidth: root.width
        contentHeight: settingItems.height

        Column {
            id: settingItems
            spacing: 10 * dp
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                margins: 10 * dp
            }

            SettingDisplayPage {
                id: settingDisplayPage
            }

            SettingStoragePage {
                id: settingStoragePage
            }

        }
    }
}

