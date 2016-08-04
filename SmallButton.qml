import QtQuick 2.0

GradientButton {
    property string title

    radius: 5

    Gradient {
        id: pressedGradient

        GradientStop {position: 0.0; color: "#9d837e"}
        GradientStop {position: 0.5; color: "#9b807d"}
        GradientStop {position: 1.0; color: "#94787b"}
    }

    Column
    {
        anchors.fill: parent
        anchors.topMargin: 5
        spacing: 10
        Text {
            text: title
            width: parent.width
            horizontalAlignment: Image.AlignHCenter
            color: "white"
            font.pointSize: 12
            font.bold: true
            renderType: Text.NativeRendering
        }
        Rectangle {
            width: parent.width
            height: 1
            color: "#58514B"
        }
        Image {
            source: "/img/1.png"
            height: parent.height / 2
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }
    }
}

