import QtQuick

Rectangle {
    width: parent.width / 2; height: parent.height
    x: 0; y: 0
    color: "black"

    Image {
        source: "../images/chefHat.png"
        width: parent.width / 3; height: width * 1.25
        anchors.centerIn: parent
    }
}
