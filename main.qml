import QtQuick 2.2
import QtQuick.Window 2.1
import Qt.labs.settings 1.0

Window {
    id: mainWindow

    visible: true
    width: 360
    height: 360

    property string serviceUrl: "http://localhost/"

    Settings {
        property alias serviceUrl: mainWindow.serviceUrl
    }

    MenuBar {
        onCloseCall: Qt.quit()
        onSettingsCall: {
            setWindow.url = serviceUrl
            setWindow.visible = true
        }
    }

    SettingsWindow {
        id: setWindow
        anchors.centerIn: parent
        width: parent.width/1.5
        height: parent.height/5
        visible: false

        onSettingChanged: {
            serviceUrl = url
            visible = false
        }
    }
}
