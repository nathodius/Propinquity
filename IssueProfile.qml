import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 100
    height: 62

    Text {
        id: text1
        x: 38
        y: 24
        text: qsTr("Issue Profile")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
    }
}

