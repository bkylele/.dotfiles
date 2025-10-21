import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

// TODO Change to be a reusable component
Item {
    id: root
    implicitWidth:  bg.implicitWidth
    implicitHeight: bg.implicitHeight

    property var workspaces: {
        // figuring out whats in this list
        // for (var i = 0; i < Hyprland.workspaces.values.length; i++) {
        //     console.log(Hyprland.workspaces.values[i].id)
        // }
        // console.log("\n")
        return Hyprland.workspaces.values
    }

    // Rectangle {
    //     id: bg
    //     anchors.centerIn: parent
    //     implicitWidth:  170
    //     implicitHeight: 35
    //     radius: 15
    //     // opacity: 0.7
    //     color: "#222222"
    // }

    // TODO use PathView to group every 5 workspaces
    RowLayout {
        anchors.centerIn: parent
        spacing: 10
        // opacity: 1

        Repeater {
            model: 5

            delegate: Rectangle {
                width:  20
                height: 20
                radius: 10

                Rectangle {
                    anchors.centerIn: parent
                    width:  12
                    height: 12
                    radius: 6
                    opacity: {
                        for (var i = 0; i < workspaces.length; i++) {
                            if (index + 1 == workspaces[i].id && workspaces[i].focused) {
                                return 1
                            }
                        }
                        return 0
                    }
                    color: "#222222"
                    Behavior on opacity{ NumberAnimation { } }
                }

                color: {
                    for (var i = 0; i < workspaces.length; i++) {
                        if (index + 1 == workspaces[i].id) {
                            return "white"
                        }
                    }
                    return "gray"
                }

                Behavior on color { ColorAnimation { } }
            }
        }
    }
}
