import QtQuick 2.3
import QtQuick.Controls 1.3
import UIConstants 1.0
import inlov.api 1.0
import "../material_ui" as MaterialUI

Item {
    id: root

    MaterialUI.Card {
        id: card
        z: 1
        anchors.fill: searchField
        anchors.margins: -15 * dp
    }

    TextField {
        id: searchField
        width: parent.width - 60 * dp
        z: 2
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 30 * dp
        }
        placeholderText: "Search name or group here"
        font.pointSize: UIConstants.subheadFontSize
        onTextChanged: InLovService.attendeesModel().filterText(searchField.text)
    }

    ListView {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: card.bottom
            margins: 10 * dp
        }

        spacing: 10 * dp
        model: InLovService.attendeesModel()
        delegate: Column {
            MaterialUI.Label {
                text: model.name
            }

            MaterialUI.Label {
                text: model.group
            }
        }
    }
}

