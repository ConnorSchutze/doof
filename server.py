import json
from flask import Flask

app = Flask(__name__)

def main():
    app = Flask(__name__)

    @app.route('/recipes')
    def get_recipes():
        return {"recipes": ["Recipe 1", "Recipe 2"]}

    app.run(host='127.0.0.1', port=5000)

if __name__ == "__main__":
    main()
