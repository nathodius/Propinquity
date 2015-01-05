import QtQuick 2.0
import Enginio 1.0
import QtQuick.Controls 1.2

Rectangle {
    color: "white"
    anchors.fill: parent
    EnginioClient {
        id: client
        backendId: {"54a9c4b05a3d8b5e1a00c046"} // copy/paste your EDS instance backend id here
        onFinished: console.log("The object was created." + reply.data)
        onError: console.log("Ooops! Something went wrong!", JSON.stringify(reply.data))
    }

/*Component.onCompleted: {
    var city = {
        objectType: "objects.city",
        name: "Helsinki",
        population: 606000
    };
    client.create(city);
}*/
    EnginioModel {
        id: enginioModel
        //backendId: {"54a9c4b05a3d8b5e1a00c046"}
        client: client
        query: { "objectType": "objects.localFeed" }
    }
    ListView {
        anchors.fill: parent
        model: enginioModel
        /*delegate: Text {
            text: name + ": " + population
        }*/
        delegate: NewsDelegate {

        }

    }

}



