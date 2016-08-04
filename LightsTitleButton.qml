import QtQuick 2.0

GradientButton {
    property string titleText

    Image {
        source: "/img/Off.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        fillMode: Image.PreserveAspectFit
        height: parent.height - 10
    }

    Text {
        anchors.fill: parent
        text: titleText
        font.pointSize: 25
        color: "white"
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        renderType: Text.NativeRendering
    }
}

