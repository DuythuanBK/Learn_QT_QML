import QtQuick 2.12
import QtQuick.Window 2.12
import org.example 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ListView {
        id: view
        anchors.fill: parent
        model: RoleEntryModel {}
        delegate: listDelegate
        highlight: ListHightLight
    }


    Component {
        id: listDelegate
        Item {
            width: view.width
            height: 50
            Rectangle {
                anchors.fill: parent
                border{
                    width: 2
                    color: "black"
                }
                color: 'darkgray'
            }

            Text
            {
                anchors.centerIn: parent
                text: "hsv(" +
                      Number(model.hue).toFixed(2) + ',' +
                      Number(model.saturation).toFixed() + ',' +
                      Number(model.brightness).toFixed() + ',' + ')'
                color: model.name
                font.pixelSize: 15
            }
        }
    }
}
