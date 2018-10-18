import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    id: patientsArea
    height: parent.height
    width: parent.width

    //Title
    Item {
        id: patientTitleArea

        width: parent.width * 0.8
        height: parent.height * 0.1
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: height
        anchors.leftMargin: height

        Text {
            id: patientTitleText
            text: qsTr("Patient List")
            font.pixelSize: 30
            font.family: "Monospace"
            color: "white"
        }

        //Add user button
        Rectangle {
            id: addUserButton
            width: parent.width * 0.15
            height: width / 4
            color: "#f47023"
            radius: 5
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: height / 5

            Rectangle {
                height: parent.height * 0.7
                width: height
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: width / 4
                radius: 5
                color: "white"

                Rectangle {
                    height: 2
                    width: parent.width * 0.7
                    anchors.left: parent.left
                    anchors.centerIn: parent
                    color: "transparent"
                    border.color: "#f47023"
                    border.width: 2
                }
                Rectangle {
                    height: parent.width * 0.7
                    width: 2
                    anchors.top: parent.top
                    anchors.centerIn: parent
                    color: "transparent"
                    border.color: "#f47023"
                    border.width: 2
                }
                Text {
                    anchors.left: parent.right
                    anchors.leftMargin: parent.width / 2
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Add User"
                    color: "white"
                    font.family: "PT Mono"
                    font.pixelSize: 12
                    font.bold: true
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    //Set inactive to reset the dialog in case it was open previously...
                    patientDialogLoad.active = false
                    patientDialogLoad.active = true
                    patientDialogLoad.item.open()
                 }
             }

             Component {
                 id: dlgComp
                 NewPatient {}
             }

             Loader {
                 id: patientDialogLoad
                 sourceComponent: dlgComp
                 active: false
             }
        }
    }

    //Patient List
    Item {
        id: patientListArea
        width: parent.width * 0.8
        height: parent.height * 0.7
        anchors.top: patientTitleArea.bottom
        anchors.left: patientTitleArea.left

        ListView {
            anchors.fill: parent
            anchors.topMargin: 4
            spacing: 1
            clip: true

            model: patientList
            delegate: delegate

            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.OvershootBounds
            ScrollBar.vertical: ScrollBar {
                anchors.right: parent.right
            }
        }

        Component {
            id: delegate
            PatientDelegate {
            }
        }
    }

    //Refresh Button
    Item {
        id: refreshButton
        width: patientTitleArea.height * 0.5
        height: width
        anchors.left: patientListArea.right
        anchors.bottom: patientListArea.bottom
        anchors.leftMargin: width / 4
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "res/RefreshIcon.png"
         }
        MouseArea {
            anchors.fill: parent
            onClicked: patientList.refreshPatientList()
        }
    }
}
