import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    width: 10
    height: 100

    property int memUsage: 0

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
        command: ["sh", "-c", "top -bn1 | grep 'MiB Mem' | awk '{printf $8/$4 * 100}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.memUsage = parseFloat(this.text)
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.centerIn: parent
        spacing: 4

        Item {
            Layout.minimumWidth: parent.width
            Layout.minimumHeight: parent.height
            Layout.alignment: Qt.AlignHCenter

            Rectangle {
                anchors.fill: parent
                color: "lightgray"
                radius: 5
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: Math.max( parent.height * root.memUsage / 100, 8 )
                color: "gray"
                radius: 5
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: " "
        }
    }

}

