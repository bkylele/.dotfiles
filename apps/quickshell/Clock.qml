import QtQuick
import QtQuick.Window

pragma ComponentBehavior: Bound


Item {
    id: root
    width: 130
    height: 130

    property var now: new Date()
    property int totalDots: 60

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            root.now = new Date()
        }
    }

    // Clock Face
    Item {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        Column {
            anchors.centerIn: parent

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 28
                text: {
                    var h = root.now.getHours() % 12
                    if (h == 0) { return 12 }
                    return h < 10 ? "0" + h : h
                }
                font.bold: true
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 28
                text: {
                    var m = root.now.getMinutes() 
                    return m < 10 ? "0" + m : m
                }
                opacity: 0.8
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 14
                text: Qt.formatDate(root.now, "ddd, d")
            }
        }

        Repeater {
            model: root.totalDots
            delegate: Rectangle {
                required property int index // received from the "Repeater" type
                width: 4
                height: 4
                radius: 2

                color: index < root.now.getSeconds() ? "black" : "lightgray"
                x: (parent.width / 2) + Math.cos((index / 60) * 2 * Math.PI + 1.5*Math.PI) * 60
                y: (parent.height / 2) + Math.sin((index / 60) * 2 * Math.PI + 1.5*Math.PI) * 60
            }
        }
    }
}

