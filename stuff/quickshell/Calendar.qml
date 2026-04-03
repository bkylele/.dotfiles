import QtQuick
import QtQuick.Layouts

Item {
    id: root
    width: 320
    height: 230

    property date currentMonth: new Date()

    property int daysInMonth: {
        // Retreive the # of days in the month by getting the 0th day of
        // the next month, equivalently the last day of this one.
        var d = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 0)
        return d.getDate()
    }
    property int daysInPrevMonth: {
        // Same as above, but retrieves days in the previous month
        var d = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), 0)
        return d.getDate()
    }
    property int firstDayOfMonth: {
        // Retrieve what day the first of the month lies on
        // 0 => Sunday, 1 => Monday, ...
        var d = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), 1)
        return d.getDay()
    }
    property int lastDayOfMonth: {
        // Last day of the month
        var d = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 0)
        return d.getDay()
    }

    function msUntilMidnight() {
        var now = new Date()
        var midnight = new Date(
            now.getFullYear(),
            now.getMonth(),
            now.getDate() + 1,
            0, 0, 0
        )
        return midnight - now
    }


    Timer {
        id: midnightTimer
        repeat: false
        running: true
        interval: msUntilMidnight()

        onTriggered: {
            // Update to today's date
            currentMonth = new Date()
            interval = msUntilMidnight()
            start()
        }
    }

    // Header with month name & navigation
    Row {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Rectangle {
            width: 24; height: 24
            color: "transparent"
            Text { anchors.centerIn: parent; text: "<" }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    currentMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1)
                }
            }
        }

        Text {
            text: Qt.formatDate(currentMonth, "MMMM yyyy")
            font.bold: true
            font.pixelSize: 16
        }

        Rectangle {
            width: 24; height: 24
            color: "transparent"
            Text { anchors.centerIn: parent; text: ">" }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    currentMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1)
                }
            }
        }
    }

    GridLayout {
        id: dayGrid
        columns: 7
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle{ width: 28; height: 28; Text { text: "Sun"; font.bold: true; anchors.centerIn: parent } Layout.alignment: Qt.AlignHCenter }
        Rectangle{ width: 28; height: 28; Text { text: "Mon"; font.bold: true; anchors.centerIn: parent } Layout.alignment: Qt.AlignHCenter }
        Rectangle{ width: 28; height: 28; Text { text: "Tue"; font.bold: true; anchors.centerIn: parent } Layout.alignment: Qt.AlignHCenter }
        Rectangle{ width: 28; height: 28; Text { text: "Wed"; font.bold: true; anchors.centerIn: parent } Layout.alignment: Qt.AlignHCenter }
        Rectangle{ width: 28; height: 28; Text { text: "Thu"; font.bold: true; anchors.centerIn: parent } Layout.alignment: Qt.AlignHCenter }
        Rectangle{ width: 28; height: 28; Text { text: "Fri"; font.bold: true; anchors.centerIn: parent } Layout.alignment: Qt.AlignHCenter }
        Rectangle{ width: 28; height: 28; Text { text: "Sat"; font.bold: true; anchors.centerIn: parent } Layout.alignment: Qt.AlignHCenter }

        // Fill out the grid with days of the previous month
        Repeater {
            model: firstDayOfMonth // empty slots before day 1
            delegate: Rectangle {
                width: 40; height: 28
                radius: 14
                border.color: "#808080"
                color: "transparent"

                Text {
                    color: "gray"
                    anchors.centerIn: parent
                    text: index + daysInPrevMonth - firstDayOfMonth + 1
                }
            }
        }

        // This month
        Repeater {
            model: daysInMonth
            delegate: Rectangle {
                width: 40; height: 28
                radius: 14
                color: {
                    var today = new Date()
                    var isToday =
                        today.getDate() === (index + 1) &&
                        today.getMonth() === currentMonth.getMonth() &&
                        today.getFullYear() === currentMonth.getFullYear()
                    return isToday ? "#ff6666" : "transparent"
                }
                border.color: "#808080"

                Text {
                    anchors.centerIn: parent
                    text: index + 1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Clicked day", index + 1)
                }
            }
        }

        // Next month
        Repeater {
            model: 6 - lastDayOfMonth // slots after last day of month

            delegate: Rectangle {
                width: 40; height: 28
                radius: 14
                border.color: "#888"
                color: "transparent"

                Text {
                    color: "gray"
                    anchors.centerIn: parent
                    text: index + 1
                }
            }
        }
    }
}
