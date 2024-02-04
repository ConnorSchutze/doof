import QtQuick

Item {
    id: root
    width: parent ? parent.width * 2/3 : 265
    height: 50
    anchors.horizontalCenter: parent.horizontalCenter

    property string text: "Change"
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#000000"
        radius: 10

        Text {
            anchors.centerIn: parent
            text: root.text
            color: "#FFFFFF"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.clicked()
            }
        }
    }
}
