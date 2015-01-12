import QtQuick 2.0
import Enginio 1.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: issueProf
    color: "white"
    anchors.fill: parent
    //var issueID

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
            "objectType": currentIssue.findFeed(),
            //"id": "54a9f4925a3d8b5e1a00f2ca",
            query: {
                "id": currentIssue.id
            },
            sort: [{"sortBy": "issue", "direction": "asc"}] // DEFAULT TO ALPHA ORDER
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
        delegate: IssueProfileDelegate {
        }
    }

    Rectangle {

        id: issueNav
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
            id: row
            //height: 50
            anchors.centerIn: parent
            //Label { text: "Ivalid email or password" } // Initial label
            spacing: 10

            Image {
                id: back
                sourceSize.width: 20
                sourceSize.height: 20
                source: "qrc:back.png"
                MouseArea {
                  anchors.fill: parent
                  onClicked: {
                      //tabView.currentIndex = currentIssue.feed
                      content.source = "Content.qml"
                      //feed.source = "stateFeed.qml"
                      //currentIssue.
                      //currentIssue.backToFeed = true
                      /*enginioModel.query = {
                          "objectType": "objects.stateFeed",
                          //limit: 5,
                          sort: [{"sortBy": "issue", "direction": "asc"}],
                      }*/
                  }
                }
            }
        }
    }
}


