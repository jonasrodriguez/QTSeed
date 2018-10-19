import QtQuick 2.0

Item {
    anchors.fill: parent

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

    Rectangle {
        width: sideBarImage.width
        height: width
        anchors.top: sideBarImage.bottom
        anchors.left: sideBarImage.left
        anchors.topMargin: height / 3
    }
}
