import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: rectangle1
    width: 300
    height: 400

    /*ColumnLayout {
        id: columnLayout1
        x: 8
        width: 300
        height: 400
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter*/



        Flickable {
            id: flickable1
            x: 8
            y: 50
            width: 300
            height: 400
            maximumFlickVelocity: 1500
            boundsBehavior: Flickable.DragOverBounds
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            flickableDirection: Flickable.VerticalFlick

            TextField {
                id: name
                x: 100
                y: 25
                width: 200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 35
                placeholderText: qsTr("Name")
            }

            TextField {
                id: password
                x: 100
                width: 200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: name.bottom
                anchors.topMargin: 30
                placeholderText: qsTr("Password")
            }

            TextField {
                id: password_reEnter
                x: 100
                width: 200
                anchors.top: password.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Reenter Password")
            }

            TextField {
                id: email
                x: 100
                width: 200
                anchors.top: password_reEnter.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Email")
            }

            TextField {
                id: gender
                x: 100
                width: 200
                anchors.top: email.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Gender")
            }

            TextField {
                id: age
                x: 100
                width: 200
                anchors.top: gender.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Age")
            }

            TextField {
                id: ethnicity
                x: 100
                width: 200
                anchors.top: age.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Ethnicity")
            }
        }
    //}

}

