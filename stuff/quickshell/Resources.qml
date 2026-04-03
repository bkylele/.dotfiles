import QtQuick
import QtQuick.Layouts

Item {
    width: 75
    height: 125

    RowLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

        spacing: 18
        CPU         { Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter }
        Memory      { Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter }
        Temperature { Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter }
    }
}

