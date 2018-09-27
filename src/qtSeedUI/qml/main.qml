import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: mainWindow
    visible: true
    title: qsTr("QT Seed")
    width: pageLoader.implicitWidth
    height: pageLoader.implicitHeight

    Loader {
        id: pageLoader

        source: loginLogic.loginSuccess ? "Dashboard.qml" : "Login.qml"

        onLoaded: {
            setX(Screen.width / 2 - width / 2);
            setY(Screen.height / 2 - height / 2);
        }
    }
}
