import Quickshell

PanelWindow {
    anchors.top: true
    // anchors.bottom: true
    // anchors.left: true
    // anchors.right: true

    color: "transparent"
    implicitWidth:  workspaces.implicitWidth
    implicitHeight: workspaces.implicitHeight
    margins.top: 10
    mask: Region { item: workspaces }

    Workspaces {
        id: workspaces
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
