pragma Singleton
import QtQuick 2.0

QtObject {
    readonly property string iconFontFamily: "FontAwesome"
    readonly property string textFontFamily: "FontAwesome"

    readonly property real titleFontSize: 20
    readonly property real subheadFontSize: 16
    readonly property real bodyFontSize: 14
	readonly property real captionFontSize: 12

    readonly property color displayTextColor: "#2E0D23"
    readonly property color bodyTextColor: "#de2E0D23"
    readonly property color backgroundColor: Qt.lighter("#F8E4C1", 1.2)
    readonly property color themeColor: "#F54828" //"#fc1a1c"
    readonly property color themeTextColor: "#FFFFFF"
    readonly property color themeBorderColor: "#F7803C" //Qt.lighter(themeColor, 1.1)

    readonly property real largeMargin: 16 * dp
    readonly property real smallMargin: 8 * dp
}
