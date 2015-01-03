import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: rectangle1
    width: 200
    height: 350

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
        id: loginButton
        x: 62
        text: qsTr("LOGIN")
        anchors.horizontalCenter: parent.horizontalCenter
        scale: 1
        transformOrigin: Item.Center
        anchors.top: passwordField.bottom
        anchors.topMargin: 30
        onClicked: content.source = "TabView.qml"
    }

    Label {
        id: createAcct
        x: 83
        text: qsTr("Create an Account")
        font.underline: true
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 12
        textFormat: Text.PlainText
        font.family: "Tahoma"
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: loginButton.bottom
        anchors.topMargin: 30
    }

    MouseArea {
        id: createAcctArea
        x: 52
        y: 274
        width: 97
        height: 15
        anchors.horizontalCenter: createAcct.horizontalCenter
        anchors.verticalCenter: createAcct.verticalCenter
        onClicked: content.source = "CreateAcctPage.qml"
    }

    ColumnLayout {
        id: columnLayout1
        x: 50
        y: 103
        width: 200
        height: 350
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}

