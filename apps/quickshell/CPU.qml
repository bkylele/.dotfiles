import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    width: 10
    height: 100

    property int cpuUsage: 0

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
        command: ["sh", "-c", "top -bn1 | grep Cpu | awk '{print 100 - $8}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.cpuUsage = parseFloat(this.text)
        }
    }

    // TODO boiyoiyoiyoing
    ColumnLayout {
        anchors.fill: parent
        anchors.centerIn: parent
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
                height: Math.max( parent.height * root.cpuUsage / 100, 8 )
                color: "gray"
                radius: 5
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: "   "
        }
    }

}

