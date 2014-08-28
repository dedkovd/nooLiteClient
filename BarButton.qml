import QtQuick 2.2

Image {
    width: parent.height
    height: parent.height

    signal buttonClicked()

    MouseArea {
        anchors.fill: parent
        onClicked: parent.buttonClicked()
    }
}
