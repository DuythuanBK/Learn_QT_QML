import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ListView {
        id: view
        anchors.fill: parent
        anchors.margins: 20
        model: 100
        delegate: numberDelegate
        spacing: 5
        clip: false

        highlightRangeMode: ListView.StrictlyEnforceRange
        highlight: hightlightComponet
        highlightFollowsCurrentItem: false
        focus: true
//        orientation: ListView.Horizontal
    }

    Component {
        id: numberDelegate

        Item {
            width: ListView.view.width
            height: 40
            Text {
                text: index
                anchors.centerIn: parent
                font.pixelSize: 10
            }
        }
    }

    Component {
        id: hightlightComponet
        Item {
            id: name
            width: ListView.view.width
            height: ListView.view.currentItem.height
            y: ListView.view.currentItem.y


            Behavior on y {
                SequentialAnimation {
                    PropertyAnimation {
                        target: hightlightComponet; property: "opacity"; to: 0; duration:200
                    }
                    NumberAnimation { duration: 1 }

                    PropertyAnimation {
                        target: hightlightComponet; property: "opacity";  to: 1; duration: 200
                    }
                }
            }

            Box {
                anchors.fill: parent
                color: "greenyellow"
            }
        }
    }
}
