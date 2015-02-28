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
                stackView.focus = true
                if(itemList.model.get(index).path !== "" ) {
                    stackView.pop(null)

                    if(index !== 0)
                        stackView.push(Qt.resolvedUrl(itemList.model.get(index).path))

                    navigationDrawer.toggle()
                }
                else if(itemList.count == index+1)
                    Qt.quit()
            }
        }
    }

    ListModel {
        id: itemModel
        ListElement { text: "Home"; icon: "\uf041"; path: "qrc:/page/HomePage.qml" }
        ListElement { text: "Settings"; icon: "\uf085"; path: "qrc:/page/SettingPage.qml" }
        ListElement { text: "Icon"; icon: "\uf1dd"; path: "qrc:/page/FontAwesomeIcon.qml" }
        ListElement { text: "Font"; icon: "\uf031"; path: "qrc:/page/FontFamilies.qml" }
        ListElement { text: "Exit"; icon: "\uf08b"; path: "" }
    }
}
