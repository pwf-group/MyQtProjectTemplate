import QtQuick 2.0
import UIConstants 1.0

Item {
    id: button
    width: 56 * dp
    height: 56 * dp

    property alias color: background.color
    property alias rippleColor: ripple.color
    property alias iconSource: icon.source
    property alias label: label

    signal clicked

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 28 * dp
        visible: false
        color: UIConstants.themeColor
    }

    PaperShadow {
        id: shadow
        source: background
        depth: button.enabled ? (mouseArea.pressed ? 4 : 2) : 0
    }

    PaperRipple {
        id: ripple
        radius: 28 * dp
        color: "#deffffff"
        mouseArea: mouseArea
    }

    Image {
        id: icon
        anchors.centerIn: parent
        width: 24 * dp
        height: 24 * dp
        sourceSize.width: width
        sourceSize.height: height
    }

    Text {
        id: label
        anchors.centerIn: parent
        font.family: UIConstants.iconFontFamily
        font.pointSize: UIConstants.titleFontSize
        color: UIConstants.themeTextColor
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: button.enabled
        onClicked: button.clicked()
    }
}
