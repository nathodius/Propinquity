import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtQuick.Dialogs 1.2
import Enginio 1.0
import cppClasses 1.0

Item {
    id: delegate
    height: column.height + 40
    width: delegate.ListView.view.width - 20
    x: 5

    /*EnginioClient {
        id: client
        backendId: {"54a9c4b05a3d8b5e1a00c046"} // copy/paste your EDS instance backend id here
        onFinished: console.log("Request served." + reply.data)
        onError: console.log("Ooops! Something went wrong!", JSON.stringify(reply.data))
    }

    EnginioModel {
        id: enginioModel
        //backendId: {"54a9c4b05a3d8b5e1a00c046"}
        client: client
        query:{
             update: {
            "objectType": "objects.localFeed",
            "minutesUntilExp": timeStamp.minutesUntilExp(expirationDate)
            }
        }
    }*/

    TimeStamp {
        id: timeStamp
    }

    Component.onCompleted: minutesUntilExp = timeStamp.minutesUntilExp(expirationDate)

    Loader {
        id: issueProf
        anchors.fill: parent
    }

    Row {

        spacing: 15

        Column {

            id: column
            x: 20; y: 20
            width: parent.width - 100
            spacing: 10

            Row {
                id: row
                spacing: 20
                width: parent.width

                Image {
                    id: star
                    sourceSize.width: 20
                    sourceSize.height: 16
                    source: "qrc:starUnchecked.png"
                    MouseArea {
                      id: mouseArea
                      anchors.fill: parent
                      onClicked: {
                          star.source = (user.addToTracking(id) === true) ? star.source = "starUnchecked.png": star.source = "starChecked.png"
                      }
                    }
                }

                Text {
                    id: titleText
                    text: issue; wrapMode: Text.WordWrap
                    font { bold: false; family: "Helvetica"; pixelSize: 20; underline: true }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            currentIssue.id = id
                            //currentIssue.feed =
                            content.source = "IssueProfile.qml"
                            //currentIssue.backToFeed = false
                        }
                    }
                }

            }

            Row {

                spacing: 20

                Text {
                    id: descriptionText
                    color: "#837c7c"; text: timeStamp.date(expirationDate)
                    font.family: "Helvetica"
                    font.pixelSize: 14
                }

                Text {
                    id: subjectText
                    color: "#837c7c"; text: subject;
                    font {bold: true; pixelSize: 14}
                    font.family: "Helvetica"
                }

            }
        }



        Column {
            x: 20; y: 20
            height: parent.height
            width: Screen.width - column.width
            spacing: 15

            Row {
                spacing: 20

                Image {
                    id: thumbsUp
                    sourceSize.width: 20
                    sourceSize.height: 16
                    source: "qrc:greenThumbsUp.png"
                    MouseArea {
                      anchors.fill: parent
                      onClicked: {
                          checkYea.visible = true
                      }
                    }
                }

                Image {
                    id: redThumbsDown
                    sourceSize.width: 20
                    sourceSize.height: 16
                    source: "qrc:thumbsDownRed.png"
                    MouseArea {
                      anchors.fill: parent
                      onClicked: {
                          checkNay.visible = true
                      }
                    }
                }

            }

            Text {
                id: voteCount
                //anchors.left: titleText.right
                text: "(" + votes + " votes" + ")"; width: parent.width;
                //color:
                font { bold: false; family: "Helvetica"; pixelSize: 14 }
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
        color: "green"

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
                            //minutesUntilExp = 1
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
        //color: "#FE2E64"
        color: "Red"
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

