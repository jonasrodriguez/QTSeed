import QtQuick 2.0

Item {
    id: patientsArea
    height: parent.height
    width: parent.width

    Rectangle {
        id: patientTitleArea

        x: 339
        y: 74
        width: 111
        height: 35

        color: "transparent"

        Text {
            id: patientTitleText
            text: qsTr("Patients")
            font.pixelSize: 30
        }
    }

    Rectangle {
        id: patientListArea
        x: 339
        y: 124
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.7
        height: parent.height * 0.7
        color: "#aaff7f"

        ListView {
            anchors.fill: parent
            spacing: 1
            clip: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            model: patientList
            delegate: delegate
        }

        MouseArea {
            anchors.fill: parent
            onClicked: patientList.addTestRow();
        }

        Component {
            id: delegate
            PatientDelegate {
            }
        }
    }

    Rectangle {
        id: addUserButton
         width: parent.width * 0.09
         height: width
         color: "red"
         radius: width * 0.5
         anchors.right: parent.right
         anchors.bottom: parent.bottom
         Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "res/addUserIcon.png"
         }

         MouseArea {
             anchors.fill: parent
             onClicked: {
                 //Set inactive to reset the dialog in case it was open previously...
//                 patientDialogLoad.active = false
//                 patientDialogLoad.active = true
//                 patientDialogLoad.item.open()
                 newPatientDlg.saveNewPatient("nameValue.text", "surnameValue.text", "dobValue.text", "emailValue.text")
             }
         }

         Component {
             id: diaComp
             NewPatient {
                id: newPatientDlg
             }
         }

         Loader {
             id: patientDialogLoad
             sourceComponent: diaComp
             active: false
         }
    }
}
