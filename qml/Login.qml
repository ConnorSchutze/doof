import QtQuick
import QtQuick.Controls
import "."

Item {
    id: loginPage
    anchors.fill: parent

    signal registerClicked()

    DesignHalf {

    }

    Rectangle {
        id: loginHalf
        width: parent.width / 2; height: parent.height
        x: parent.width / 2; y: 0
        color: "white"

        Column {
            width: parent.width / 2
            anchors.centerIn: parent
            spacing: 65

            // Title text
            Column {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                Text {
                    text: "Login"
                    color: "#000000"
                    font.pixelSize: 28
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    text: "Sign in to continue, enjoy making recipes"
                    color: "#000000"
                    font.pixelSize: 14
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            // Login section
            Column {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                TextEntry {
                    id: username
                    helpText: "Please enter your username"
                    placeholderText: "Username"
                }

                TextEntry {
                    id: password
                    helpText: "Please enter your password"
                    placeholderText: "Password"
                    isPassword: true
                }

                CButton {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Login"
                    onClicked: {
                        backend.login(username.text, password.text)
                    }
                }
            }

            // Register section
            Column {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Not Registered?"
                    color: "#000000"
                    font.pixelSize: 14
                }

                CButton {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Register"
                    onClicked: {
                        registerClicked()
                    }
                }
            }
        }
    }
}
