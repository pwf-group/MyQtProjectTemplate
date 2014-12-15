import QtQuick 2.0

Rectangle {
    id: root

    property int imageWidth: 340
    property int imageHeight: 260
    property color background: "black"
    property alias model: view.model // image will use name imagePath

    signal currentItemClicked(int index)

    anchors.fill: parent
    color: background

    Component {
        id: myDelegate
        Item {
            property real tmpAngle : PathView.rotateY
            property real scaleValue: PathView.scalePic
            width: imageWidth; height: imageHeight
            visible: PathView.onPath
            z: PathView.zOrder

            Image{
                id:myImage
                width: imageWidth
                height: imageHeight
                source: imagePath
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true
            }

            Image {
                id: subImage
                width: imageWidth
                height: imageHeight
                source: imagePath
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true
                transform: Rotation { origin.x: 0; origin.y: imageHeight; axis { x: 1; y: 0; z: 0 } angle: 180 }
            }

            Rectangle{
                y: -1 + myImage.height + (myImage.height-myImage.paintedHeight)/2;
                x: -1 + (myImage.width-myImage.paintedWidth)/2;
                width: myImage.paintedWidth + 2
                height: myImage.paintedHeight + 2
                opacity: 0.7
                gradient: Gradient {
                    GradientStop { position: 0.0; color: background }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if( view.currentIndex == index )
                        currentItemClicked(index)
                }
            }

            transform: [
                Rotation {
                    angle: tmpAngle
                    origin.x: imageWidth/2
                    axis { x:0; y:1; z: 0 }
                },
                Scale {
                    xScale: scaleValue
                    yScale: scaleValue
                    origin.x: imageWidth/2
                    origin.y: imageHeight/2
                }
            ]
        }
    }

    PathView {
        id: view
        delegate: myDelegate
        anchors.fill: parent
        pathItemCount: 13

        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightRangeMode: PathView.StrictlyEnforceRange

        path: myPath
    }

    Path {
        id: myPath

        startX: view.width*0; startY: view.height/3
        PathAttribute {name: "rotateY"; value: 50.0}
        PathAttribute {name: "scalePic"; value: 0.5}
        PathAttribute {name: "zOrder"; value: 1}

        PathLine{x:view.width*0.28125; y: view.height/3}
        PathPercent {value: 0.44}
        PathAttribute {name: "rotateY"; value: 50.0}
        PathAttribute {name: "scalePic"; value: 0.5}
        PathAttribute {name: "zOrder"; value: 10}

        PathQuad{x:view.width*0.5; y: view.height*0.425; controlX: view.width*0.453125; controlY: view.height*0.425}
        PathPercent {value: 0.50}
        PathAttribute {name: "rotateY"; value: 0.0}
        PathAttribute {name: "scalePic"; value: 1.0}
        PathAttribute {name: "zOrder"; value: 50}

        PathQuad{x:view.width*0.71875; y: view.height/3; controlX: view.width*0.796875; controlY: view.height/3}
        PathPercent {value: 0.56}
        PathAttribute {name: "rotateY"; value: -50.0}
        PathAttribute {name: "scalePic"; value: 0.5}
        PathAttribute {name: "zOrder"; value: 10}

        PathLine{x:view.width*1; y: view.height/3}
        PathPercent {value: 1.00}
        PathAttribute {name: "rotateY"; value: -50.0}
        PathAttribute {name: "scalePic"; value: 0.5}
        PathAttribute {name: "zOrder"; value: 1}
    }
}
