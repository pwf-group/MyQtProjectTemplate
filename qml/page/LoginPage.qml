import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import UIConstants 1.0
import "../material_ui" as MaterialUI

Item {
    id: login

    Column {
        anchors.centerIn: parent
        spacing: 10 * dp

        TextField {
            id: secret_code_Value
            width: login.width>428*dp?300*dp:login.width*0.7
            font.pointSize: UIConstants.subheadFontSize
            placeholderText: "Secret Code"
            text: "PYL3ID"

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
                    settings.secretCode = secret_code_Value.text
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
    }
}

