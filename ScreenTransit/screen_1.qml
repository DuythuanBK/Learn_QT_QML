import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "red"

    Text {
        anchors.centerIn: parent
        text: "First screen"
    }

    Rectangle {
        anchors.top: parent.top
        anchors.right: parent.right
        width: 50; height: 30
        color: "yellow"
        MouseArea {
            anchors.fill: parent
            onClicked: UIBridge.hmiEvent(2)
        }
    }
}
