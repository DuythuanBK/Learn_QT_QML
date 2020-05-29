import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "blue"

    Rectangle {
        anchors.top: parent.top
        anchors.right: parent.right
        width: 50; height: 30
        color: "cyan"
        MouseArea {
            anchors.fill: parent
            onClicked: UIBridge.hmiEvent(1)
        }
    }
}
