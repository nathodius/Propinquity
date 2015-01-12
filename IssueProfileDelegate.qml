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
    //anchors.fill: Screen

    Row {
        //anchors.l

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

                Image {
                    id: star
                    sourceSize.width: 20
                    sourceSize.height: 20
                    source: "qrc:starUnchecked.png"
                    MouseArea {
                      id: mouseArea
                      anchors.fill: parent
                      onClicked: {
                          //checkYea.visible = true
                      }
                    }
                }

                Text {
                    id: titleText
                    text: issue; width: (parent.width - 200); wrapMode: Text.WordWrap
                    font { bold: true; family: "Helvetica"; pointSize: 24 }
                    MouseArea {
                        width: parent.width
                        height: parent.height
                        onClicked: content.source = "IssueProfile.qml"
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
                Image {
                    id: thumbsUp
                    sourceSize.width: 25
                    sourceSize.height: 25
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
                    sourceSize.width: 25
                    sourceSize.height: 25
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
            //anchors.top: parent.top
            //anchors.topMargin: 25
            //anchors.horizontalCenter: parent.horizontalCenter
            /*Rectangle{
                    height: 10
                    width: parent.width
                    color: "green"
                }*/
            /*Text {
                    id: txt
                    //anchors.centerIn: parent
                    text: "VOTE YEA"
                }*/
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
                        content.source = "Content.qml"
                    }
                }
                Button {
                    id: canelButton
                    text: "Cancel vote"
                    onClicked: {
                        //content.source = "TabView.qml"
                        checkYea.visible = false
                        //anchors.left: checkYea
                        //anchors.leftMargin: 5
                    }
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
            //anchors.top: parent.top
            //anchors.topMargin: 25
            //anchors.horizontalCenter: parent.horizontalCenter
            /*Rectangle{
                height: 10
                width: parent.width
                color: "darkred"
            }*/
            /*Text {
                //anchors.centerIn: parent
                text: "VOTE NAY"
            }*/
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
                        content.source = "Content.qml"
                        //tabView.currentIndex = currentIssue.feed
                    }
                }
                Button {
                    id: canelButton2
                    text: "Cancel vote"
                    onClicked: checkNay.visible = false
                    //anchors.left: checkYea
                    //anchors.leftMargin: 5
                }
            }
        }

    }

    Rectangle {
        id: bottomLine
        width: parent.width; height: 1; color: "#cccccc"
        anchors.bottom: parent.bottom
    }

    Flickable {
        clip: true
        anchors.top: bottomLine.bottom
        anchors.topMargin: 5
        //anchors.margins: 25
        id: scroller
        width: Screen.width
        height: Screen.height
        contentWidth: Screen.width
        contentHeight: 1.25 * Screen.height
        maximumFlickVelocity: 1500
        boundsBehavior: Flickable.DragOverBounds
        flickableDirection: Flickable.VerticalFlick

        Column {
            id: contents
            width: parent.width
            spacing: 30
            //anchors.top: bottomLine.bottom
            anchors.left: parent.left
            anchors.topMargin: 30
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            Label { text: "Detailed Description"}

            Text {
                id: descriptionText2
                width: parent.width - 50; color: "black"; //text: description
                wrapMode: Text.WordWrap; font.family: "Helvetica"
            }

            Label { text: "Political Players"}

            Label { text: "News/Educational Sources"}

        }
    }
}


