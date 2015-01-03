import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            visible: false
            title: qsTr("&OPTIONS")
            MenuItem {
                text: qsTr("&Account")
                //onTriggered:
                visible: false
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    statusBar: StatusBar {
        visible: false
            RowLayout {
                anchors.fill: parent
                Label { text: "Ivalid email or password" } // Initial label
            }
        }

    Loader {
        id: content
        source: "LoginPage.qml"
        anchors.fill: parent
    }

}
