# Flask backend placeholder
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return 'Gait Analysis Backend Running'