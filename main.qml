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
    //color: "white"
    //title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    EnginioClient {
        id: client
        backendId: {"54a9c4b05a3d8b5e1a00c046"} // copy/paste your EDS instance backend id here
        onFinished: console.log("Request served." + reply.data)
        onError: console.log("Ooops! Something went wrong!", JSON.stringify(reply.data))
    }

    CurrentIssue {
        id: currentIssue
        //backToFeedChanged: content.source = findFeed()
    }

    Loader {
            id: content
            source: "Content.qml"
            anchors.fill: parent
            //var issueID
        }

    User {
        id: user
    }

}
