import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import io.qt.examples.chattutorial 1.0

Item {
    id: root
    Page {
        anchors.fill: parent
        header: ToolBar {
            Label {
                padding: 10
                text: qsTr("Contacts")
                font.pixelSize: 20
                anchors.centerIn: parent
            }
        }

        ListView {
            id: listView
            anchors.fill: parent
            topMargin: 48
            leftMargin: 48
            bottomMargin: 48
            rightMargin: 48
            spacing: 20
            model: SqlContactModel {}
            delegate: ItemDelegate {
                text: model.display
                width: listView.width - listView.leftMargin - listView.rightMargin
                height: avatar.height
                leftPadding: avatar.width + 32

                Rectangle {
                    id: avatar
                    width: 40; height: 40

                    color: 'grey'
                }
                onClicked: root.StackView.view.push("qrc:/ConversationPage.qml", { inConversationWith: modelData })
            }
        }
    }
}
