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

        SideBar {

        }
    }

    Rectangle {
        id: mainArea
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: sideBar.right
        width: parent.width - sideBar.width
        color: "#303030"

        Loader{
            id: dashLoader
            anchors.fill: parent
//            source: "PatientArea.qml"
            source: loginLogic.loginSuccess ? "PatientArea.qml" : "Login.qml"

//            onSourceChanged: animation.running = true

//            NumberAnimation {
//                id: animation
//                target: dashLoader.item
//                property: "x"
//                from: 0
//                to: dashLoader.item.width
//                duration: 1000
//                easing.type: Easing.InExpo
//            }
        }
    }
}
