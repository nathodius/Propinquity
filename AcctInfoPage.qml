import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: rectangle1
    width: Screen.width
    height: Screen.height
    color: "pink"

    Label {
        id: label1
        x: 590
        y: 382
        text: qsTr("Account Info Page")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

}

