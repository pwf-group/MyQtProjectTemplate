import QtQuick 2.3
import inlov.api 1.0
import "../material_ui" as MaterialUI

Item {
   id: root

   MaterialUI.Label {
       anchors.fill: parent
       anchors.margins: 10 * dp
       wrapMode: Text.WrapAnywhere
       text: InLovService.textDebug
   }

   Column {
       spacing: 10 * dp
       anchors.centerIn: parent
       MaterialUI.RaisedButton {
           enabled: !InLovService.loadBusy
           text: "PYL3ID"
           onClicked: InLovService.loadSecretCode("PYL3ID")
       }
       MaterialUI.RaisedButton {
           enabled: !InLovService.loadBusy
           text: "eventLink"
           onClicked: InLovService.loadEventLink("/weddings/-Jiqai32ieu30uN-EmKk/events/-JiI8Iud0b-fGV1e_R91")
       }
       MaterialUI.RaisedButton {
           enabled: !InLovService.loadBusy
           text: "Attendees"
           onClicked: InLovService.loadAttendees("-JiI8Iud0b-fGV1e_R91")
       }
   }
}
