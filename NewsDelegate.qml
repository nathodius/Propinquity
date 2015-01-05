import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3

Item {
     id: delegate
     height: column.height + 40
     width: delegate.ListView.view.width - 20
     x: 5

     Row {

    // anchors.horizontalCenter: parent

    //width: parent.width - 50

     Column {

         /*MouseArea {
             width: parent.width
             height: parent.height
             //onClicked: source = "AcctInfoPage.qml"
         }*/

         id: column
         x: 20; y: 20
         width: parent.width - 100
         spacing: 10

         Row {
         id: row
         spacing: 10
         width: parent.width
         //height: (2/3)*parent.

         Text {
             id: titleText
             text: issue; width: (parent.width - 200); wrapMode: Text.WordWrap
             font { bold: true; family: "Helvetica"; pointSize: 16 }
             MouseArea {
                 width: parent.width
                 height: parent.height
                 onClicked: content.source = "IssueProfile.qml"
             }
         }

         Text {
             id: voteCount
             //anchors.left: titleText.right
             text: "(" + votes + " votes" + ")"; width: parent.width; wrapMode: Text.WordWrap
             font { bold: false; family: "Helvetica"; pointSize: 16 }
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

         CheckBox {
             text: "YEA"
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
         }
         CheckBox {
             text: "NAY"
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
         }

      }

}
     Rectangle {
         width: parent.width; height: 1; color: "#cccccc"
         anchors.bottom: parent.bottom
     }
 }

