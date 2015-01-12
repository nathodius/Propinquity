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
            "objectType": "objects.stateFeed",
            sort: [{"sortBy": "createdAt", "direction": "desc"}] // DEFAULT TO ALPHA ORDER
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

        id: stateNav
        visible: true
        color: "#F2F2F2"
        anchors.bottom: parent.bottom
        width: Screen.width
        //anchors.margins: 0
        height: 30

        Rectangle {
            width: parent.width; height: 1; color:"blue" //color: "#cccccc"
            anchors.top: parent.top
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
                          "objectType": "objects.stateFeed",
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
                placeholderText: qsTr("search")
                //anchors
                onAccepted: {
                    enginioModel.query = {
                        "objectType": "objects.stateFeed",
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
                      "objectType": "objects.stateFeed",
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
                      "objectType": "objects.stateFeed",
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
    }
}


