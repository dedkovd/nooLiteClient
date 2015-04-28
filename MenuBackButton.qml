import QtQuick 2.0

Rectangle {
  id: root
  signal activated()

  color: "#3C3C3C"

  MouseArea {
    anchors.fill: parent
    onClicked: {
        menuBackIcon.state = menuBackIcon.state === "menu" ? "back" : "menu"
        root.activated()
    }
  }

  MenuBackIcon {
    id: menuBackIcon
    anchors.centerIn: parent
  }
}

