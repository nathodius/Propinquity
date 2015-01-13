import QtQuick 2.1
import Enginio 1.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ColumnLayout {
    EnginioOAuth2Authentication {
        id: identity
        user: login.text
        password: password.text
    }
    EnginioClient {
        id: enginioClient
        backendId: {"54a9c4b05a3d8b5e1a00c046"} // copy/paste your EDS instance backend id here
        //onFinished: console.log("Request served." + reply.data)
        onError: console.log("Ooops! Something went wrong!", JSON.stringify(reply.data))
        onSessionAuthenticated: console.log("Authenticated.", JSON.stringify(reply.data))
        onSessionAuthenticationError: console.log("Authentication error", JSON.stringify(reply.data))
        onSessionTerminated: console.log("Termination.", JSON.stringify(reply.data))
        //identity: oauth2
        //identity: auth
        //identity: auth
        identity: null
    }
    anchors.fill: parent
    anchors.margins: 3
    spacing: 3

    TextField {
        id: login
        Layout.fillWidth: true
        placeholderText: "Username"
        enabled: enginioClient.authenticationState == Enginio.NotAuthenticated
    }

    TextField {
        id: password
        Layout.fillWidth: true
        placeholderText: "Password"
        echoMode: TextInput.PasswordEchoOnEdit
        enabled: enginioClient.authenticationState == Enginio.NotAuthenticated
    }

    Button {
        id: proccessButton
        Layout.fillWidth: true
    }

    TextArea {
        id: data
        text: "Not logged in.\n\n"
        readOnly: true
        Layout.fillHeight: true
        Layout.fillWidth: true

        Connections {
            target: enginioClient
            onSessionAuthenticated: {
                data.text = data.text + "User '"+ login.text +"' is logged in.\n\n" + JSON.stringify(reply.data, undefined, 2) + "\n\n"
            }
            onSessionAuthenticationError: {
                data.text = data.text + "Authentication of user '"+ login.text +"' failed.\n\n" + JSON.stringify(reply.data, undefined, 2) + "\n\n"
            }
            onSessionTerminated: {
                data.text = data.text + "Session closed.\n\n"
            }
        }
    }

    states: [
        State {
            name: "NotAuthenticated"
            when: enginioClient.authenticationState == Enginio.NotAuthenticated
            PropertyChanges {
                target: proccessButton
                text: "Login"
                onClicked: {
                    enginioClient.identity = identity
                }
            }
        },
        State {
            name: "Authenticating"
            when: enginioClient.authenticationState == Enginio.Authenticating
            PropertyChanges {
                target: proccessButton
                text: "Authenticating..."
                enabled: false
            }
        },
        State {
            name: "AuthenticationFailure"
            when: enginioClient.authenticationState == Enginio.AuthenticationFailure
            PropertyChanges {
                target: proccessButton
                text: "Authentication failed, restart"
                onClicked: {
                    enginioClient.identity = null
                }
            }
        },
        State {
            name: "Authenticated"
            when: enginioClient.authenticationState == Enginio.Authenticated
            PropertyChanges {
                target: proccessButton
                text: "Logout"
                onClicked: {
                    enginioClient.identity = null
                }
            }
        }
    ]
}

