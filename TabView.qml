import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    TabView {
        anchors.fill: parent
        Tab {
            title: "Red"
            Rectangle { color: "red" }
        }
        Tab {
            title: "Blue"
            Rectangle { color: "blue" }
        }
        Tab {
            title: "Green"
            Rectangle { color: "green" }
        }
    }
}

