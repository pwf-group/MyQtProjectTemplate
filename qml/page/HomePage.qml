import QtQuick 2.4
import QtQuick.Controls 1.3
import QtPositioning 5.3
import QtLocation 5.0
import "../material_ui" as MaterialUI

Item {
   id: root

//   MaterialUI.Label {
//       anchors.centerIn: parent
//       text: "Home Page"
//   }

    Map {
        id: maps
        anchors.fill: parent

        plugin: Plugin {
            id: plugin
            name: "osm"
        }

        center: QtPositioning.coordinate(3.072215, 101.699243)

        gesture.enabled: true

         MapCircle {
             id: myPosition
             color: "yellow"
             radius: 2000
             opacity: 0.3
             center: QtPositioning.coordinate(3.072215, 101.699243)
         }

        Component.onCompleted: {
            console.log(plugin.availableServiceProviders)
            maps.zoomLevel = 12
        }

        Behavior on zoomLevel { NumberAnimation{duration: 400} }
        Behavior on center { CoordinateAnimation{duration: 400} }
    }

    Text {
        anchors.top: parent.top
        text: maps.zoomLevel
    }
}
