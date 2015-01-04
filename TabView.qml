import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    TabView {
        anchors.fill: parent
        Tab {
            title: "Feed 1"
            Rectangle { color: "red" }
        }
        Tab {
            title: "Feed 2"
            Rectangle { color: "blue" }
        }
        Tab {
            title: "Feed 3"
            Rectangle { color: "green" }
        }
    }
}

