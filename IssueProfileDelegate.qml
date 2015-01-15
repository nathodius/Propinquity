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
    //anchors.fill: Screen

    TimeStamp {
        id: timeStamp
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
                spacing: 30
                width: parent.width

                Rectangle {
                    height: parent.height
                    width: 50
                    Image {
                        id: star
                        sourceSize.width: 24
                        sourceSize.height: 16
                        anchors.centerIn: parent
                        source: "qrc:starUnchecked.png"
                    }
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
                    //lineHeight: 16
                    //lineHeightMode: Text.FixedHeight
                    font { bold: true; family: "Helvetica"; pixelSize: 18; underline: false }
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

                spacing: 25

                Text {
                    id: descriptionText
                    color: "#837c7c"; text: timeStamp.date(expirationDate)
                    font.family: "Helvetica"
                    font.pixelSize: 14
                }

                Text {
                    id: subjectText
                    color: "#837c7c"; text: subject;
                    font {bold: false; pixelSize: 14}
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
        color: "red"//#FE2E64"
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
                    text: "Cast vote"
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


