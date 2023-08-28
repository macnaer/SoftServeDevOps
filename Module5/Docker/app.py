from flask import Flask, render_template
import random
app = Flask(__name__)


@app.route('/')
def index():
    url = "https://cataas.com/cat"
    return render_template('index.html', url=url)


if __name__ == "__main__":
    app.run(host="0.0.0.0")
