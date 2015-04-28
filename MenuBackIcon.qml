import QtQuick 2.2

Item {
  id: root
  width: 36
  height: 36

  Rectangle {
    id: bar1
    x: 0
    y: 6
    width: 36
    height: 4
    antialiasing: true
  }

  Rectangle {
    id: bar2
    x: 0
    y: 16
    width: 36
    height: 4
    antialiasing: true
  }

  Rectangle {
    id: bar3
    x: 0
    y: 26
    width: 36
    height: 4
    antialiasing: true
  }

  property int animationDuration: 350

  state: "menu"
  states: [
    State {
      name: "menu"
    },

    State {
      name: "back"
      PropertyChanges { target: root; rotation: 180 }
      PropertyChanges { target: bar1; rotation: 45; width: 23; x: 17.5; y: 9 }
      PropertyChanges { target: bar2; width: 30; x: 3; y: 16}
      PropertyChanges { target: bar3; rotation: -45; width: 23; x: 17.5; y: 23 }
    }
  ]

  transitions: [
    Transition {
      RotationAnimation { target: root; direction: RotationAnimation.Clockwise; duration: animationDuration; easing.type: Easing.InOutQuad }
      PropertyAnimation { target: bar1; properties: "rotation, width, x, y"; duration: animationDuration; easing.type: Easing.InOutQuad }
      PropertyAnimation { target: bar2; properties: "rotation, width, x, y"; duration: animationDuration; easing.type: Easing.InOutQuad }
      PropertyAnimation { target: bar3; properties: "rotation, width, x, y"; duration: animationDuration; easing.type: Easing.InOutQuad }
    }
  ]
}
