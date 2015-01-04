import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import cppClasses 1.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            visible: true
            title: qsTr("&options")
            MenuItem {
                id: account
                text: qsTr("&Account")
                //onTriggered:
                visible: true
                onTriggered: content.source = "AcctInfoPage.qml"
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

    User {
        id: user
    }

    Loader {
        id: content
        source: "LoginPage.qml"
        anchors.fill: parent
    }

}
