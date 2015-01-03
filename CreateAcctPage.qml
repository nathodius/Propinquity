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
            contentHeight: 700
            maximumFlickVelocity: 1500
            boundsBehavior: Flickable.StopAtBounds
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
                id: emailField
                width: 250
                height: 50
                anchors.top: title.bottom
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 50


                Label {
                    id: label1
                    y: 292
                    text: qsTr("Label")
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }

                TextField {
                    id: textField1
                    x: 709
                    y: 289
                    placeholderText: qsTr("Text Field")
                }

            }

          RowLayout {
              id: passwordField
              x: -6
              width: 250
              height: 50
              anchors.top: emailField.bottom
              anchors.topMargin: 30
              anchors.horizontalCenterOffset: 0
              Label {
                  id: label2
                  y: 292
                  text: qsTr("Label")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: textField2
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: rowLayout3
              x: -8
              width: 250
              height: 50
              anchors.top: passwordField.bottom
              anchors.topMargin: 30
              anchors.horizontalCenterOffset: 0
              Label {
                  id: password_reEnterField
                  y: 292
                  text: qsTr("Label")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: textField3
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: genderField
              x: -13
              width: 250
              height: 50
              anchors.top: rowLayout3.bottom
              anchors.topMargin: 30
              Label {
                  id: label4
                  y: 292
                  text: qsTr("Label")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: textField4
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: ageField
              x: -15
              width: 250
              height: 50
              anchors.top: genderField.bottom
              anchors.topMargin: 30
              Label {
                  id: label5
                  y: 292
                  text: qsTr("Label")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: textField5
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: ethnicityField
              x: -17
              width: 250
              height: 50
              anchors.top: ageField.bottom
              anchors.topMargin: 30
              Label {
                  id: label6
                  y: 292
                  text: qsTr("Label")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: textField6
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          RowLayout {
              id: incomeField
              x: -20
              width: 250
              height: 50
              anchors.top: ethnicityField.bottom
              anchors.topMargin: 30
              Label {
                  id: label7
                  y: 292
                  text: qsTr("Label")
                  anchors.left: parent.left
                  anchors.leftMargin: 10
              }

              TextField {
                  id: textField7
                  x: 709
                  y: 289
                  placeholderText: qsTr("Text Field")
              }
              spacing: 50
              anchors.horizontalCenterOffset: 0
              anchors.horizontalCenter: parent.horizontalCenter
          }

          Button {
              id: submissionButton
              x: 922
              text: qsTr("SUBMIT")
              anchors.top: incomeField.bottom
              anchors.topMargin: 50
              anchors.horizontalCenter: parent.horizontalCenter
          }

            // District information
        }

}

