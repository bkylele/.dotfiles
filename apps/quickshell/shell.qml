import QtQuick
import QtQuick.Shapes
import Quickshell

ShellRoot {
    PanelWindow {
        anchors.top:    true
        anchors.left:   true
        anchors.right:  true

        implicitHeight: bg.implicitHeight

        color: "transparent"
        mask: Region { } // TODO passthrough everything fornow

        Shape {
            id: bg

            ShapePath {
                id: path
                strokeColor: "#181818"
                strokeWidth: 4
                fillColor: "#181818"

                PathArc  { relativeX: 15; relativeY:  15; radiusX: 15; radiusY: 15; direction: PathArc.Counterclockwise }
                PathLine { relativeX: Screen.width - 30; relativeY: 0; }
                PathArc  { relativeX: 15; relativeY: -15; radiusX: 15; radiusY: 15; direction: PathArc.Counterclockwise }
            }

            ShapePath {
                id: path2
                strokeColor: "#181818"
                strokeWidth: 4
                fillColor: "#181818"
                // fillColor: "red"

                startX: Screen.width / 2 - 100;
                startY: 15;

                property int ht:  0;
                property int rnd: 0;

                // PathArc  { relativeX: 15; relativeY:  15; radiusX: 15; radiusY: 15; direction: PathArc.Counterclockwise }
                PathArc  { relativeX: 15; relativeY:  15; radiusX: 15; radiusY: 15; direction: PathArc.Counterclockwise }
                PathLine { relativeX: 0; relativeY: path2.ht; }
                PathArc  { relativeX: path2.rnd; relativeY:  path2.rnd; radiusX: path2.rnd; radiusY: path2.rnd; direction: PathArc.Counterclockwise }
                PathLine { relativeX: 165; relativeY: 0; }
                PathArc  { relativeX: path2.rnd; relativeY: -path2.rnd; radiusX: path2.rnd; radiusY: path2.rnd; direction: PathArc.Counterclockwise }
                PathLine { relativeX: 0; relativeY: -path2.ht; }
                PathArc  { relativeX: 15; relativeY: -15; radiusX: 15; radiusY: 15; direction: PathArc.Counterclockwise }
                // PathArc  { relativeX: 15; relativeY: -15; radiusX: 15; radiusY: 15; direction: PathArc.Counterclockwise }
            }
        }
         
        // // Battery
        // Text {
        //     anchors.right: workspaces.left
        //     color: "white"
        //     text: "65% 󰁹"
        // }

        // // Small Clock
        // Text {
        //     anchors.left: workspaces.right
        //     color: "white"
        //     property var now: new Date()
        //     Timer {
        //         interval: 1000; repeat: true; running: true
        //         onTriggered: parent.now = new Date()
        //     }
        //     text: "  " + now.toLocaleTimeString(Qt.locale("en_US"), Locale.ShortFormat)
        // }

        Workspaces {
            id: workspaces
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
