import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import cppClasses 1.0
import QtQuick.Controls.Styles 1.2
import Enginio 1.0

Rectangle {
    anchors.fill: parent
    color: "white"

    /*EnginioClient {
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
            "objectType": "objects.localFeed",
            sort: [{"sortBy": "createdAt", "direction": "desc"}] // DEFAULT TO MOST RECENT
        }
    }*/

    /* News Feed */

    Loader {
        id: feed
        source: "TrackingFeed.qml"
        anchors.fill: parent
        //var issueID
        anchors.top: tabBar.bottom
        anchors.topMargin: 30
    }


    /*Rectangle {

        id: localNav
        visible: true
        color: "lightgrey"
        //anchors.top: feed.bottom
        //anchors.topMargin: 30
        anchors.bottom: parent.bottom
        width: Screen.width
        //anchors.margins: 0
        height: 30

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
                    var reply = client.fullTextSearch( {
                                                          //"objectType": "objects.localFeed",
                                                          "issue": "issue6"
                                                      })
                }
            }
        }

        RowLayout {
            id: row
            //height: 50
            anchors.centerIn: parent
            //Label { text: "Ivalid email or password" } // Initial label
            spacing: Screen.width*0.3

            Image {
                id: trending
                sourceSize.width: 30
                sourceSize.height: 30
                source: "qrc:trending.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enginioModel.query = {
                            "objectType": "objects.localFeed",
                            //limit: 5,
                            sort: [{"sortBy": "votes", "direction": "desc"}],
                        }
                    }
                }
            }

            Image {
                id: alpha
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:alphabeticalSort.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enginioModel.query = {
                            "objectType": "objects.localFeed",
                            //limit: 5,
                            sort: [{"sortBy": "issue", "direction": "asc"}],
                        }
                    }
                }
            }

            Image {
                id: search
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:search.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        row.state = "SEARCH"
                    }
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
    }*/

    Rectangle {

        id: tabBar
        visible: true
        color: "lightgrey"
        anchors.top: parent.top
        width: Screen.width
        //anchors.margins: 0
        height: 30

        RowLayout {
            //id: row
            //height: 50
            anchors.centerIn: parent
            //Label { text: "Ivalid email or password" } // Initial label
            spacing: Screen.width*0.2

            Image {
                id: tracking
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:tracking.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        feed.source = "TrackingFeed.qml"
                    }
                }
            }

            Image {
                id: local
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:local.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        feed.source = "LocalFeed.qml"
                    }
                }
            }

            Image {
                id: state
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:state.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        feed.source = "StateFeed.qml"
                    }
                }
            }

            Image {
                id: federal
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:federal.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        feed.source = "FederalFeed.qml"
                    }
                }
            }

        }
    }

}

