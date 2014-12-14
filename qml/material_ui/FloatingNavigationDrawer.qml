import QtQuick 2.0
import UIConstants 1.0

Rectangle {
    anchors.fill: parent
    state: "hide"
    focus: state=="hide"?false:true

    property int cardWidth: (parent.width-128*dp) < 400 * dp ? (parent.width-128*dp) : 400 * dp
    property int cardHeight: (parent.height-128*dp) < 400 * dp ? (parent.height-128*dp) : 400 * dp
    property int animationDelay: 300
    property alias cardData: cardItem.data

    Keys.onReleased:
        if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
            state = "hide"
            stackView.focus = true
            event.accepted = true;
        }

    PaperShadow {
        id: shadow
        anchors.fill: card
        source: card
        depth: 3
    }

    Rectangle {
        id: card
        width: 40 * dp
        height: 40 * dp
        radius: 2 * dp;
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 16 * dp
        anchors.topMargin: -70 * dp
    }

    Item {
        id: cardItem
        anchors.fill: card
        enabled: parent.state=="show"
        opacity: 0
    }

    MouseArea {
        id: mouseAreaBackground
        z: -1
        anchors.fill: parent
        enabled: parent.state == "hide"? false:true
        onClicked: {
            parent.state = "hide"
            stackView.focus = true
        }
    }
    color: mouseAreaBackground.enabled?"#55000000":"transparent"

    states: [
        State {
            name: "show"
            PropertyChanges { target: card; width: cardWidth; height: cardHeight; color: "white";
                                            anchors.leftMargin: (parent.width - card.width)/2; anchors.topMargin: 64*dp }
        }
    ]
    transitions: [
        Transition {
            from: "show"
            SequentialAnimation {
                NumberAnimation { target: cardItem; property: "opacity"; to: 0.0; duration: 100}
                NumberAnimation { properties: "width,height,anchors.leftMargin"; easing.type: Easing.InOutQuad; duration: animationDelay }
                NumberAnimation { properties: "anchors.topMargin"; easing.type: Easing.InCubic; duration: animationDelay }
            }
        },
        Transition {
            to: "show"
            SequentialAnimation {
                NumberAnimation { properties: "anchors.topMargin"; easing.type: Easing.OutCubic; duration: animationDelay }
                NumberAnimation { properties: "width,height,anchors.leftMargin"; easing.type: Easing.InOutQuad; duration: animationDelay }
                NumberAnimation { target: cardItem; property: "opacity"; to: 1.0; duration: 100}
            }
        }
    ]
}
