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

    /*CurrentIssue {
        id: currentIssue
        //backToFeedChanged: content.source = findFeed()
    }*/

    /* News Feed */

    Loader {
        id: feed
        source: currentIssue.findFeedSource()//"Tracking.qml"
        anchors.fill: parent
        //var issueID
        anchors.top: tabBar.bottom
        anchors.topMargin: 30
        //onBackToFeedChanged:
    }

    Rectangle {

        id: tabBar
        visible: true
        color: "#F2F2F2"//color: "lightgrey"
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
                        currentIssue.feed = 0
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
                        currentIssue.feed = 1
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
                        currentIssue.feed = 2
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
                        currentIssue.feed = 3
                    }
                }
            }

        }

        Rectangle {
            width: parent.width; height: 1; color:"blue"//color: "#cccccc"
            anchors.top: parent.bottom
        }

    }

}

