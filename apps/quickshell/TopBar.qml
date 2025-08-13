import QtQuick
import QtQuick.Layouts
import Quickshell


PanelWindow {
    id:             topBar
    implicitHeight: panelHeight
    implicitWidth:  Screen.width * 0.45
    anchors.top: true
    color: "#FFFFFF"

    property int collapsedHeight:   Screen.width * 0.01
    property int hoverHeight:       Screen.width * 0.02
    property int expandedHeight:    Screen.width * 0.25

    property int panelHeight:       expandedHeight
    property bool isExpanded:       true

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            if (!topBar.isExpanded)
            topBar.panelHeight = topBar.hoverHeight
        }
        onExited: {
            if (!topBar.isExpanded)
            topBar.panelHeight = topBar.collapsedHeight
        }
        onClicked: {
            topBar.isExpanded = !topBar.isExpanded
            topBar.panelHeight = topBar.isExpanded ? topBar.expandedHeight : topBar.hoverHeight
        }
    }

    GridLayout {
        visible: topBar.isExpanded
        anchors.centerIn: parent
        // anchors.fill: parent
        columnSpacing: 50
        rowSpacing: 0

        // TODO bluetooth
        // TODO battery
        // TODO sound
        // TODO wifi

        Calendar {
            Layout.column: 0
            Layout.row: 1
            // Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Clock {
            Layout.column: 0
            Layout.row: 0
            Layout.columnSpan: 3
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        } 

        Resources {
            Layout.column: 1
            Layout.row: 1
            // Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
    }

}
