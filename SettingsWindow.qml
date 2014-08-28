import QtQuick 2.2

Rectangle {
    property string url: ""
    signal settingChanged()

    color: "lightblue"
    radius: 10

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.settingChanged()
        }
    }

    TextInput {
        text: url
        onTextChanged: {
            url = text
        }
    }
}
