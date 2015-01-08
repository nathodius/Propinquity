import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import Enginio 1.0

Rectangle {
    color: "lightblue"

    TabView {
        anchors.fill: parent

        //navBar.visible: true
        Tab {
            title: "Tracking"
            Loader {
                id: trackingFeed
                //source: "LocalFeed.qml"
                anchors.fill: parent
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
            }
        }
        Tab {
            title: "State"
            Loader {
                id: stateFeed
                //source: "LoginPage.qml"
                anchors.fill: parent
            }
        }
        Tab {
            title: "Federal"
            Loader {
                id: federalFeed
                //source: "LoginPage.qml"
                anchors.fill: parent
            }
        }
    }
}

