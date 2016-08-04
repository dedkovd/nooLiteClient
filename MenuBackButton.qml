import QtQuick 2.0

Rectangle {
  id: root
  signal activated()

  color: "#3C3C3C"

  MouseArea {
    anchors.fill: parent
    onClicked: {        
        root.activated()
    }
  }

  onActivated: {
      menuBackIcon.state = menuBackIcon.state === "menu" ? "back" : "menu"
  }

  MenuBackIcon {
    id: menuBackIcon
    anchors.centerIn: parent
  }
}

