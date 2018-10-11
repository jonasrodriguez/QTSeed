import QtQuick 2.0
import QtQuick.Dialogs 1.2

Dialog {
    title: "Add New Patient"
    modality: Qt.WindowModal
    height: 600
    width: 400
    standardButtons: StandardButton.Cancel | StandardButton.Save
//    visible: true

//    Component.onCompleted: {
//        nameValue.text = "";
//        surnameValue.text = "";
//        dobValue.text = "";
//        emailValue = "";
//    }

//    onAccepted: {
//        newPatientDlg.saveNewPatient(nameValue.text, surnameValue.text, dobValue.text, emailValue.text);
//        close();
//    }

    Item {
        anchors.fill: parent

        Item {
            id: newUserTitleArea
            width: parent.width * 0.9
            height: parent.width * 0.1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: newUserTitle
                text: qsTr("Add New Patient")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
            }

            Rectangle{
                width: parent.width
                height: 1
                border.color: "black"
                border.width: 1
                anchors.bottom: parent.bottom
                color: "transparent"
            }
        }

        Item {
            id: patientName
            width: parent.width * 0.9
            height: newUserTitleArea.height * 0.8
            anchors.top: newUserTitleArea.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: height * 0.8

            Item {
                id: nameLabelArea
                width: parent.width / 3
                height: parent.height
                anchors.left: parent.left

                Text {
                    id: nameLabel
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.1
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Patient Name")
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: nameTextArea
                width: parent.width - nameLabelArea.width
                height: parent.height
                anchors.right: parent.right
                color: "#ffffff"

                TextInput {
                    id: nameValue
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.08
                    verticalAlignment: Text.AlignVCenter
                    maximumLength: 31
                    font.pixelSize: 12
                    KeyNavigation.tab: surnameValue
                    text: qsTr("")
                }
            }
        }

        Item {
            id: patientSurname
            width: parent.width * 0.9
            height: newUserTitleArea.height * 0.8
            anchors.top: patientName.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: height * 0.3

            Item {
                id: surnameLabelArea
                width: parent.width / 3
                height: parent.height
                anchors.left: parent.left

                Text {
                    id: surnameLabel
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.1
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Patient Surname")
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: surnameTextArea
                width: parent.width - surnameLabelArea.width
                height: parent.height
                anchors.right: parent.right
                color: "#ffffff"

                TextInput {
                    id: surnameValue
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.08
                    verticalAlignment: Text.AlignVCenter
                    maximumLength: 31
                    font.pixelSize: 12
                    KeyNavigation.tab: dobValue
                    text: qsTr("")
                }
            }
        }

        Item {
            id: patientDob
            width: parent.width * 0.9
            height: newUserTitleArea.height * 0.8
            anchors.top: patientSurname.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: height * 0.3

            Item {
                id: dobLabelArea
                width: parent.width / 3
                height: parent.height
                anchors.left: parent.left

                Text {
                    id: dobLabel
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.1
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Date of Birth")
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: dobTextArea
                width: parent.width - surnameLabelArea.width
                height: parent.height
                anchors.right: parent.right
                color: "#ffffff"

                TextInput {
                    id: dobValue
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.08
                    verticalAlignment: Text.AlignVCenter
                    maximumLength: 31
                    font.pixelSize: 12
                    KeyNavigation.tab: emailValue
                    text: qsTr("")
                }
            }
        }

        Item {
            id: patientEmail
            width: parent.width * 0.9
            height: newUserTitleArea.height * 0.8
            anchors.top: patientDob.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: height * 0.3

            Item {
                id: emailLabelArea
                width: parent.width / 3
                height: parent.height
                anchors.left: parent.left

                Text {
                    id: emailLabel
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.1
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Patient Email")
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: emailTextArea
                width: parent.width - emailLabelArea.width
                height: parent.height
                anchors.right: parent.right
                color: "#ffffff"

                TextInput {
                    id: emailValue
                    width: parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: width * 0.08
                    verticalAlignment: Text.AlignVCenter
                    maximumLength: 31
                    font.pixelSize: 12
                    text: qsTr("")
                }
            }
        }
    }
}
