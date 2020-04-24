import QtQuick 2.0

Item {
    id: root
    property alias text: text.text
    property alias color: recBox.color

    Rectangle {
        id: recBox
        color: "greenyellow"
        width: 50; height: 50
        anchors.fill: parent
    }

    Text {
        id: text
        text: ""
        anchors.centerIn: parent
    }

}
