import QtQuick 2.0

Item {
    id: root

    property string url
    property string title
    property string titleBorderColor
    property Gradient titleGradient
    property string buttonBorderColor
    property Gradient buttonGradient
    property var lights

    Column
    {
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 20
        height: parent.height

        LightsTitleButton {
            titleText: title
            height: parent.height / 3
            width: parent.width
            border.color: titleBorderColor
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#7D746A" }
                GradientStop { position: 1.0; color: "#625768" }
            }

            onActivated: {
                for (var i=0; i < root.lights.length; i++) {
                    callUrlFunction(root.url, lights[i]['id'])
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height - parent.height / 3
            spacing: 10

            Repeater {
                id: rep

                model: lights
                GradientButton {
                    radius: 5

                    Image {
                        source: "/img/%1.png".arg(modelData['lamps'])
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        height: parent.height - 10
                    }
                    height: parent.height
                    width: (parent.width - 10 * (rep.count - 1)) / rep.count
                    border.color: buttonBorderColor
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#7D746A" }
                        GradientStop { position: 1.0; color: "#625768" }
                    }

                    onActivated: {
                        callUrlFunction(root.url, modelData['id'])
                    }
                }
            }
        }
    }
}

