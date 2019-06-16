from flask import Flask
import sqlite3
app = Flask(__name__)

conn = sqlite3.connect('/home/bailytroyer/test.db')

@app.route('/')
def hello_world():
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'
