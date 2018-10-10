import QtQuick 2.0

Rectangle {
    id: delegateArea
    width: patientListArea.width
    height: 70
    color: "#ff5500"
    border.width: 2

    Rectangle {
        id: idArea
        width: parent.width * 0.1
        height: parent.height * 0.3
        anchors.left: parent.left
        border.color: "black"
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
            width: parent.width / 2
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: idLabelArea.right
            Text{
                id: idText
                anchors.fill: parent
                anchors.leftMargin: 5
                text: "1234"
            }
        }
    }
    Rectangle {
        id: nameArea
        width: parent.width * 0.3
        height: parent.height * 0.3
        anchors.left: idArea.right
        border.color: "black"
        color: "transparent"
        Text {
            id: nameLabel
            anchors.verticalCenter: parent.verticalCenter
            text: "Patient Name:"
        }
        Rectangle {
            width: parent.width / 2
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: nameLabel.right
            Text{
                id: nameText
                anchors.fill: parent
                anchors.leftMargin: 5
                text: model.name
            }
        }
    }
    Rectangle {
        id: surnameArea
        width: parent.width * 0.3
        height: parent.height * 0.3
        anchors.left: nameArea.right
        border.color: "black"
        color: "transparent"
        Text {
            id: surnameLabel
            anchors.verticalCenter: parent.verticalCenter
            text: "Patient Surname:"
        }
        Rectangle {
            width: parent.width / 2
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: surnameLabel.right
            Text{
                id: surnameText
                anchors.fill: parent
                anchors.leftMargin: 5
                text: model.surname
            }
        }
    }
    Rectangle {
        id: emailArea
        width: parent.width * 0.3
        height: parent.height * 0.3
        anchors.left: nameArea.left;
        anchors.top: nameArea.bottom;
        border.color: "black"
        color: "transparent"
        Text {
            id: emailLabel
            anchors.verticalCenter: parent.verticalCenter
            text: "Patient Email:"
        }
        Rectangle {
            width: parent.width / 2
            height: parent.height
            border.color: "black"
            color: "transparent"
            anchors.left: emailLabel.right
            Text{
                id: emailText
                anchors.fill: parent
                anchors.leftMargin: 5
                text: model.email
            }
        }
    }
}
