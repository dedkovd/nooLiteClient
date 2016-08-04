import QtQuick 2.0

Rectangle {
    id: root
    signal activated()

    Gradient {
        id: pressedGradient

        GradientStop {position: 0.0; color: "#847077"}
        GradientStop {position: 0.5; color: "#816d76"}
        GradientStop {position: 1.0; color: "#776273"}
    }

    states: [
        State {
            name: "pushed"
            when: button.pressed
            PropertyChanges {
               target: root
               gradient: pressedGradient
            }
        }
    ]

    MouseArea {
        id: button
        anchors.fill: parent

        onClicked: {
            root.activated()
        }
    }

    function callUrlFunction(url, channelId) {
        var request = new XMLHttpRequest()
        request.open('GET', url + '/noolite/switch/' + channelId)
        request.onreadystatechange = function()
        {
            if (request.readyState === XMLHttpRequest.DONE)
            {
                if (request.status && request.status === 200)
                {
                    var result = JSON.parse(request.responseText)
                    if (result['error'])
                    {
                        console.log(result['error'])
                    }
                }
                else
                {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
    }
}

