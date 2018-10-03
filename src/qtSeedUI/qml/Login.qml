import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle{
    id: idLogin
    width: 400
    height: 300

    Item {
        id: idItemLogin
        width: parent.width / 2
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -parent.height / 4

        ColumnLayout {
            id: idLoginColumn
            anchors.fill: parent
            anchors.margins: 3
            spacing: 3

            TextField {
                id: idUsernameTextField
                Layout.fillWidth: true
                placeholderText: "User Name"
                KeyNavigation.tab: idPasswordTextField                
            }

            TextField {
                id: idPasswordTextField
                Layout.fillWidth: true
                placeholderText: "Password"
                echoMode: TextInput.Password
                Keys.onPressed: if (event.key === Qt.Key_Return) { loginLogic.buttonLogin(idUsernameTextField.text, idPasswordTextField.text) }
                KeyNavigation.tab: idBtnLogin                
            }

            Button {
                id: idBtnLogin
                Layout.fillWidth: true
                text: "Login"
                KeyNavigation.tab: idUsernameTextField
                Keys.onPressed: if (event.key === Qt.Key_Return) { loginLogic.buttonLogin(idUsernameTextField.text, idPasswordTextField.text) }
                onClicked: loginLogic.buttonLogin(idUsernameTextField.text, idPasswordTextField.text);
            }
        }
    }
}
