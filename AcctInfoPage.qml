import QtQuick 2.1
import Enginio 1.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ColumnLayout {
    anchors.margins: 3
    spacing: 3
    TableView {
        Layout.fillWidth: true
        Layout.fillHeight: true

        TableViewColumn { title: "First name"; role: "firstName" }
        TableViewColumn { title: "Last name"; role: "lastName" }
        TableViewColumn { title: "Login"; role: "username" }
        TableViewColumn { title: "Email"; role: "email" }

        model: EnginioModel {
            id: enginioModel
            //client: enginioClient
            operation: Enginio.UserOperation
            query: {"objectType": "users" }
        }
    }

    Button {
        text: "Refresh"
        Layout.fillWidth: true

        onClicked: {
            var tmp = enginioModel.query
            enginioModel.query = null
            enginioModel.query = tmp
        }
    }
}

