import QtQuick 2.4
import QtQuick.Controls 1.3

Item {
    anchors.fill: parent

    ListView {
        id: itemList
        model: itemModel
        anchors.fill: parent
        anchors.topMargin: 48 * dp
        anchors.bottomMargin: 48 * dp
        boundsBehavior: Flickable.StopAtBounds

        delegate: NavigationDrawerStyle {
            onItemClicked: {
                //itemList.model.get(index).text = "Item clicked";
                if(itemList.model.get(index).path !== "" ) {
                    stackView.pop(null)
                    stackView.push(Qt.resolvedUrl(itemList.model.get(index).path))
                }
            }
        }
    }

    ListModel {
        id: itemModel
        ListElement { text: "FontAwesomeIcon"; icon: "\uf18c"; path: "qrc:/page/FontAwesomeIcon.qml" }
        ListElement { text: "Setting"; icon: "\uf013"; path: "qrc:/page/SettingPage.qml" }
    }
}
