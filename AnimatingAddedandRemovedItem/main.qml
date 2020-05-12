import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#dbddde" }
            GradientStop { position: 1.0; color: "#5fc9f8" }
        }

        ListModel {
            id: theModel

            ListElement {number: 0}
            ListElement {number: 1}
            ListElement {number: 2}
            ListElement {number: 3}
            ListElement {number: 4}
            ListElement {number: 5}
            ListElement {number: 6}
            ListElement {number: 7}
            ListElement {number: 8}
            ListElement {number: 9}
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 20

            height: 40
            color: "#53d769"
            border.color: Qt.lighter(color, 1.1)

            Text {
                anchors.centerIn: parent
                text: "Add item!"

            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    theModel.append({"number": ++parent.count})
                }
            }

            property int count: 9
        }

        GridView {
            anchors.fill: parent
            anchors.margins: 20
            anchors.bottomMargin: 80
            clip: true

            model: theModel
            cellHeight: 45; cellWidth: 45
            delegate: numberDelegate

        }

        Component {
            id: numberDelegate

            Rectangle {
                id: wrapper
                width: 40; height: 40

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#f8306a" }
                    GradientStop { position: 1.0; color: "#fb5b40" }
                }

                Text {
                    anchors.centerIn: parent
                    font.pixelSize: 10
                    text: number
                }

                MouseArea {
                    id: mouseEvent
                    anchors.fill: parent

                    onClicked: {
                        console.log(index)
                        theModel.remove(index)
                    }
                }

                GridView.onRemove: SequentialAnimation {

                    PropertyAction {
                        target: wrapper; property: "GridView.delayRemove"; value: true
                    }
                    PropertyAction {
                        target: mouseEvent; property: "enabled"; value: false
                    }
                    NumberAnimation {
                        target: wrapper; property: "scale"; to: 0; duration: 250;
                        easing.type: Easing.InOutQuad
                    }
                    PropertyAction {
                        target: wrapper; property: "GridView.delayRemove";
                        value: false }
                    PropertyAction {
                        target: mouseEvent; property: "enabled"; value: true
                    }
                }

                GridView.onAdd: SequentialAnimation {
                    NumberAnimation {
                        target: wrapper; property: "scale"; from: 0; to:
                            1; duration: 250; easing.type: Easing.InOutQuad }
                }
            }
        }


    }
}
