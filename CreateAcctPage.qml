import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Rectangle {
    id: rectangle1
    width: Screen.width
    height: Screen.height

    /*ColumnLayout {
        id: columnLayout1
        x: 8
        width: 300
        height: 400
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter*/



        Flickable {
            id: scroller
            width: Screen.width
            height: Screen.height
            anchors.verticalCenterOffset: 15
            anchors.horizontalCenterOffset: -47
            contentWidth: Screen.width
            contentHeight: 800
            maximumFlickVelocity: 1500
            boundsBehavior: Flickable.DragOverBounds
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            flickableDirection: Flickable.VerticalFlick

            Label {
                                id: title
                                text: qsTr("Complete the form.")
                                anchors.top: parent.top
                                anchors.topMargin: 50
                                anchors.horizontalCenter: parent.horizontalCenter
            }



            RowLayout {
                id: emailRow
                width: 250
                height: 50
                anchors.top: title.bottom
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 95


                Label {
                    id: emailLabel
                    y: 292
                    width: 70
                    text: qsTr("EMAIL")
                    horizontalAlignment: Text.AlignLeft
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }

                TextField {
                    id: emailField
                    x: 709
                    y: 289
                    placeholderText: qsTr("Text Field")
                }

            }

          RowLayout {
              id: passwordRow
              x: -6
              width: 250
              height: 50
              anchors.top: emailRow.bottom
              anchors.topMargin: 30
              anchors.horizontalCenterOffset: 0
              Label {
                  id: passwordLabel
                  y: 292
                  text: qsTr("PASSWORD")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: passwordField
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: password_reEnterRow
              x: -8
              width: 250
              height: 50
              anchors.top: passwordRow.bottom
              anchors.topMargin: 30
              anchors.horizontalCenterOffset: 0
              Label {
                  id: password_reEnterLabel
                  y: 292
                  text: qsTr("PASSWORD")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: password_reEnterField
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: genderRow
              x: -13
              width: 250
              height: 50
              anchors.top: password_reEnterRow.bottom
              anchors.topMargin: 30
              Label {
                  id: genderLabel
                  y: 292
                  width: 70
                  text: qsTr("GENDER   ")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }
              ComboBox {
                  id: genderSelect
                  y: 448
                  width: 100
                  anchors.left: genderLabel.right
                  anchors.leftMargin: 50
                  model: ["female", "male"]
              }
              spacing: 1
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: ageRow
              x: -15
              width: 250
              height: 50
              anchors.top: genderRow.bottom
              anchors.topMargin: 30
              Label {
                  id: ageLabel
                  y: 292
                  text: qsTr("AGE")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }
              ComboBox {
                  id: ageSelect
                  x: 640
                  y: 368
                  width: 100
                  model: ["18-25", "26-34", "35-44", "45-54", "55+"]
              }
              spacing: 105.1
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: ethnicityRow
              x: -17
              width: 250
              height: 50
              anchors.top: ageRow.bottom
              anchors.topMargin: 30
              Label {
                  id: ethnicityLabel
                  y: 292
                  text: qsTr("ETHNICITY")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }
              ComboBox {
                  id: ethnicitySelect
                  x: 640
                  y: 528
                  width: 100
                  model: ["Black", "White"]
              }
              spacing: 48
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: incomeRow
              x: -20
              width: 250
              height: 50
              anchors.top: ethnicityRow.bottom
              anchors.topMargin: 30
              Label {
                  id: incomeLabel
                  y: 292
                  text: qsTr("INCOME")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }
              ComboBox {
                  id: incomeSelect
                  x: 640
                  y: 608
                  width: 100
                  model: ["30k-", "30-50k", "50-80k", "80-150k", "150k+"] // by tax bracket???
              }
              spacing: 67
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          Button {
              id: submissionButton
              x: 922
              text: qsTr("SUBMIT")
              anchors.top: incomeRow.bottom
              anchors.topMargin: 50
              anchors.horizontalCenter: parent.horizontalCenter
              onClicked: content.source = "TabView.qml"
              // capture credentials
          }

            // District information
        }

}

