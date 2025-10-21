import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    width: 10
    height: 100

    property int temperature: 0

    Timer {
        interval: 4000
        repeat: true
        running: true
        onTriggered: {
            proc.running = true
        }
    }

    Process {
        id: proc
        command: ["sh", "-c", "sensors | awk '/^Package id 0:/ {print $4}' | tr -d '+°C'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.temperature = parseFloat(this.text)
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 4

        Item {
            Layout.minimumWidth: parent.width
            Layout.minimumHeight: parent.height
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Rectangle {
                anchors.fill: parent
                color: "lightgray"
                radius: 5
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: Math.max(Math.min((root.temperature - 35) * 2, 100), 10)
                color: {
                    if (root.temperature >= 75) { return "red" }
                    if (root.temperature >= 55) { return "orange" }
                    return "lightblue"
                }
                radius: 5
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "  "
        }
    }

}

