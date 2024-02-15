import QtQuick

Item {
    id: root
    width: buttonWidth
    height: 50
    anchors.horizontalCenter: parent.horizontalCenter

    property int buttonWidth: parent ? parent.width * 2/3 : 265
    property string color: "#000000"
    property string text: "Change"
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: root.color
        radius: 10

        Text {
            anchors.centerIn: parent
            text: root.text
            color: root.color === "#000000" ? "#FFFFFF" : "#000000"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.clicked()
            }
        }
    }
}
