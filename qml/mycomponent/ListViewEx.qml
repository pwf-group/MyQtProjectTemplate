// reference from http://developer.nokia.com/community/wiki/Pull_to_Refresh_feature_in_QML
import QtQuick 2.3

ListView {
    id: root

    property int latency: 600
    property int rotationThreshold: 135
    property string pullMessageString: "Pull and hold to refresh..."
    property string releaseMessageString: "Release to refresh..."
    property alias pullIconText: pullIcon
    property alias pullLabelText: pullLabel

    signal refreshEvent()

    Item {
        property bool __puller : false

        id: pull
        width: parent.width
        opacity: -pullIcon.rotation / root.rotationThreshold
        y: -(root.contentY + pullIcon.height + labelRow.spacing)

        Row {
            id: labelRow
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: pullIcon.width / 2
            width: pullIcon.width + pullLabel.width + spacing

            Text {
                id: pullIcon
                smooth: true
                rotation: 2 * 360 * root.contentY / root.height
                onRotationChanged: {
                    if (pullIcon.rotation < -root.rotationThreshold){
                        if (!pullTimer.running && !pull.__puller)
                            pullTimer.restart()
                    }
                    else if (pullIcon.rotation > -root.rotationThreshold){
                        if (!pullTimer.running && pull.__puller)
                            pullTimer.restart()
                    }
                }

                Timer{
                    id: pullTimer
                    interval: root.latency

                    onTriggered: {
                        if(pullIcon.rotation < -root.rotationThreshold)
                            pull.__puller = true
                        else
                            pull.__puller = false
                    }
                }
            }

            Text {
                id: pullLabel
                text: {
                    if (pull.__puller)
                        return root.releaseMessageString

                    return root.pullMessageString
                }
            }
        }
    }

    onMovementEnded: {
        if (pull.__puller)
            root.refreshEvent()

        pull.__puller = false
        pullTimer.stop()
    }
}
