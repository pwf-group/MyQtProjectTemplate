import QtQuick 2.3
import QtQuick.Controls 1.2
import Qt.labs.settings 1.0
import UIConstants 1.0
import "material_ui" as MaterialUI
import "mycomponent" as MyComponent
import "page" as Page

ApplicationWindow {
    id: app
    width: 640
    height: 480
    visible: true
    color: UIConstants.backgroundColor

    FontLoader{ source: "qrc:/qml_bootstrap/fonts/fontawesome-webfont.ttf"}

    Settings {
        id: settings
        property bool login: false
    }

    toolBar: MaterialUI.ActionBar {
        id: actionBar
        raised: true
        text: "myQtTemplate"
        z: 2
        visible: false

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
                    stackView.focus = true
                    if( menuBackIcon.state == "menu")
                        navigationDrawer.toggle()
                    else
                        stackView.pop()
                }
                onDoubleClicked: navigationDrawer.show()
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        focus: true
        Keys.onReleased: {
            if( event.key === Qt.Key_Back || event.key === Qt.Key_Escape )
            {
                if (navigationDrawer.open) {
                    navigationDrawer.toggle()
                    event.accepted = true;
                }
                else if (stackView.depth > 1) {
                    stackView.pop();
                    event.accepted = true;
                }
                else {
                    navigationDrawer.toggle()
                    event.accepted = true;
                }
            }
        }
    }

    Timer {
        id: timer
        interval: 300; running: false; repeat: false
        // separate push this so that it won't initialize connection too early
        onTriggered: {
            if( settings.login ) login()
            else stackView.push(Qt.resolvedUrl("qrc:/page/LoginPage.qml"))
        }
    }
    Component.onCompleted: {
        timer.start()
    }

    MyComponent.NavigationDrawer {
        id: navigationDrawer
        enabled: false
        color: UIConstants.backgroundColor
        opacity: 0.95
        width: 250 * dp
        _rootItem: parent // hack parameter to make it behave the way I need
        z: 4 // hack parameter to make it behave the way I need
        _openMarginSize: 15 * dp // hack parameter to make it behave the way I need
        data: Page.NavigationDrawerPage{}
    }

    MyComponent.Toast {
        id: toast_message
        objectName: "toast_message"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40 * dp
    }

    function login() {
        navigationDrawer.enabled = true
        actionBar.visible = true
        stackView.focus = true
        stackView.clear()
        stackView.push(Qt.resolvedUrl("qrc:/page/HomePage.qml"))
    }
    function logout() {
        navigationDrawer.enabled = false
        actionBar.visible = false
        stackView.focus = true
        stackView.clear()
        stackView.push(Qt.resolvedUrl("qrc:/page/LoginPage.qml"))
    }
}
