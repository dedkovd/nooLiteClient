import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: mainWindow

    visible: true
    width: 600
    height: 800

    property string serviceUrl: "http://rpi2.local"

    Settings {
        property alias serviceUrl: mainWindow.serviceUrl
    }

    toolBar: ToolBar {
//        height: 96

        style: ToolBarStyle {
                padding {
                    left: 8
                    right: 8
                    top: 3
                    bottom: 3
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    color: "#3C3C3C"
                }
            }

        RowLayout {
            anchors.fill: parent
            anchors.margins: 15
            MenuBackButton {
              id: menuBackButton

              width: 48
              height: 48

              onActivated: {
                  if (setWindow.state == "hidden") {
                      setWindow.url = serviceUrl
                  }
                  setWindow.changeState()
              }
            }

            Text {
                text: qsTr("Lights control")
                font.pointSize: 15
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                renderType: Text.NativeRendering
                Layout.fillWidth: true
            }

            ToolButton {
                width: parent.height*5

                iconSource: "/img/Exit.png"
                onClicked: Qt.quit();
            }
        }
    }

    CentralForm {
        id: centralForm
        anchors.fill: parent
    }

    SettingsWindow {
        id: setWindow

        width: parent.width/1.5
        height: parent.height
        state: "hidden"

        onSettingChanged: {
            serviceUrl = url
            centralForm.refresh(serviceUrl)
        }
    }

    Component.onCompleted: {
        centralForm.refresh(serviceUrl)
    }
}
