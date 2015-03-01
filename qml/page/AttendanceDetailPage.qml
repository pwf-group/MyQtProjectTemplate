import QtQuick 2.3
import "../material_ui" as MaterialUI

Item {
    property string name
    property string table
    property string group

    Column {
        spacing: 10 * dp
        MaterialUI.Label {
            text: name
        }
        MaterialUI.Label {
            text: table
        }
        MaterialUI.Label {
            text: group
        }
    }
}

