import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: rectangle1
    width: 200
    height: 300

    Label {
        id: title
        x: 83
        width: 200
        height: 35
        color: "#5fa8d7"
        text: qsTr("PROPINQUITY")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 26
        font.family: "Tahoma"
        textFormat: Text.PlainText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 35
    }

    TextField {
        id: emailField
        x: 52
        width: 200
        height: 40
        opacity: 0.55
        font.pixelSize: 16
        font.family: "Tahoma"
        anchors.top: title.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: qsTr("Email")
    }

    TextField {
        id: passwordField
        x: 52
        width: 200
        height: 40
        font.family: "Tahoma"
        echoMode: 2
        opacity: 0.55
        font.pixelSize: 16
        anchors.top: emailField.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: qsTr("Password")
    }

    Button {
        id: button1
        x: 62
        text: qsTr("LOGIN")
        anchors.horizontalCenter: parent.horizontalCenter
        scale: 1
        transformOrigin: Item.Center
        anchors.top: passwordField.bottom
        anchors.topMargin: 30
    }
}

