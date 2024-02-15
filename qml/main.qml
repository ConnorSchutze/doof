import QtQuick
import QtQuick.Controls
import "."

ApplicationWindow {
    id: main
    visible: true
    width: 1280; height: 600
    minimumWidth: 400; minimumHeight: 300
    title: "Doof"
    font.family: "Roboto"

    Rectangle {
        id: screen
        anchors.fill: parent
        color: "transparent"

        // Login page
        Login {
            id: loginPage
            visible: screen.state === "login"
            anchors.fill: parent
            onRegisterClicked: {
                screen.state = "register"
            }
        }

        // Register page
        Register {
            id: registerPage
            visible: screen.state === "register"
            anchors.fill: parent
            onLoginClicked: {
                screen.state = "login"
            }
        }

        // Recipe page
        Recipe {
            id: recipePage
            visible: screen.state === "recipe"
            anchors.fill: parent
        }

        // Define states
        states: [
            State {
                name: "login"
            },
            State {
                name: "register"
            },
            State {
                name: "recipe"
            }
        ]

        // Set initial state
        state: "login"
    }

    Connections {
        target: backend
        function onLoginSuccessSignal() {
            screen.state = "recipe"
        }
        function onLogOutSignal() {
            screen.state = "login"
        }
    }
}
