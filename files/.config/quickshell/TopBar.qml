import QtQuick
import QtQuick.Layouts
import Quickshell

import Quickshell.Hyprland

PanelWindow {
    id: root
    anchors.top: true
    color: "transparent"
    // implicitWidth: 400
    implicitWidth: topBar.panelWidth
    implicitHeight: topBar.panelHeight

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 15

        // Workspaces {
        //     id: workspaces
        //     anchors.centerIn: parent 
        // }

        Item {
            id: topBar
            anchors.fill: parent

            property int expandedHeight:    childLayout.implicitHeight
            property int collapsedHeight:   Screen.width * 0.02

            property int panelWidth:        workspaces.width + 40
            property int panelHeight:       collapsedHeight
            property bool pinned:           false
            // property bool pinned:           true
            // state: "expanded"

            MouseArea {
                id: hoverArea
                anchors.fill: parent
                hoverEnabled: true

                onEntered:  { if (!topBar.pinned) topBar.state = "expanded" }
                onExited:   { if (!topBar.pinned) topBar.state = "collapsed" }
                onClicked:  { topBar.pinned = !topBar.pinned }
            }

            states: [
                State {
                    name: "expanded"
                    PropertyChanges { target: topBar; panelHeight: topBar.expandedHeight }
                    PropertyChanges { target: topBar; panelWidth:  childLayout.implicitWidth }
                    PropertyChanges { target: childLayout; visible: true }
                    PropertyChanges { target: workspaces; visible: false }
                },
                State {
                    name: "collapsed"
                    PropertyChanges { target: topBar; panelHeight: topBar.collapsedHeight }
                    PropertyChanges { target: topBar; panelWidth:  workspaces.width + 40 }
                    PropertyChanges { target: childLayout; visible: false }
                    PropertyChanges { target: workspaces; visible: true }
                }
            ]

            GridLayout {
                id: childLayout
                anchors.centerIn: parent
                visible: false

                // Workspaces {
                //     Layout.column: 0
                //     Layout.row: 0
                //     Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                // }

                Clock {
                    Layout.column: 0
                    Layout.row: 0
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

            }

        }

    }
}
