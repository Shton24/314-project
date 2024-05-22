from flask import Flask, jsonify, request
import sqlite3

app = Flask(__name__)

def connect_db():
    conn = sqlite3.connect('test2.db')
    return conn

@app.route('/restaurants', methods=['GET'])
def get_restaurants():
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM restaurants")
    rows = cursor.fetchall()
    conn.close()
    restaurants = []
    for row in rows:
        restaurants.append({
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'image': row[3]
        })
    return jsonify(restaurants)

if __name__ == '__main__':
    app.run(debug=True)
