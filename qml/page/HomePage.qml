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
}
