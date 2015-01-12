import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import Enginio 1.0

Rectangle {
    color: "grey"



    TabView {
        id: tabView
        anchors.fill: parent
        onCurrentIndexChanged: currentIssue.feed = currentIndex
        //currentIndex: currentIssue.feed

        //navBar.visible: true
        Tab {
            //active: true
            clip: true
            title: "Tracking"
            Loader {
                id: trackingFeed
                //source: "TrackingFeed.qml"
                anchors.fill: parent
                //onLoaded: {currentIssue.feed = "TRACKING"}
            } 
        }
        Tab {
            //active: true
            id: local
            clip: true
            title: "Local"
            //Component.onCompleted: currentIssue.feed = "objects.localFeed"
            Loader {
                id: localFeed
                source: "LocalFeed.qml"
                anchors.fill: parent
                //onLoaded: {currentIssue.feed = "LOCAL"}
                //Component.onCompleted: currentIssue.feed = "objects.localFeed"
            }

        }
        Tab {
            //active: true
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
            //active: true
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

