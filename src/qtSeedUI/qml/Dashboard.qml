import QtQuick 2.0

Rectangle {
    id: dashboard
//    width: 1280
//    height: 720

    Rectangle {
        id: sideBar
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width * 0.18
        color: "#00aaff"
    }

    Rectangle {
        id: mainArea
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * 0.82
        color: "#ffff7f"

        Rectangle {
            id: titleArea

            x: 339
            y: 74
            width: 111
            height: 35

            color: mainArea.color

            Text {
                id: titleText
                text: qsTr("Patients")
                font.pixelSize: 30
            }
        }

        Rectangle {
            id: patientListArea
            x: 339
            y: 124
            anchors.horizontalCenter: mainArea.horizontalCenter
            width: mainArea.width * 0.7
            height: mainArea.height * 0.7
            color: "#aaff7f"

            ListView {
                anchors.fill: parent
                spacing: 1
                clip: true
                flickableDirection: Flickable.VerticalFlick
                boundsBehavior: Flickable.StopAtBounds
                model: PatientList
                delegate: delegate
            }

            MouseArea {
                anchors.fill: parent
                onClicked: PatientList.addTestRow();
            }

            Component {
                id: delegate
                PatientDelegate {
                }
            }
        }
    }
}
