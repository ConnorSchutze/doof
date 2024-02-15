import QtQuick
import "."

Rectangle {
    id: recipePage
    anchors.fill: parent
    color: "black"

    NavBar {
        anchors.top: parent.top
        previous: "Home"
    }
}
