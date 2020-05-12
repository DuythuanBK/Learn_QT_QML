import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

RowLayout {
    id: root
    signal append(string color)
    signal up()
    signal down()
    TextField {
        id: colorField
        Layout.fillWidth: true
        text: 'type the color'
        focus: true
        onAccepted: {
            root.append(colorField.text)
            selectAll()
        }

        Keys.onUpPressed: root.up()
        Keys.onDownPressed: root.down()
    }

    Button {
        text: 'Add'
        onClicked: {
            root.append(colorField.text)
        }
    }
}
