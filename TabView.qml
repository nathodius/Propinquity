import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    TabView {
        anchors.fill: parent
        Tab {
            title: "Feed 1"
            Loader {
                id: feed1
                source: "Feed1.qml"
                anchors.fill: parent
            }

        }
        Tab {
            title: "Feed 2"
            Loader {
                id: feed2
                //source: "LoginPage.qml"
                anchors.fill: parent
            }
        }
        Tab {
            title: "Feed 3"
            Loader {
                id: feed3
                //source: "LoginPage.qml"
                anchors.fill: parent
            }
        }
    }
}

