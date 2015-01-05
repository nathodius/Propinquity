import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    //color: "black"
    TabView {
        anchors.fill: parent
        Tab {
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

