import QtQuick 2.0
import QtQuick.Controls 1.1

Item {
    id: root
    property string url
    property var buttons

    Row {
        id: row
        width: root.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Repeater {
            id: repeater

            model: buttons

            delegate: SmallButton {
                height: root.height - 15
                width: (row.width - 10 * (repeater.count - 1))/ repeater.count
                border.color: "#534857"
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#7D746A" }
                    GradientStop { position: 1.0; color: "#625768" }
                }
                title: modelData['channelName']

                onActivated: {
                    callUrlFunction(root.url, modelData['id'])
                }
            }
        }
    }
}
