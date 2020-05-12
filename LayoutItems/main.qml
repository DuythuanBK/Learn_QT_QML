import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    GreenSquare {
        anchors.fill: parent

        BlueSquare {
            width: 12;
            anchors.fill: parent
            anchors.margins: 8
            text: '(1)'
        }

    }
}
