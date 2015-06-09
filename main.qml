import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import FileIO 1.0

ApplicationWindow {
    title: qsTr("Show Contents of CPUinfo file")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Clear")
                onTriggered: helpText.text = "";
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    FileIO {
        id: myFile
        // this would be "/proc/cpuinfo" in the real app, but you get the idea hopefully
        source: "cpuinfo1.txt"
        onError: console.log(msg)
    }

    MainForm {
        id: helpScreen
        anchors.fill: parent

        button1.onClicked: { helpText.text =  myFile.read(); }


        Text {
            id: myText
        }

        Flickable {
              id: flickArea
               anchors.fill: parent
               anchors.bottomMargin: 120
               contentWidth: helpText.width; contentHeight: helpText.height
               flickableDirection: Flickable.VerticalFlick
               clip: true

               TextEdit{
                    id: helpText
                     wrapMode: TextEdit.Wrap
                     width:helpScreen.width;
                     readOnly:true
              }
          }
    }
}

