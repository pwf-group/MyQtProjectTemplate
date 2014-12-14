import QtQuick 2.0
import UIConstants 1.0

Item {
    id: control

    property alias leftItem: leftItem.data
    property alias rightItem: rightItem.data
    property alias mainItem: mainItem.data

    property int sensitivity: 5 * dp
    signal clicked
    signal clickedLeft
    signal clickedRight

    state: "main" // "left" "right"

    Item {
        id: leftItem
        width: parent.height
        height: parent.height
        anchors.left: parent.left

        PaperRipple {
            id: rippleLeft
            radius: 3 * dp
            mouseArea: mouseAreaLeft
        }

        MouseArea {
            id: mouseAreaLeft
            anchors.fill: parent
            onClicked: control.clickedLeft()
        }
    }

    Item {
        id: rightItem
        width: parent.height
        height: parent.height
        anchors.right: parent.right

        PaperRipple {
            id: rippleRight
            radius: 3 * dp
            mouseArea: mouseAreaRight
        }

        MouseArea {
            id: mouseAreaRight
            anchors.fill: parent
            onClicked: control.clickedRight()
        }
    }

    PaperShadow {
        id: shadow
        anchors.fill: mainItem
        source: mainItem
        depth: 2
    }

    Rectangle {
        id: mainItem
        width: parent.width
        height: parent.height

        PaperRipple {
            id: ripple
            radius: 3 * dp
            mouseArea: mouseArea
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            drag.target: mainItem
            drag.axis: Drag.XAxis
            drag.minimumX: -mainItem.width/2
            drag.maximumX: mainItem.width/2

            property int __lastX: -1

            onPressed: __lastX = mouse.x
            onReleased: control.onDragRelease(mouse.x - __lastX)
            onClicked: control.clicked()
        }

        Behavior on x { NumberAnimation{ duration: 300 } }
    }

    states: [
        State {
            name: "main"
            PropertyChanges { target: mainItem; x: 0 }
        },
        State {
            name: "left"
            PropertyChanges { target: mainItem; x: leftItem.width }
        },
        State {
            name: "right"
            PropertyChanges { target: mainItem; x: -rightItem.width }
        }
    ]

    function onDragRelease(dx) {
        var dragType

        if( dx < -sensitivity )
            dragType = 2 // left
        else if( dx > sensitivity )
            dragType = 1 // right
        else
            dragType = 0

        //console.log(state + " " + dragType + " " + sensitivity + " " + dx)
        switch(state) {
        case "main":
            state = "null"
            if( dragType === 2 )
                state = "right"
            else if( dragType === 1 )
                state = "left"
            else
                state = "main"
            break;
        case "left":
            state = "null"
            if( dragType === 2)
                state = "main"
            else
                state = "left"
            break;
        case "right":
            state = "null"
            if( dragType === 1)
                state = "main"
            else
                state = "right"
            break;
        }
    }
}
