import QtQuick 2.0
import QtQuick.Layouts 1.3

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
        id: sideBarContent
        width: sideBarImage.width * 0.9
        height: width
        anchors.top: sideBarImage.bottom
        anchors.left: sideBarImage.left
        anchors.topMargin: height / 3
        anchors.leftMargin: height * 0.1
        color: "transparent"

        ColumnLayout {
            width: parent.width
            anchors.top: parent.top
            spacing: 3
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: sideBarContent.height / 4
                Text {
                    text: "Home"
                    color: "white"
                    font.family: "PT mono"
                    font.pixelSize: 16
                }
            }
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: sideBarContent.height / 4
                Text {
                    text: "Configuration"
                    color: "white"
                    font.family: "PT mono"
                    font.pixelSize: 16
                }
            }
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: sideBarContent.height / 4
                Text {
                    text: "Logout"
                    color: "white"
                    font.family: "PT mono"
                    font.pixelSize: 16
                }
            }
        }
    }
}
