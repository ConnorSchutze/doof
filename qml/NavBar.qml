import QtQuick
import "."

Item {
    id: root
    width: parent.width
    height: 50
    anchors.top: parent.top

    property string title: "Doof"
    property string previous: "Previous"
    signal logOut
    signal previous
    signal guide

    Text {
        text: root.title
        color: "#FFFFFF"
        font.bold: true
        font.pixelSize: 20
        anchors.left: parent.left
        verticalAlignment: Text.AlignVCenter
    }
    
    Item {
        id: logOut
        width: 150
        anchors.right: parent.right

        CButton {
            color: "#FFFFFF"
            text: "Log Out"
            onClicked: {
                backend.logOut()
            }
        }
    }
    
    
    MouseArea {
        id: previous
        width: 60
        anchors.right: logOut.left

        onClicked: {
            root.previous()
        }

        Text {
            text: root.previous
            font.bold: true
            color: "#FFFFFF"
            verticalAlignment: Text.AlignVCenter
        }
    }
    
    
    MouseArea {
        id: guide
        width: 60
        anchors.right: previous.left

        onClicked: {
            root.guide()
        }

        Text {
            text: "Guide"
            font.bold: true
            color: "#FFFFFF"
            verticalAlignment: Text.AlignVCenter
        }
    }
}
