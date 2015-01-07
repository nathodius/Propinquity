import QtQuick 2.0
import Enginio 1.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

Rectangle {
    color: "white"
    anchors.fill: parent

    EnginioClient {
        id: client
        backendId: {"54a9c4b05a3d8b5e1a00c046"} // copy/paste your EDS instance backend id here
        onFinished: console.log("Request served." + reply.data)
        onError: console.log("Ooops! Something went wrong!", JSON.stringify(reply.data))
    }

    EnginioModel {
        id: enginioModel
        //backendId: {"54a9c4b05a3d8b5e1a00c046"}
        client: client
        query: { "objectType": "objects.localFeed" }
    }
    ListView {
        //anchors.top: local.top
        //anchors.topMargin: 75
        boundsBehavior: Flickable.StopAtBounds
        id: view
        anchors.fill: parent
        model: enginioModel
        delegate: NewsDelegate {

        }

    }
}



