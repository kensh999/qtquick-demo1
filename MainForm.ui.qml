import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: item1
    width: 640
    height: 480

    property alias button1: button1

    RowLayout {
        anchors.verticalCenterOffset: 190
        anchors.horizontalCenterOffset: 8
        anchors.centerIn: parent

        Button {
            id: button1
            text: qsTr("Press to show CPUInfo")
        }
    }
}
