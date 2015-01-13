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
            id: iconRow
            //id: row
            //height: 50
            anchors.centerIn: parent
            //Label { text: "Ivalid email or password" } // Initial label
            spacing: Screen.width*0.2

            Rectangle {
                id: trackingHighlighted
                width: 25
                height: 30
                color: "#F2F2F2"

                Image {
                    anchors.centerIn: parent
                    id: tracking
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:tracking.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            feed.source = "TrackingFeed.qml"
                            currentIssue.feed = 0
                            iconRow.state = "TRACKING_SELECTED"
                        }
                    }
                }
            }

            Rectangle {
                id: localHighlighted
                width: 25
                height: 30
                color: "#F2F2F2"
                Image {
                    id: local
                    anchors.centerIn: parent
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:local.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            feed.source = "LocalFeed.qml"
                            currentIssue.feed = 1
                            iconRow.state = "LOCAL_SELECTED"
                        }
                    }
                }
            }

            Rectangle {
                id: stateHighlighted
                width: 25
                height: 30
                color: "#F2F2F2"
                Image {
                    id: state
                    anchors.centerIn: parent
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:state.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            feed.source = "StateFeed.qml"
                            currentIssue.feed = 2
                            iconRow.state = "STATE_SELECTED"
                        }
                    }
                }
            }

            Rectangle {
                id: federalHighlighted
                color: "#F2F2F2"
                width: 25
                height: 30
                Image {
                    id: federal
                    anchors.centerIn: parent
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:federal.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            feed.source = "FederalFeed.qml"
                            currentIssue.feed = 3
                            iconRow.state = "FEDERAL_SELECTED"
                        }
                    }
                }
            }

            states: [
                State {
                    name: "LOCAL_SELECTED"
                    PropertyChanges { target: trackingHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: localHighlighted; color: "lightgrey"}
                    PropertyChanges { target: stateHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: federalHighlighted; color: "#F2F2F2"}
                },
                State {
                    name: "TRACKING_SELECTED"
                    PropertyChanges { target: trackingHighlighted; color: "lightgrey"}
                    PropertyChanges { target: localHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: stateHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: federalHighlighted; color: "#F2F2F2"}
                },
                State {
                    name: "STATE_SELECTED"
                    PropertyChanges { target: trackingHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: localHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: stateHighlighted; color: "lightgrey"}
                    PropertyChanges { target: federalHighlighted; color: "#F2F2F2"}
                }
                ,
                State {
                    name: "FEDERAL_SELECTED"
                    PropertyChanges { target: trackingHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: localHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: stateHighlighted; color: "#F2F2F2"}
                    PropertyChanges { target: federalHighlighted; color: "lightgrey"}
                }
            ]

        }

        Rectangle {
            width: parent.width; height: 1; color:"blue"//color: "#cccccc"
            anchors.top: parent.bottom
        }

    }

}

