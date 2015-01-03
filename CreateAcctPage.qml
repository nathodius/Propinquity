import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Rectangle {
    id: rectangle1
    width: Screen.width
    height: Screen.height

    /*ColumnLayout {
        id: columnLayout1
        x: 8
        width: 300
        height: 400
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter*/



        Flickable {
            id: flickable1
            width: Screen.width
            height: Screen.height
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            contentWidth: Screen.width
            contentHeight: 600
            maximumFlickVelocity: 1500
            boundsBehavior: Flickable.StopAtBounds
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            flickableDirection: Flickable.VerticalFlick

            GridLayout {
                id: theGrid
                width: Screen.width
                height: 600

                TextField {
                    id: password
                    x: 100
                    width: 200
                    opacity: 0.5
                    echoMode: 2
                    inputMask: qsTr("")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: title.bottom
                    anchors.topMargin: 75
                    placeholderText: qsTr("Password")
                }

                TextField {
                    id: password_reEnter
                    x: 100
                    width: 200
                    opacity: 0.5
                    echoMode: 2
                    anchors.top: password.bottom
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Password")
                }

                TextField {
                    id: email
                    x: 100
                    width: 200
                    opacity: 0.5
                    anchors.top: password_reEnter.bottom
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Email")
                }

                TextField {
                    id: age
                    x: 100
                    width: 200
                    opacity: 0.5
                    anchors.top: genderSelect.bottom
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Age")
                }

                ComboBox {
                    id: genderSelect
                    //currentText: "gender"
                    model: ["female", "male" ]
                    x: 88
                    width: 200
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: email.bottom
                    anchors.topMargin: 30
                }

                Label {
                    id: title
                    x: -17
                    text: qsTr("Complete the form.")
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                ComboBox {
                    id: incomeSelect
                    //model: ["female", "male" ]
                    x: 886
                    width: 200
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: ethnicity.bottom
                    anchors.topMargin: 30
                }

                ComboBox {
                    id: ethnicity
                    x: 898
                    width: 200
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: age.bottom
                    anchors.topMargin: 30
                }

                Button {
                    id: submitButton
                    x: 922
                    text: qsTr("Submit")
                    anchors.top: incomeSelect.bottom
                    anchors.topMargin: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    id: passwordLabel
                    x: 685
                    y: 171
                    text: qsTr("Password")
                    anchors.verticalCenter: password.verticalCenter
                    anchors.right: password.left
                    anchors.rightMargin: 50
                }

                Label {
                    id: password_reEnterLabel
                    x: 744
                    y: 220
                    width: 125
                    height: 22
                    text: qsTr("Re-enter Password")
                    anchors.verticalCenter: password_reEnter.verticalCenter
                    anchors.right: password_reEnter.left
                    anchors.rightMargin: 50
                }

                Label {
                    id: label4
                    x: 685
                    y: 275
                    text: qsTr("Label")
                }

                Label {
                    id: label5
                    x: 692
                    y: 329
                    text: qsTr("Label")
                }

                Label {
                    id: label6
                    x: 692
                    y: 383
                    text: qsTr("Label")
                }

                Label {
                    id: label7
                    x: 692
                    y: 437
                    text: qsTr("Label")
                }

                Label {
                    id: label8
                    x: 685
                    y: 493
                    text: qsTr("Label")
                }
            }

            // District information
        }

}

