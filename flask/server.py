from flask import Flask
import sqlite3
app = Flask(__name__)

conn = sqlite3.connect('/home/bailytroyer/test.db')


# DONE
@app.route('/create-user', methods=['POST'])
def hello_world():
    """..."""
    jsn = request.json

    c = conn.cursor()
    c.execute("insert into User values ({},{},{},{},{},{})".format(jsn['user_id'], 
                                                                   jsn['email_address'],
                                                                   jsn['facebook_token'], 
                                                                   jsn['first_name'],
                                                                   jsn['last_name'], 
                                                                   jsn['dob'], 
                                                                   jsn['gender'], 
                                                                   jsn['profile_picture_url'
                                                                   ]))
    conn.commit()
    conn.close()
    return 'done'
    
# DONE
@app.route('/create-activity', methods=['POST'])
def hello_world():
    """whole object"""
    jsn = request.json

    c = conn.cursor()
    c.execute("insert into Activity values ({},{},{},{},{},{})".format(jsn['activity_id'], 
                                                                   jsn['host_id'],
                                                                   jsn['name'], 
                                                                   jsn['accessibility'],
                                                                   jsn['activity_type'], 
                                                                   jsn['participant_amount'], 
                                                                   jsn['price'], 
                                                                   jsn['link'],
                                                                   jsn['activity_key'],
                                                                   jsn['loc'],
                                                                   jsn['timestp'],
                                                                   jsn['active']
                                                                   ))
    conn.commit()
    conn.close()
    return 'done'

# DONE
@app.route('/user-exists', methods=['GET'])
def hello_world():
    """return bool if exists -> take in email"""

    email = request.json['email']

    c = conn.cursor()
    c.execute("select * from Users where Users.email = {}".format(email))
    result = False
    conn.commit()
    conn.close()
    return result

# DONE
@app.route('/join-activity', methods=['POST'])
def hello_world():
    """{"user_id": "--", "activity_id": "--"}"""

    jsn = request.json

    user_id = jsn['user_id']
    activity_id = jsn['activity_id']

    c = conn.cursor()
    c.execute("insert into UserBelongsToActivity values ({},{})".format(user_id, activity_id))
    conn.commit()
    conn.close()
    return 'done'

# DONE
@app.route('/user-id', methods=['GET'])
def hello_world():
    """"{"email": "--"} returns -> {"user_id": "--"} """

    jsn = request.json

    email_address = jsn['email_address']

    c = conn.cursor()
    c.execute("select user_id from User u where u.email_address = {}".format(email_address))
    result = c.fetchone()
    print("result: {}".format(result))
    conn.commit()
    conn.close()
    return result

# DONE
@app.route('/active-activities', methods=['GET'])
def hello_world():
    """where active is true -> list of objects [{},{}]"""
    # add user to activity
    c = conn.cursor()
    c.execute("select * from Activity a where a.active=true")
    rows = rows = cur.fetchall()
    conn.commit()
    conn.close()
    return rows

# DONE
@app.route('/deactivate-activity', methods=['POST'])
def hello_world():
    """{"activity_id": "--"} -> return 0/1"""
    
    jsn = request.json

    activity_id = jsn['activity_id']

    c = conn.cursor()
    c.execute("update Activity set active=false where activity_id={}".format(activity_id))
    conn.commit()
    conn.close()
    return 'Hello, World!'


# DONE
# @app.route('/is-activity-full', methods=['GET'])
# def hello_world():
#     """{"activity_id": "--"} -> return 0/1"""
    
#     jsn = request.json

#     activity_id = jsn['activity_id']

#     c = conn.cursor()
#     # 
#     c.execute("select * from Activity a where a.activity_id={} and a.participant_amount>count(select * from )".format(activity_id))
#     conn.commit()
#     conn.close()
#     return 'Hello, World!'


if __name__ == '__main__':
    app.run(port='5000', debug=True)