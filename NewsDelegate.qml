import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtQuick.Dialogs 1.2
import Enginio 1.0

Item {
    id: delegate
    height: column.height + 40
    width: delegate.ListView.view.width - 20
    x: 5

    Loader {
        id: issueProf
        //source: "TabView.qml"
        anchors.fill: parent
    }

    Row {

        Column {

            id: column
            x: 20; y: 20
            width: parent.width - 100
            spacing: 10

            Row {
                id: row
                spacing: 25
                width: parent.width
                //height: (2/3)*parent.

                CheckBox {
                    //text: "NAY"
                    //anchors.right: titleText.left
                    style: CheckBoxStyle {
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: control.activeFocus ? "darkblue" : "gray"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "#555"
                                border.color: "#333"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                    onCheckedChanged: {
                        var reply = client.update(
                                    {   //"objectType": "Users",
                                        "id": "54ab156f5a3d8b5e1a022983", // use user id
                                        "push": {
                                            "localTracking": "yeeee"
                                        }
                                    } , Enginio.UserOperation)
                    }
                }

                Text {
                    id: titleText
                    text: issue; width: (parent.width - 200); wrapMode: Text.WordWrap
                    font { bold: true; family: "Helvetica"; pointSize: 24 }
                    MouseArea {
                        width: parent.width
                        height: parent.height
                        onClicked: {currentIssue.id = id
                            content.source = "IssueProfile.qml"
                            /*localNav.visible = false
                            federalNav.visible = false
                            stateNav.visible = false


trackingNav.visible = false*/
                        }
                    }
                }

            }

            Text {
                id: descriptionText
                width: parent.width; color: "#837c7c"; text: summary
                wrapMode: Text.WordWrap; font.family: "Helvetica"
            }
        }



        Column {
            x: 20; y: 20
            height: parent.height
            width: Screen.width - column.width
            spacing: 15

            Row {
                spacing: 10
                CheckBox {
                    text: "Y"
                    style: CheckBoxStyle {
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: control.activeFocus ? "darkblue" : "gray"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "#555"
                                border.color: "#333"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                    onCheckedChanged: {
                        checkYea.visible = true
                    }
                }
                CheckBox {
                    text: "N"
                    style: CheckBoxStyle {
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: control.activeFocus ? "darkblue" : "gray"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "#555"
                                border.color: "#333"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                    onCheckedChanged: {
                        checkNay.visible = true
                    }
                }

            }

            Text {
                id: voteCount
                //anchors.left: titleText.right
                text: "(" + votes + " votes" + ")"; width: parent.width; wrapMode: Text.WordWrap
                font { bold: false; family: "Helvetica"; pointSize: 16 }
            }

        }

    }

    Rectangle {
        anchors.top: parent.top
        anchors.topMargin: 4
        id: checkYea
        width: parent.width
        height: parent.height - 8
        visible: false
        color: "lightgreen"

            Column {
                spacing: 10
                anchors.centerIn: parent
                Row {
                    spacing: 25
                    Button {
                        id: voteButton
                        text: "Cast vote."
                        onClicked: {
                            votes++
                            yeas++
                            checkYea.visible = false
                            delegate.visible = false
                            delegate.height = 0
                        }
                    }
                    Button {
                        id: canelButton
                        text: "Cancel vote"
                        onClicked: checkYea.visible = false
                    }
                }
            }
        }


    Rectangle {
        id: checkNay
        color: "#FE2E64"
        anchors.top: parent.top
        anchors.topMargin: 4
        width: parent.width
        height: parent.height - 8
        visible: false

        Column {
            anchors.centerIn: parent
            spacing: 10
            Row {
                spacing: 25
                Button {
                    text: "Cast vote."
                    onClicked: {
                        votes++
                        yeas++
                        checkYea.visible = false
                        delegate.visible = false
                        delegate.height = 0
                    }
                }
                Button {
                    id: canelButton2
                    text: "Cancel vote"
                    onClicked: checkNay.visible = false
                }
            }
        }

    }

    Rectangle {
        width: parent.width; height: 1; color: "#cccccc"
        anchors.bottom: parent.bottom
    }
}

