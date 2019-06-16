from flask import Flask
import sqlite3
app = Flask(__name__)

conn = sqlite3.connect('/home/bailytroyer/test.db')

@app.route('/join-activity', methods=['POST'])
def hello_world():
    """{"user": "--", "activity_id": "--"}"""
    # add user to activity
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'


@app.route('/create-user', methods=['POST'])
def hello_world():
    """..."""
    # add user to activity
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'
    

@app.route('/user-exists', methods=['POST'])
def hello_world():
    """return bool if exists -> take in email"""
    # add user to activity
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'


@app.route('/user-id', methods=['POST'])
def hello_world():
    """"{"email": "--"} -> {"user_id": "--"} """
    # add user to activity
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'


@app.route('/create-activity', methods=['POST'])
def hello_world():
    """whole object"""
    # add user to activity
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'


@app.route('/get-active-activities', methods=['POST'])
def hello_world():
    """where active is true -> list of objects [{},{}]"""
    # add user to activity
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'


@app.route('/deactivate-activity', methods=['POST'])
def hello_world():
    """{"activity_id": "--"} -> return 0/1"""
    # add user to activity
    c = conn.cursor()
    c.execute("select * from a")
    conn.commit()
    conn.close()
    return 'Hello, World!'


if __name__ == '__main__':
    app.run(port='5000', debug=True)