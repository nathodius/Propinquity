import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import cppClasses 1.0
import QtQuick.Controls.Styles 1.2
import Enginio 1.0
//import QtQuick.

ApplicationWindow {
    id: main

    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    EnginioClient {
        id: client
        backendId: {"54a9c4b05a3d8b5e1a00c046"} // copy/paste your EDS instance backend id here
        onFinished: console.log("Request served." + reply.data)
        onError: console.log("Ooops! Something went wrong!", JSON.stringify(reply.data))
    }

    /*Item {
        id: toolbar

        property alias button1Label: button1.text
        property alias button2Label: button2.text
        property alias button2Visible: button2.visible

        signal button1Clicked
        signal button2Clicked

        BorderImage { source: "images/titlebar.sci"; width: parent.width; height: parent.height + 14; y: -7 }

        Row {
            anchors.right: parent.right; anchors.rightMargin: 5; y: 3; height: 32; spacing: 30
            Button {
                id: button1
                width: 140; height: 32
                onClicked: toolbar.button1Clicked()
            }

            Button {
                id: button2; width: 140; height: 32
                onClicked: toolbar.button2Clicked()
            }
        }
    }*/

    /*Rectangle {
        color: "pink"
        width: Screen.width
        height: 50
        anchors.bottom: parent.bottom
    }*/

    /*menuBar: MenuBar {
        id: menBar
        visible: false

        Menu {
            visible: true
            title: qsTr("&options")
            MenuItem {
                id: feeds
                text: qsTr("&Feeds")
                //onTriggered:
                visible: true
                onTriggered: content.source = "TabView.qml"
            }
            MenuItem {
                id: account
                text: qsTr("&Account")
                //onTriggered:
                visible: true
                onTriggered: content.source = "AcctInfoPage.qml"
            }
            MenuItem {
                id: logout
                text: qsTr("&Logout")
                //onTriggered:
                visible: true
                onTriggered: content.source = "LoginPage.qml"
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }*/

    /*ToolBar {
        anchors.bottom: parent.bottom
        tools: ToolBarLayout {

            ToolButton {
                iconSource: "toolbar-back"
            }
            ToolButton {
                iconSource: "toolbar-menu"
            }
        }
    }*/

    statusBar: StatusBar {
        id: navBar
        visible: false
        height: 50
        RowLayout {
            //height: 50
            anchors.centerIn: parent
            //Label { text: "Ivalid email or password" } // Initial label
            spacing: 10
            Button {
                id: trendingBtn
                text: "Trending"
            }
            Button {
                text: "New"
            }
            Button {
                text: "Search" // Chronological
            }
        }
    }

    User {
        id: user
    }

    Loader {
        id: content
        source: "TabView.qml"
        anchors.fill: parent
    }


}
