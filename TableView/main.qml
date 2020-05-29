import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5
import TableModel 0.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TableView {
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: RoomTableModel {}

        delegate: Rectangle {
            implicitWidth: 300
            implicitHeight: 300
            border {
                color: "black"
                width: 2
            }

            Text {
                text: room
                font.pixelSize: 40
                anchors.centerIn: parent
            }
        }
    }

}
