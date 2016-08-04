import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id: root
    property bool isLoading: true

    color: "#3C3C3C"

    function refresh(url)
    {
        root.isLoading = true
        groups.model = null
        ungroupedChannels.buttons = null

        var request = new XMLHttpRequest()
        request.open('GET', url + '/static/channels.js')
        request.onreadystatechange = function()
        {
            if (request.readyState === XMLHttpRequest.DONE)
            {
                if (request.status && request.status === 200)
                {
                    var result = JSON.parse(request.responseText)
                    groups.model = result['groups']
                    ungroupedChannels.buttons = result['objects']
                }
                else
                {
                    groups.model = null
                    ungroupedChannels.buttons = null
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
            root.isLoading = false
        }
        request.send()
    }

    Column {
        anchors.fill: parent
        spacing: 10

        Repeater {
            id: groups

            ChannelsGroup {
                url: serviceUrl
                height: root.height / 4
                width: root.width

                title: modelData['groupName']
                lights: modelData['channels']
            }
        }

        UngroupedChannels {
            id: ungroupedChannels
            url: serviceUrl
            width: root.width
            height: root.height - groups.count * (root.height / 4 + 10)
        }
    }

    BusyIndicator {
        anchors.centerIn: root
        visible: root.isLoading
    }
}

