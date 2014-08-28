import QtQuick 2.2
import QtQuick.Layouts 1.1

Rectangle {
    id: menuBar

    width: parent.width
    height: parent.height*0.15

    Image {
        anchors.fill: parent
        source: "toolbar.png"
    }

    signal settingsCall()
    signal refreshCall()
    signal closeCall()

    RowLayout {
        anchors.fill: parent        
        anchors.margins: 5
        spacing: 5

        BarButton {
            Layout.preferredHeight: menuBar.height - 10
            Layout.preferredWidth: menuBar.height - 10
            source: "settings.png"
            onButtonClicked: settingsCall()
        }

        BarButton {
            Layout.preferredHeight: menuBar.height - 10
            Layout.preferredWidth: menuBar.height - 10
            source: "refresh.png"
            onButtonClicked: refreshCall()
        }

        Rectangle {
            Layout.fillWidth: true
        }

        BarButton {
            Layout.preferredHeight: menuBar.height - 10
            Layout.preferredWidth: menuBar.height - 10
            source: "exit.png"
            onButtonClicked: closeCall()
        }
    }

}
