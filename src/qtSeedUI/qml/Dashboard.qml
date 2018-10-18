import QtQuick 2.0

Rectangle {
    id: dashboard

    Rectangle {
        id: sideBar
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width * 0.18
        color: "#097bed"

        Item {
            id: sideBarImage
            width: parent.width * 0.9
            height: parent.height * 0.2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10

            Image {
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "res/werfenIcon.png"
            }
        }
    }

    Rectangle {
        id: mainArea
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * 0.82
        color: "#303030"

        Loader{
            anchors.fill: parent
            source: "PatientArea.qml"
        }
    }
}
