import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import Enginio 1.0

Rectangle {
    color: "grey"



    TabView {
        anchors.fill: parent

        //navBar.visible: true
        Tab {
            clip: true
            title: "Tracking"
            Loader {
                id: trackingFeed
                source: "TrackingFeed.qml"
                anchors.fill: parent
                //onLoaded: {currentIssue.feed = "TRACKING"}
            }

        }
        Tab {
            id: local
            clip: true
            title: "Local"
            Loader {
                id: localFeed
                source: "LocalFeed.qml"
                anchors.fill: parent
                //onLoaded: {currentIssue.feed = "LOCAL"}
            }

        }
        Tab {
            clip: true
            title: "State"
            Loader {
                id: stateFeed
                source: "StateFeed.qml"
                anchors.fill: parent
                //onLoaded: {currentIssue.feed = "STATE"}
            }

        }
        Tab {
            clip: true
            title: "Federal"
            Loader {
                id: federalFeed
                source: "FederalFeed.qml"
                anchors.fill: parent
                //onLoaded: {currentIssue.feed = "FEDERAL"}
            }

        }
    }
}

