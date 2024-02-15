import QtQuick
import QtQuick.Controls

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

    TextInput {
        id: titleLabel
        color: recipePage.primarytextcolor
        font.bold: true
        font.pixelSize: 36
        text: backend.recipeTitle 
        anchors.top: navigationBar.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        onEditingFinished: {
            backend.updateRecipe(titleLabel.text, ingredientsLabel.text, directionsLabel.text)
        }
    }

    Text {
        id: ingredientsTitle
        color: recipePage.primarytextcolor
        font.pixelSize: 28
        text: "Ingredients:"
        anchors.top: titleLabel.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    TextInput {
        id: ingredientsLabel
        color: recipePage.primarytextcolor
        text: backend.recipeIngredients 
        anchors.top: ingredientsTitle.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        onEditingFinished: {
            backend.updateRecipe(titleLabel.text, ingredientsLabel.text, directionsLabel.text)
        }
    }

    Text {
        id: directionsTitle
        color: recipePage.primarytextcolor
        font.pixelSize: 28
        text: "Directions:"
        anchors.top: ingredientsLabel.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    TextInput {
        id: directionsLabel
        color: recipePage.primarytextcolor
        text: backend.recipeDirections 
        anchors.top: directionsTitle.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        onEditingFinished: {
            backend.updateRecipe(titleLabel.text, ingredientsLabel.text, directionsLabel.text)
        }
    }

    Component.onCompleted: {
        backend.loadRecipeData("./cache/spaghetti.json") 
    }
}
