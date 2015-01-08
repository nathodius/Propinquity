import QtQuick 2.0
import Enginio 1.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

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
        query:{
            "objectType": "objects.localFeed"/*,
                    limit: 5,
                     sort: [{"sortBy": "votes", "direction": "desc"}],
                    query: {
                "votes": {
                    "$gt": 5
                }
            }*/
        }
    }

    ListView {
        //anchors.top: local.top
        //anchors.topMargin: 75
        //width: Screen.width
        boundsBehavior: Flickable.StopAtBounds
        id: view
        anchors.fill: parent
        //anchors.bottom: parent.bottom
        anchors.bottomMargin: 35
        model: enginioModel
        delegate: NewsDelegate {
        }
    }

    Rectangle {
        color: "grey"
        anchors.bottom: parent.bottom
        width: Screen.width
        //anchors.margins: 0
        height: 35

        RowLayout {
            //height: 50
            anchors.centerIn: parent
            //Label { text: "Ivalid email or password" } // Initial label
            spacing: 10
            Button {
                id: trendingBtn
                text: "Trending"
                onClicked: {
                    enginioModel.query = {
                        "objectType": "objects.localFeed",
                                limit: 5,
                                 sort: [{"sortBy": "votes", "direction": "desc"}],
                                query: {
                            "votes": {
                                "$gt": 5
                            }
                        }
                    }
                }
            }
            Button {
                text: "New"
            }
            Button {
                text: "Search" // Chronological
            }
        }
    }
}



