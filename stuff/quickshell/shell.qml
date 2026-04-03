import QtQuick
import Quickshell
import Quickshell.Wayland

ShellRoot {
    PanelWindow {
        id: root
        color: "#44FF0000" // transparent red to see the affected zone
        exclusiveZone: 0

        anchors.top: true
        anchors.bottom: isExpanded

        // implicitWidth: isExpanded ? 600 : 200
        implicitWidth: 700
        implicitHeight: isExpanded ? 600 : isHovered ? 60 : 10

        property bool isHovered: false
        property bool isExpanded: false

        MouseArea {
            id: triggerZone
            implicitWidth: 200
            implicitHeight: 60
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: true
            visible: !root.isExpanded // Disable trigger when the menu is open

            onEntered: root.isHovered = true
            onExited: root.isHovered = false
        }

        Rectangle {
            id: circle
            color: "#88C0D0"

            implicitWidth: root.isExpanded ? 600 : 40
            // implicitWidth: 40
            implicitHeight: implicitWidth
            radius: implicitWidth / 2

            anchors.horizontalCenter: parent.horizontalCenter

            // y = -50: Hidden above the trigger zone
            // y = 10: Dropped down into view on hover
            // y = 0: Flush with the top of the centered window when expanded

            y: root.isExpanded ? 0 : (root.isHovered ? 10 : -50)
            // y: 10

            Behavior on y { NumberAnimation { duration: 250; easing.type: Easing.OutCubic } }
            Behavior on implicitWidth { NumberAnimation { duration: 250; easing.type: Easing.OutCubic } }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.isExpanded = !root.isExpanded;
                    if (!root.isExpanded) {
                        root.isHovered = triggerZone.containsMouse;
                    }
                }
            }
        }

    }
}
