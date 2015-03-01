import QtQuick 2.3
import QtQuick.Controls 1.3
import UIConstants 1.0
import inlov.api 1.0
import "../material_ui" as MaterialUI

Item {
    ScrollView {
        //anchors.fill: parent
        anchors {
            fill: parent
        }
        flickableItem.interactive: true
        GridView {
            anchors.fill: parent
            anchors.margins: 20 * dp
            cellWidth: 100 * dp
            cellHeight: 100 * dp
            model: InLovService.attendeesModel().tableModel()
            delegate: Rectangle {
                color: "#80ffffff"
                border.color: "#8a000000"
                width: 80 * dp
                height: 80 * dp
                radius: 50 * dp

                MaterialUI.Label {
                    anchors.centerIn: parent
                    text: modelData
                }

                MaterialUI.PaperRipple {
                    id: ripple
                    radius: 3 * dp
                    mouseArea: mouseArea
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        InLovService.attendeesModel().filterTable(modelData)
                        //stackView.push("qrc:/page/TableNameListPage.qml")
                    }
                }
            }
        }
    }
}

