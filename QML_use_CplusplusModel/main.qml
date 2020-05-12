import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import org.example 1.0
import QtQuick.Layouts 1.2

Window {
    visible: true
    width: 480
    height: 480
    title: qsTr("ModelView")
    Rectangle {
        id: background
        anchors.fill: parent
        color: 'gray'
    }

    ColumnLayout
    {
        anchors.fill: parent
        anchors.margins: 8
        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            ListView {
                id: view
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right:parent.right
                anchors.bottomMargin: 40
                // set our dynamic model to the views model property
                model: dynamic
                delegate: ListDelegate {
                    width: ListView.view.width
                    // construct a string based on the models properties
                    text: 'hsv(' +
                        Number(model.hue).toFixed(2) + ',' +
                        Number(model.saturation).toFixed() + ',' +
                        Number(model.brightness).toFixed() + ')'
                    // sets the font color of our custom delegates
                    color: model.name

                    onClicked: {
                        // make this delegate the current item
                        view.currentIndex = index
                        view.focus = true
                    }

                    onRemove: {
                        // remove this delegate rentry from the model
                        dynamic.remove(index)
                    }
                }

                highlight: listHighlight
            }
        }

        TextEntry {
            id: textEnttry
            height: 40
            onAppend: {
                // called when the user presser return on the text field
                // or clicks the add Button
                dynamic.append(color)
            }

            onUp: {
                view.decrementCurrentIndex()
            }

            onDown: {
                view.incrementCurrentIndex()
            }
        }
    }


    DynamicEntryModel {
        id: dynamic
        onCountChanged: {
            // we print out count and the last entry when count is changing
            print('New count: ' + count);
            print('Last entry: ' + get(count-1));
        }
    }

    Component {
        id: listHighlight
        Rectangle {
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#fed958" }
                GradientStop { position: 1.0; color: "#fecc2f" }
            }
        }
    }


}
