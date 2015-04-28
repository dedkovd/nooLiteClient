import QtQuick 2.2

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

    Column {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 15

        Text {
            color: "white"
            text: qsTr("Service URL:")
        }

        Rectangle
        {
            width: parent.width
            height: 25
            color: "#3C3C3C"
            radius: 5
            border.color: urlText.focus ? "steelblue" : "white"

            TextInput {
                id: urlText
                color: "white"
                anchors.fill: parent
                anchors.margins: 5

                text: url
                onTextChanged: {
                    url = text
                }
            }
        }
    }
}
