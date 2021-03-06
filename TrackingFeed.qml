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
            "objectType": "objects.localFeed",
            sort: [{"sortBy": "createdAt", "direction": "desc"}] // DEFAULT TO MOST RECENT
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

        id: localNav
        visible: true
        color:"#F2F2F2"//color: "lightgrey"
        anchors.bottom: parent.bottom
        width: Screen.width
        //anchors.margins: 0
        height: 30

        Rectangle {
            width: parent.width; height: 1; color:"blue" //color: "#cccccc"
            anchors.bottom: parent.top
        }

        RowLayout {
            id: row2
            anchors.centerIn: parent
            visible: false
            PropertyChanges { target: row; visible: false}
            Image {
                id: cancel
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:x.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enginioModel.query = {
                            "objectType": "objects.localFeed",
                            //limit: 5,
                            sort: [{"sortBy": "createdAt", "direction": "desc"}]

                        }
                        row.state = "NORMAL"
                    }
                }
            }
            TextField {
                //visible: false
                id: searchBar
                placeholderText: qsTr("Search")
                //anchors
                onAccepted: {
                    /*row.state = "NORMAL"
                    var reply = client.fullTextSearch( {
                        "objectType": "objects.localFeed",
                        "issue": "issue6"
                    })*/
                    enginioModel.query = {
                        "objectType": "objects.localFeed",
                        query: {
                            "issue": searchBar.text
                        }
                    }
                }
            }
        }

        RowLayout {
            id: row
            //height: 50
            anchors.centerIn: parent
            //Label { text: "Ivalid email or password" } // Initial label
            spacing: Screen.width*0.2

            Rectangle {
                id: trendingHighlighted
                color: "#F2F2F2"
                width: 25
                height: 30
                Image {
                    id: trending
                    anchors.centerIn: parent
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:trending.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enginioModel.query = {
                            "objectType": "objects.localFeed",
                            //limit: 5,
                            sort: [{"sortBy": "votes", "direction": "desc"}],
                        }
                        row.state = "TRENDING_SELECTED"
                    }
                }
            }

            Rectangle {
                id: expiringHighlighted
                color: "#F2F2F2"
                width: 25
                height: 30
                Image {
                    id: expiring
                    anchors.centerIn: parent
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:expiring.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enginioModel.query = {
                            "objectType": "objects.localFeed",
                            //limit: 5,
                            sort: [{"sortBy": "minutesUntilExp", "direction": "asc"}],
                        }
                        row.state = "EXPIRING_SELECTED"
                    }
                }
            }

            Rectangle {
                id: alphaHighlighted
                color: "#F2F2F2"
                width: 25
                height: 30
                Image {
                    id: alpha
                    anchors.centerIn: parent
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:alphabeticalSort.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enginioModel.query = {
                            "objectType": "objects.localFeed",
                            //limit: 5,
                            sort: [{"sortBy": "issue", "direction": "asc"}],
                        }
                        row.state = "ALPHA_SELECTED"
                    }
                }
            }

            Rectangle {
                id: searchHighlighted
                color: "#F2F2F2"
                width: 25
                height: 30
                Image {
                    id: search
                    anchors.centerIn: parent
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:search.png"
                }
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
                },
                State {
                    name: "TRENDING_SELECTED"
                    PropertyChanges { target: searchHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: alphaHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: trendingHighlighted; color: "lightgrey"}
                    PropertyChanges { target: expiringHighlighted; color: "#F2F2F2"}
                },
                State {
                    name: "ALPHA_SELECTED"
                    PropertyChanges { target: searchHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: alphaHighlighted; color: "lightgrey"}
                    PropertyChanges { target: trendingHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: expiringHighlighted; color: "#F2F2F2"}
                },
                State {
                    name: "EXPIRING_SELECTED"
                    PropertyChanges { target: searchHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: alphaHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: trendingHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: expiringHighlighted; color: "lightgrey"}
                }

            ]

        }
    }

}



