import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: mainWindow
    visible: true
    title: qsTr("QT Seed")
//    width: pageLoader.implicitWidth
//    height: pageLoader.implicitHeight
//    width: loginLogic.loginSuccess ? 1280 : 400
//    height: loginLogic.loginSuccess ? 720 : 300
    width: 1280
    height: 720

    Loader {        
        id: pageLoader
        anchors.fill: parent
//        source: loginLogic.loginSuccess ? "Dashboard.qml" : "Login.qml"
        source: "Dashboard.qml"

//        onLoaded: {
//            setX(Screen.width / 2 - width / 2);
//            setY(Screen.height / 2 - height / 2);
//        }
    }
}
