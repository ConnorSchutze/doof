import QtQuick
import QtQuick.Controls
import "."

Rectangle {
    id: root
    anchors.fill: parent
    color: "black"

    property string primarytextcolor: "#FFFFFF"

    NavBar {
        id: navigationBar
        anchors.top: parent.top
        previous: "Home"
    }

    Text {
        id: title
        color: primarytextcolor
        font.bold: true
        font.pixelSize: 36
        text: "Recipes"
        anchors.top: navigationBar.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    ListModel {
        id: recipeModel
    }

    ListView {
        id: recipeListView
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: parent.width // Set width to match parent width
        height: parent.height - title.bottom // Adjust height to fit remaining space
        model: recipeModel
        delegate: Item {
            height: 30 // Set a fixed height for each item
            Rectangle {
                anchors.fill: parent // Fill the delegate item
                color: "white" // Set the background color to white
                Text {
                    anchors.centerIn: parent // Center the text within the rectangle
                    text: model.name
                    color: "#FFFFFF" // Set text color to black
                }
            }
        }
    }

    Component.onCompleted: {
        backend.loadHomeData("./cache/home.json")
        recipeModel.clear()

        if (backend.books.length === 0) {
            console.error("No data found in backend.books.")
        } else {
            for (var i = 0; i < backend.books.length; ++i) {
                recipeModel.append({ "name": backend.books[i] })
                console.log("Added item to recipeModel:", backend.books[i])
            }
        }
        // Print books to the console
        console.log("Books:", backend.books)
        console.log("Recipe Model:", recipeModel)
    }


    Item {
        id: newRecipeButton
        width: 300
        anchors.top: recipeListView.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.topMargin: 100
    
        CButton {
            color: "#FFFFFF"
            text: "Create new recipe book"
            onClicked: {
                backend.login(title.text, title.text)
            }
        }
    }
}
