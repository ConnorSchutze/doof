import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Column {
    id: root
    width: Math.min(parent ? parent.width : 265, 350)
    anchors.horizontalCenter: parent.horizontalCenter
    spacing: 5

    property string helpText: "Change"
    property string placeholderText: "-----"
    property bool isPassword: false
    property bool readOnly: false
    property alias text: entry.text

    Text {
        text: root.helpText
        color: "#000000"
        font.pixelSize: 10
    }

    TextField {
        id: entry
        width: root.width; height: 50
        placeholderText: root.placeholderText
        echoMode: root.isPassword ? TextInput.Password : TextInput.Normal
        readOnly: root.readOnly
        anchors.horizontalCenter: parent.horizontalCenter

        background: Rectangle {
            radius: 10
            border.color: "#000000"
        }
    }
}
