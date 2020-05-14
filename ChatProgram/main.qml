import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 480
    height: 540

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: ContactPage {}

    }

}
