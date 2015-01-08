//Write the states; work on animation later

import QtQuick 2.1
import Enginio 1.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
//import Qt.labs.gestures 1.0

Flickable {
    id: scroller
    width: Screen.width
    height: Screen.height
    contentWidth: Screen.width
    contentHeight: 1.25 * Screen.height
    maximumFlickVelocity: 1500
    boundsBehavior: Flickable.DragOverBounds
    flickableDirection: Flickable.VerticalFlick

    Rectangle {
        id: engine
        anchors.fill: parent
        color: "white"

        Timer {
            id: timer
            interval: 3000; running: true; repeat: true
            onTriggered: engine.state = "CREDENTIALS"
        }

        Label {
            id: welcome
            text: "Welcome to Propinquity"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 200
            visible: true
        }
        Label {
            id: leggo
            anchors.top: welcome.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 25
            text: "Let's create your account"
        }

        /* CREDENTIALS */
        Label {
            id: credentialsLabel
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 100
            text: "User Credentials"
        }
        TextField {
            id: emailField
            placeholderText: qsTr("Email")
            visible: false
            anchors.top: credentialsLabel.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }
        TextField {
            id: passwordField
            placeholderText: qsTr("Password")
            visible: false
            echoMode: 2
            anchors.top: emailField.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }
        TextField {
            id: password2Field
            placeholderText: qsTr("Password")
            visible: false
            echoMode: 2
            anchors.top: passwordField.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: nextFromCredentials
            text: "Next"
            visible: false
            anchors.top: password2Field.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                engine.state = "DEMOGRAPHY"
            }

        }

        /* Demography */

        Label {
            id: demoLabel
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 100
            text: "Demographic Information"
        }

        Row {
            visible: false
            id: row
            //anchors.left: parent.left
            //anchors.leftMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: demoLabel.bottom
            anchors.topMargin: 50
            spacing: 50
            Column {

                spacing: 30

                id: demo
                visible: true

                Label {
                    text: "GENDER: "
                }

                Label {
                    text: "AGE: "
                }

                Label {
                    text: "RACE: "
                }

                Label {
                    text: "INCOME: "
                }

            }
            Column {

                spacing: 25

                id: demo2
                visible: true

                ComboBox {
                    id: genderSelect
                }

                ComboBox {
                    id: raceSelect
                }

                ComboBox {
                    id: ageSelect
                }

                ComboBox {
                    id: incomeSelect
                }

            }
        }

        Button {
            id: nextFromDemo
            text: "Next"
            visible: false
            anchors.top: row.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                // handle password mismatch
                engine.state = "VOTER"
                /*var reply = client.create(
                            { "username": emailField.text,
                              "password": passwordField.text,
                              "age": ageSelect.currentText,
                              "gender": genderSelect.currentText,
                              "income",
                              "voterID"
                              // set other properties
                            }, Enginio.UserOperation)*/
            }
        }

        /* Voter Info*/
        Label {
            id: voterInfoLabel
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 200
            text: "Are you a registered voter?"
        }

        Row {
            visible: true
            anchors.top: voterInfoLabel.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50
            Button {
                id: yes
                text: "Yes"
                visible: false
                onClicked: {
                    // Register on next page
                    engine.state = "IDINFO"
                }
            }
            Button {
                id: no
                text: "No"
                visible: false
                onClicked: {
                    var reply = client.create(
                                { "username": emailField.text,
                                    "password": passwordField.text,
                                    "age": ageSelect.currentText,
                                    "gender": genderSelect.currentText,
                                    "income": incomeSelect.currentText,
                                    "voterID": null
                                }, Enginio.UserOperation)
                    engine.state = "TOS"
                }
            }
        }

        /* ID Info */
        Label {
            id: voterID
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 200
            text: "Voter ID"
        }

        TextField {
            id: idField
            placeholderText: qsTr("ID")
            visible: false
            anchors.top: voterID.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: voterIDBtn
            text: "Next"
            visible: false
            anchors.top: idField.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                //content.source = "TabView.qml"
                engine.state = "TOS"
                /*var reply = client.create(
                            { "username": emailField.text,
                                "password": passwordField.text,
                                "age": ageSelect.currentText,
                                "gender": genderSelect.currentText,
                                "income": incomeSelect.currentText,
                                "voterID": idField.text
                            }, Enginio.UserOperation)*/
            }
        }

        Label {
            id: participation
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 200
            text: "Participation language"
        }

        /* Terms of Service */
        Label {
            id: tos
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 200
            text: "Terms of Service..."
        }

        Button {
            id: accept
            text: "accept"
            anchors.top: tos.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 100
            visible: false
            onClicked: {
                //content.source = "TabView.qml"
                engine.state = "FINALWORDS"
                var reply = client.create(
                            { "username": emailField.text,
                                "password": passwordField.text,
                                "age": ageSelect.currentText,
                                "gender": genderSelect.currentText,
                                "income": incomeSelect.currentText,
                                "voterID": idField.text
                            }, Enginio.UserOperation)
            }
        }

        states: [
            State {
                name: "CREDENTIALS"
                PropertyChanges { target: welcome; visible: false}
                PropertyChanges { target: leggo; visible: false}
                PropertyChanges { target: timer; running: false}

                PropertyChanges { target: credentialsLabel; visible: true}
                PropertyChanges { target: emailField; visible: true}
                PropertyChanges { target: passwordField; visible: true}
                PropertyChanges { target: password2Field; visible: true}
                PropertyChanges { target: nextFromCredentials; visible: true}
            },
            State {
                name: "DEMOGRAPHY"
                PropertyChanges { target: welcome; visible: false}
                PropertyChanges { target: leggo; visible: false}
                PropertyChanges { target: timer; running: false}
                PropertyChanges { target: credentialsLabel; visible: false}
                PropertyChanges { target: emailField; visible: false}
                PropertyChanges { target: passwordField; visible: false}
                PropertyChanges { target: password2Field; visible: false}
                PropertyChanges { target: nextFromCredentials; visible: false}

                PropertyChanges { target: demoLabel; visible: true}
                PropertyChanges { target: row; visible: true}
                PropertyChanges { target: nextFromDemo; visible: true}
            }
            ,
            State {
                name: "VOTER"
                PropertyChanges { target: welcome; visible: false}
                PropertyChanges { target: leggo; visible: false}
                PropertyChanges { target: demoLabel; visible: false}
                PropertyChanges { target: nextFromDemo; visible: false}
                PropertyChanges { target: timer; running: false}

                PropertyChanges { target: voterInfoLabel; visible: true}
                PropertyChanges { target: yes; visible: true}
                PropertyChanges { target: no; visible: true}
            }
            ,
            State {
                name: "IDINFO"
                PropertyChanges { target: welcome; visible: false}
                PropertyChanges { target: leggo; visible: false}
                PropertyChanges { target: demoLabel; visible: false}
                PropertyChanges { target: nextFromDemo; visible: false}
                PropertyChanges { target: timer; running: false}
                PropertyChanges { target: voterInfoLabel; visible: false}
                PropertyChanges { target: yes; visible: false}
                PropertyChanges { target: no; visible: false}

                PropertyChanges { target: voterID; visible: true}
                PropertyChanges { target: idField; visible: true}
                PropertyChanges { target: voterID; visible: true}
                PropertyChanges { target: voterIDBtn; visible: true}
                //PropertyChanges { target: or; visible: true}
                //PropertyChanges { target: later; visible: true}
            }
            ,
            State {
                name: "TOS"
                PropertyChanges { target: welcome; visible: false}
                PropertyChanges { target: leggo; visible: false}
                PropertyChanges { target: timer; running: false}
                //PropertyChanges { target: timer; onTriggered: content.source = "TabView.qml", navBar.visible = true}
                PropertyChanges { target: voterID; visible: false}
                PropertyChanges { target: idField; visible: false}
                PropertyChanges { target: voterID; visible: false}
                PropertyChanges { target: voterIDBtn; visible: false}
                PropertyChanges { target: tos; visible: true}
                PropertyChanges { target: accept; visible: true}
            }
            ,
            State {
                name: "FINALWORDS"
                PropertyChanges { target: welcome; visible: false}
                PropertyChanges { target: leggo; visible: false}
                PropertyChanges { target: timer; onTriggered: content.source = "TabView.qml"/*, navBar.visible = true*/}
                PropertyChanges { target: voterID; visible: false}
                PropertyChanges { target: idField; visible: false}
                PropertyChanges { target: voterID; visible: false}
                PropertyChanges { target: voterIDBtn; visible: false}
                PropertyChanges { target: tos; visible: false}
                PropertyChanges { target: accept; visible: false}

                PropertyChanges { target: participation; visible: true}
            }
        ]
    }
}

