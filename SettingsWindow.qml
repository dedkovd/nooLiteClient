import QtQuick 2.2
import QtQuick.Controls 1.1

Rectangle {
    id: root
    property string url: ""
    signal settingChanged()

    color: "#48525D"
    border.color: "#B0B0B0"

    function changeState()
    {
        if (state == "hidden")
        {
            state = "visible"
        }
        else
        {
            state = "hidden"
            settingChanged()
        }
    }

    Behavior on x { NumberAnimation { easing.type: Easing.OutQuad } }

    states: [
        State {
            name: "visible"
            PropertyChanges {
                target: root
                x: -1
            }
        },
        State {
            name: "hidden"
            PropertyChanges {
                target: root
                x: -width
            }
        }
    ]

    onSettingChanged: {
        urlText.focus = false
    }

    Column {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 15

        Text {
            color: "white"
            text: qsTr("Service URL:")
        }

        TextField {
            id: urlText
            width: parent.width

            text: url

            onTextChanged: {
                url = text
            }
        }
    }
}
