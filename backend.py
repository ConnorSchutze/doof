import json
from PySide6.QtCore import QObject, Signal, Slot, Property

class Backend(QObject):
    loginSuccessSignal = Signal()
    logOutSignal = Signal()

    recipeTitleChanged = Signal()
    recipeIngredientsChanged = Signal()
    recipeDirectionsChanged = Signal()

    def __init__(self):
        super().__init__()
        self._recipe_title = ""
        self._recipe_ingredients = ""
        self._recipe_directions = ""

    @Slot(str, str)
    def login(self, username, password):
        self.username = username
        self.password = password
        print(f"Login: {username} {password}")

        # Check Login -> Login Success
        self.loginSuccessSignal.emit()
    
    @Slot(str, str)
    def register(self, username, password):
        self.username = username
        self.password = password
        print(f"Register: {username} {password}")
    
    @Slot()
    def logOut(self):
        self.username = ""
        self.password = ""
        print(f"Register: {self.username} {self.password}")
        self.logOutSignal.emit()
    
    @Property(str, notify=recipeTitleChanged)
    def recipeTitle(self):
        return self._recipe_title

    @Property(str, notify=recipeIngredientsChanged)
    def recipeIngredients(self):
        return self._recipe_ingredients

    @Property(str, notify=recipeDirectionsChanged)
    def recipeDirections(self):
        return self._recipe_directions

    @Slot(str)
    def loadRecipeData(self, file_path):
        try:
            with open(file_path, 'r') as file:
                data = json.load(file)
                recipe = data.get("recipe", {})
                self._recipe_title = recipe.get("title", "")
                self._recipe_ingredients = ", ".join(recipe.get("ingredients", []))
                self._recipe_directions = ", ".join(recipe.get("directions", []))

                # Emit signals to notify QML of property changes
                self.recipeTitleChanged.emit()
                self.recipeIngredientsChanged.emit()
                self.recipeDirectionsChanged.emit()
        except Exception as e:
            print("Error loading recipe data:", e)
    
    @Slot(str, str, str)
    def updateRecipe(self, title, ingredients, directions):
        try:
            # Create a dictionary with updated recipe data
            updated_recipe = {
                "title": title,
                "ingredients": ingredients.split(", "),
                "directions": directions.split(", ")
            }

            # Create a dictionary with updated recipe
            data = {"recipe": updated_recipe}

            # Write the updated data back to the JSON file
            with open("./cache/spaghetti.json", 'w') as file:
                json.dump(data, file)

            # Update the backend properties with the new data
            self._recipe_title = title
            self._recipe_ingredients = ingredients
            self._recipe_directions = directions

            # Emit signals to notify QML of property changes
            self.recipeTitleChanged.emit()
            self.recipeIngredientsChanged.emit()
            self.recipeDirectionsChanged.emit()
        except Exception as e:
            print("Error updating recipe:", e)

