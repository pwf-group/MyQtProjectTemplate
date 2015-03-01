import QtQuick 2.3
import inlov.api 1.0
import "../material_ui" as MaterialUI

Item {
   id: root

   Column {
       anchors.centerIn: parent
       spacing: 10 * dp
       MaterialUI.Label {
           text: InLovService.eventDetails().eventName
       }
       MaterialUI.Label {
           text: InLovService.eventDetails().description
       }
       MaterialUI.Label {
           text: InLovService.eventDetails().venue
       }
   }

   ListView {
       anchors.fill: parent
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

   Column {
       spacing: 10 * dp
       anchors.centerIn: parent
       MaterialUI.RaisedButton {
           enabled: !InLovService.loadBusy
           text: "PYL3ID"
           //onClicked: InLovService.loadSecretCode("PYL3ID")
           onClicked: InLovService.serviceLogin("PYL3ID")
       }

       MaterialUI.Label {
           text: InLovService.eventDetails().eventName
       }
   }
}
