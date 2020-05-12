import QtQuick 2.13
import QtQuick.Window 2.13

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Item {
        id: clock
        width: 400
        height: 400
        anchors.top: parent.top
        x: parent.width/2 - width/2
        Rectangle {
            id: analogClock
            anchors.fill: parent
            radius: 200
            color: "lightGray"

            property int x0: analogClock.x + analogClock.width/2
            property int y0: analogClock.y + analogClock.height/2

            property int hourAngle: -90
            property int secAngle: -90
            property int minAngle: -90

            property int hour: 0
            property int min: 0
            property int sec: 0

            Rectangle {
                width: 25; height: 25
                color: "Green"
                anchors.centerIn: parent
                radius: width/2
            }

            Repeater {
                model: 60
                Rectangle {
                    width: 15; height: 2
                    x: analogClock.x0 + (190 * Math.cos(6*index*Math.PI/180)) - width/2
                    y: analogClock.y0 + (190 * Math.sin(6*index*Math.PI/180)) - height/2
                    color: "black"
                    rotation: 180 + index*6

                }
            }

            Repeater {
                model: 12
                Rectangle {
                    width: 20; height: 5
                    x: analogClock.x0 + (190 * Math.cos(30*index*Math.PI/180)) - width/2
                    y: analogClock.y0 + (190 * Math.sin(30*index*Math.PI/180)) - height/2
                    color: "Blue"
                    rotation: 180 + index*30

                }
            }

            Repeater {
                model: 12
                Rectangle {
                    width: 50; height: 50
                    x: analogClock.x0 + (170 * Math.cos(30*(index-2)*Math.PI/180)) - width/2
                    y: analogClock.y0 + (170 * Math.sin(30*(index-2)*Math.PI/180)) - height/2
                    color: "transparent"
                    //                    rotation: 180 + index*30
                    Text {
                        text: index + 1
                        font.pixelSize:20
                        color: "Black"
                        anchors.centerIn: parent
                    }
                }
            }

            Rectangle {
                id: hourIndicator
                width: 120; height: 15
                color: "black"
                transformOrigin: Item.Left
                x: analogClock.x + analogClock.width/2
                y: analogClock.y + analogClock.height/2 - height/2
                rotation: analogClock.hourAngle
            }
            Rectangle {
                id: minIndicator
                width: 160; height: 5
                color: "blue"
                transformOrigin: Item.Left
                x: analogClock.x + analogClock.width/2
                y: analogClock.y + analogClock.height/2 - height/2
                rotation: analogClock.minAngle
            }
            Rectangle {
                id: secIndicator
                width: 140; height: 10
                color: "yellow"
                transformOrigin: Item.Left
                x: analogClock.x + analogClock.width/2
                y: analogClock.y + analogClock.height/2 - height/2
                rotation: analogClock.secAngle
            }

        }

        Rectangle {
            id: digitalClock
            anchors.left: analogClock.left
            anchors.right: analogClock.right
            anchors.top: analogClock.bottom
            height: window.height - analogClock.height
            color: "lightGray"


            Rectangle {
                id: hourRect
                height: parent.height
                anchors.left: parent.left
                anchors.top: parent.top
                width: parent.width/3
                color: "green"
                Text {
                    id: hourText
                    text: analogClock.hour
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: minRect
                height: parent.height
                anchors.left: hourRect.right
                width: parent.width/3
                anchors.top: parent.top
                color: "red"
                Text {
                    id: minText
                    text:analogClock.min
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: secRect
                height: parent.height
                anchors.left: minRect.right
                anchors.top: parent.top
                width: parent.width/3
                color: "blue"
                Text {
                    id: secText
                    text:analogClock.sec.toPrecision(2)
                    anchors.centerIn: parent
                }
            }
        }

        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: {
                if(analogClock.sec > 59)
                {
                    analogClock.sec = 0;
                    if(analogClock.min > 59)
                    {
                        analogClock.min = 0
                    }
                    analogClock.min = analogClock.min + 1;
                    analogClock.minAngle = analogClock.min*6 - 90
                }

                if(analogClock.min == 60)
                {
                    analogClock.min = 0
                    if(analogClock.hour > 11)
                    {
                        analogClock.hour = 0
                    }
                    analogClock.hour = analogClock.hour + 1
                    analogClock.hour = analogClock.hour*30 - 90
                }

                analogClock.sec = analogClock.sec + 1;
                analogClock.secAngle = analogClock.sec*6 - 90

                if(analogClock.secAngle === 360){
                    analogClock.secAngle = 0
                }
            }
        }

    }
}
