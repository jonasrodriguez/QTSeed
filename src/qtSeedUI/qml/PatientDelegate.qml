import QtQuick 2.0

Rectangle {
    id: delegateArea
    width: patientListArea.width
    height: 70
    color: "#ff5500"
    border.width: 2

    MouseArea {
        anchors.fill: parent
        onPressAndHold: patientList.deletePatient(idText.text);
    }

    //ID
    Rectangle {
        id: idArea
        width: parent.width * 0.1
        height: parent.height * 0.3
        anchors.left: parent.left
        color: "transparent"
        Rectangle {
            id: idLabelArea
            width: parent.width / 3
            height: parent.height
            border.color: "black"
            color: "transparent"
            Text {
                id: idLabel
                anchors.verticalCenter: parent.verticalCenter
                text: "ID:"
            }
        }
        Rectangle {
            id: idTextArea
            width: parent.width / 2
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: idLabelArea.right
            Text{
                id: idText
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                text: model.id
            }
        }
    }
    //Patient Name
    Rectangle {
        id: nameArea
        width: parent.width * 0.3
        height: parent.height * 0.3
        anchors.left: idArea.right
        border.color: "black"
        color: "transparent"
        Rectangle {
            id: nameLabelArea
            width: parent.width / 3
            height: parent.height
            border.color: "black"
            color: "transparent"
            Text {
                id: nameLabel
                anchors.verticalCenter: parent.verticalCenter
                text: "Patient Name:"
            }
        }
        Rectangle {
            id: nameTextArea
            width: parent.width - nameLabelArea.width
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: nameLabelArea.right
            Text{
                id: nameText
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                text: model.name
            }
        }
    }
    //Patient Surname
    Rectangle {
        id: surnameArea
        width: parent.width * 0.4
        height: parent.height * 0.3
        anchors.left: nameArea.right
        border.color: "black"
        color: "transparent"
        Rectangle {
            id: surnameLabelArea
            width: parent.width / 3
            height: parent.height
            border.color: "black"
            color: "transparent"
            Text {
                id: surnameLabel
                anchors.verticalCenter: parent.verticalCenter
                text: "Patient Surname:"
            }
        }
        Rectangle {
            id: surnameTextArea
            width: parent.width - surnameLabelArea.width
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: surnameLabelArea.right
            Text{
                id: surnameText
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                text: model.surname
            }
        }
    }
    //Patient Date of Birth
    Rectangle {
        id: doblArea
        width: parent.width * 0.3
        height: parent.height * 0.3
        anchors.left: nameArea.left;
        anchors.top: nameArea.bottom;
        border.color: "black"
        color: "transparent"
        Rectangle {
            id: dobLabelArea
            width: parent.width / 3
            height: parent.height
            border.color: "black"
            color: "transparent"
            Text {
                id: dobLabel
                anchors.verticalCenter: parent.verticalCenter
                text: "Patient DoB:"
            }
        }
        Rectangle {
            id: dobTextArea
            width: parent.width  - dobLabelArea.width
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: dobLabelArea.right
            Text{
                id: doblText
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                text: model.dob
            }
        }
    }
    //Patient Email
    Rectangle {
        id: emailArea
        width: parent.width * 0.4
        height: parent.height * 0.3
        anchors.left: surnameArea.left;
        anchors.top: surnameArea.bottom;
        border.color: "black"
        color: "transparent"
        Rectangle {
            id: emailLabelArea
            width: parent.width / 3
            height: parent.height
            border.color: "black"
            color: "transparent"
            Text {
                id: emailLabel
                anchors.verticalCenter: parent.verticalCenter
                text: "Patient Email:"
            }
        }
        Rectangle {
            id: emailTextArea
            width: parent.width  - emailLabelArea.width
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: emailLabelArea.right
            Text{
                id: emailText
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                text: model.email
            }
        }
    }
}
