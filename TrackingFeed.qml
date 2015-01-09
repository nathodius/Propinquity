import QtQuick 2.0
import Enginio 1.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: container
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
            "objectType": "objects.localFeed"
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

        id: trackingNav
        visible: true
        color: "lightgrey"
        anchors.bottom: parent.bottom
        width: Screen.width
        //anchors.margins: 0
        height: 50

        RowLayout {
            id: row2
            anchors.centerIn: parent
            visible: false
            PropertyChanges { target: row; visible: false}
            TextField {
                //visible: false
                id: searchBar
                placeholderText: qsTr("search")
                //anchors
                onAccepted: {
                    row.state = "NORMAL"
                }
                }
        }

        RowLayout {
            id: row
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
                id: newBtn
                text: "New"
                onClicked: {
                    enginioModel.query = {
                        "objectType": "objects.localFeed",
                        limit: 5,
                        sort: [{"sortBy": "createdAt", "direction": "desc"}],
                        query: {
                            "votes": {
                                "$gt": 5
                            }
                        }
                    }
                }
            }
            Button {
                id: searchBtn
                text: "Search" // Chronological
                onClicked: {
                    row.state = "SEARCH"
                    //row.visible = false
                    //row2.visible = true
                    //parent.visible = false
                }
                }

        states: [
            State {
                name: "SEARCH"
                PropertyChanges { target: row; visible: false}
                PropertyChanges { target: row2; visible: true}
            },
            State {
                name: "NORMAL"
                PropertyChanges { target: row; visible:true}
                PropertyChanges { target: row2; visible: false}
            }

        ]

                }
            }
}
