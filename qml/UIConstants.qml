pragma Singleton
import QtQuick 2.0

QtObject {

    readonly property string sansFontFamily: "FontAwesome"
    readonly property string serifFontFamily: "FontAwesome"

    readonly property real captionFontSize: 12
    readonly property real bodyFontSize: 14
    readonly property real subheadFontSize: 16
    readonly property real titleFontSize: 20
    readonly property real headlineFontSize: 24
    readonly property real display1FontSize: 34
    readonly property real display2FontSize: 45
    readonly property real display3FontSize: 56
    readonly property real display4FontSize: 112

    readonly property color displayTextColor: "#8a000000"
    readonly property color bodyTextColor: "#de000000"
    readonly property color backgroundColor: "#eeeeee"
    readonly property color themeColor: "#e9e9ea" //"#fc1a1c"
    readonly property color themeTextColor: "#de000000"
    readonly property color themeBorderColor: Qt.lighter(themeColor, 1.1)

    readonly property real largeMargin: 16 * dp
    readonly property real smallMargin: 8 * dp

}
