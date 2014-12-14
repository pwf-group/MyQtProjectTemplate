import QtQuick 2.4
import QtQuick.Controls 1.3
import UIConstants 1.0
import "material_ui" as MaterialUI
import "page" as Page

ApplicationWindow {
    width: 640
    height: 480
    visible: true

    FontLoader{ source: "qrc:/qml/qml_bootstrap/fonts/fontawesome-webfont.ttf"}

    toolBar: MaterialUI.ActionBar {
        id: actionBar
        raised: true
        text: "Qt Template"
        z: 2

        MaterialUI.MenuBackIcon {
            id: menuBackIcon
            anchors.left: parent.left
            anchors.leftMargin: 16 * dp
            anchors.verticalCenter: parent.verticalCenter
            state: stackView.depth>1? "back":"menu"

            MaterialUI.PaperRipple {
                id: menuBackRipple
                anchors.fill: menuBackIcon
                anchors.margins: -13 * dp
                mouseArea: mouseAreaMenuBackIcon
            }

            MouseArea {
                id: mouseAreaMenuBackIcon
                anchors.fill: menuBackRipple
                onClicked: {
                    if( menuBackIcon.state == "menu")
                        navigationDrawer.state = "show"
                    else
                        stackView.pop()
                }
                onDoubleClicked: navigationDrawer.state = "show"
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("qrc:/qml/page/HomePage.qml")

        focus: true
        Keys.onReleased:
            if ((event.key === Qt.Key_Back || event.key === Qt.Key_Escape) && stackView.depth > 1) {
                stackView.pop();
                event.accepted = true;
            }
    }

    MaterialUI.FloatingNavigationDrawer {
        id: navigationDrawer
        z: 1
        cardData: Page.NavigationDrawerPage{}
    }
}
