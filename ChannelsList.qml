import QtQuick 2.0

ListView {
    function getChannels(url)
    {
        var request = new XMLHttpRequest()
        request.open('GET', url + '/channel/')
        request.onreadystatechange = function()
        {
            if (request.readyState === XMLHttpRequest.DONE)
            {
                if (request.status && request.status === 200)
                {
                    var result = JSON.parse(request.responseText)
                    model = result['objects']
                }
                else
                {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
    }

   /* section.property: 'group'
    section.delegate: Rectangle {
        width: parent.width
        height: 100
        color: 'lightgray'

        Text {
            text: modelData.group
            color: "white"
        }
    }*/

    delegate: Rectangle {
        width: parent.width
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        border {
            color: 'lightgray'
            width: 2
        }
        radius: 10

        Text {
            width: parent.width - parent.spacing
            anchors.verticalCenter: parent.verticalCenter
            elide: Text.ElideRight
            renderType: Text.NativeRendering
            text: modelData.channelName
            color: "white"
        }

        MouseArea {
            onClicked: {
                view.currentIndex = index
            }
        }
    }
}
