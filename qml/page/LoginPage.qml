import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import UIConstants 1.0
import "../material_ui" as MaterialUI

Item {
    id: login
    property string login_passed: ""
    property alias username: username_value.text
    property alias pwd : password_value.text
    property alias error_message: error_msg.text

    Column {
        anchors.centerIn: parent
        spacing: 10 * dp

        TextField {
            id: username_value
            width: login.width>428*dp?300*dp:login.width*0.7
            font.pointSize: UIConstants.subheadFontSize
            onTextChanged: error_msg.text = "";
            placeholderText: "Username"

            Keys.onReleased: {
                if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
                    event.accepted = true
                    stackView.focus = true
                }
            }
        }

        TextField {
            id: password_value
            width: login.width>428*dp?300*dp:login.width*0.7
            font.pointSize: UIConstants.subheadFontSize
            echoMode: TextInput.Password
            onTextChanged: error_msg.text = "";
            placeholderText: "Password"

            Keys.onReleased: {
                if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
                    event.accepted = true
                    stackView.focus = true
                }
            }
        }

        Row {
            spacing: 5 * dp
            anchors.horizontalCenter: parent.horizontalCenter
            MaterialUI.RaisedButton {
                text: qsTr("Login")
                color: UIConstants.themeColor
                textColor: UIConstants.themeTextColor
                rippleColor: UIConstants.themeBorderColor
                onClicked: {
                    settings.login = true
                    app.login()
                }
            }
            MaterialUI.RaisedButton {
                text: qsTr("Cancel")
                color: UIConstants.themeColor
                textColor: UIConstants.themeTextColor
                rippleColor: UIConstants.themeBorderColor
                onClicked: Qt.quit()
            }
        }
        Row {
            spacing: 5 * dp
            MaterialUI.Label {
                id: error_msg
                color: "red"
            }
        }
    }
}

