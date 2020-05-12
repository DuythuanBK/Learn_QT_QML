import QtQuick 2.13
import QtQuick.Window 2.13
import QtMultimedia 5.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Item {
        id: areaPlayItem
        anchors.fill: parent
        property var isPlay: player.playbackState

        Rectangle {
            id: progressBar
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 50
            height: 30
            color: "lightGray"

            Rectangle {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: 30
                width: player.duration>0?parent.width*player.position/player.duration:0
                color: "darkGray"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (player.seekable) {
                        player.seek(player.duration * mouse.x/width);
                    }
                }
            }
        }

        Rectangle {
            id: volumeControl
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 100
            width: 50
            height: 100
            color: "lightGray"
            property var volume: player.volume * 100
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                height: volume > 0 ? volume : 0
                color: "darkGray"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    volume = (volumeControl.y + volumeControl.height - mouse.y);

                    console.log("volume: ", volumeControl.volume)
                }
            }
        }

        Rectangle {
            id: areaPlayback
            anchors.centerIn: parent
            width: 100; height: 100

            state: "pause"

            Image {
                id: playbackStateImage
                anchors.fill: parent
                source: "Pause.PNG"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(areaPlayItem.isPlay != MediaPlayer.PlayingState)
                    {
                        player.play();
                        parent.state = "play"
                    }
                    else
                    {
                        player.pause();
                        parent.state = "pause"
                    }

                    console.log("PlayState is", player.playbackState);
                    console.log("isPlay is", areaPlayItem.isPlay);
                }

            }

            states: [
                State {
                    name: "play"
                    PropertyChanges {target: playbackStateImage; source: "playing.PNG"; }
                },

                State {
                    name: "pause"
                    PropertyChanges {target: playbackStateImage; source: "Pause.PNG"; }
                }

            ]

        }



        MediaPlayer {
            id: player
            source: "file:///C:/Users/ndthuan/Downloads/BanhMiKhong.mp3"
        }

        VideoOutput {
            anchors.fill: parent
            source: player
        }

        Connections {
            target: player
            onMediaObjectChanged: {
                if (player.mediaObject) {
                    player.mediaObject.notifyInterval = 50;
                }
            }
        }

    }


}
