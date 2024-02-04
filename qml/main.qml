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

    StackView {
        id: mainStack
        anchors.fill: parent

        initialItem: Login {
            id: loginPage
            onRegisterClicked: {
                mainStack.push(registerPage)
            }
        }

        Register {
            id: registerPage
            onLoginClicked: {
                mainStack.pop()
            }
        }
    }
}
