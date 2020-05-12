import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    
    Item {
        id: root
        anchors.fill: parent
        state: "analog"
        property int speed: 0

        SequentialAnimation {
            running: true
            loops: Animation.Infinite

            NumberAnimation { target: root; property: "speed"; to: 145; easing.type: Easing.InOutQuad; duration: 4000; }
            NumberAnimation { target: root; property: "speed"; to: 10; easing.type: Easing.InOutQuad; duration: 2000; }
        }

        Rectangle {
            id: analogButton
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width/2
            height: parent.height/4

            Text {
                text: qsTr("Analog")
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.state = "analog"
                }
            }
        }

        Rectangle {
            id: digitalButton
            anchors.bottom: parent.bottom
            anchors.left: analogButton.right
            anchors.right: parent.right
            height: analogButton.height

            Text {
                id: digitalButtonText
                text: qsTr("Digital")
                anchors.centerIn: parent

            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.state = "digital"
                }
            }
        }

        Loader {
            id: dialLoader
            anchors.top: parent.top
            anchors.bottom: analogButton.top
            anchors.left: parent.left
            anchors.right: parent.right

            onLoaded: {
                binder.target = dialLoader.item
            }
        }

        Binding {
            id: binder

            property: "speed"
            value: root.speed
        }

        states: [
            State {
                name: "analog"
                PropertyChanges { target: dialLoader; source: "Analog.qml" }
                PropertyChanges { target: analogButton; color: "green" }
                PropertyChanges { target: digitalButton; color: "gray" }
            },
            State {
                name: "digital"
                PropertyChanges { target: dialLoader; source: "Digital.qml" }
                PropertyChanges { target: analogButton; color: "gray" }
                PropertyChanges { target: digitalButton; color: "green" }
            }

        ]
    }

}
