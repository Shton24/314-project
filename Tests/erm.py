from flask import Flask, jsonify, send_from_directory
import sqlite3


app = Flask(__name__)

# Connect to the SQLite database
database_path = 'test.db'
conn = sqlite3.connect(database_path)
cursor = conn.cursor()

# Check existing data in the CUSTOMER table
cursor.execute("SELECT customer_ID FROM CUSTOMER")
existing_ids = cursor.fetchall()
existing_ids = {id[0] for id in existing_ids}

# Generate unique IDs for the new data
start_id = max(existing_ids) + 1 if existing_ids else 1

users_data = [
    (start_id, 'Alice', 'Jones', '11110000', 'Building 3 UOW', '12345678910', '1', '1'),
    (start_id + 1, 'Bob', 'Dylan', '00001111', 'Building 19 UOW', '10987654321', '0', '2'),
    (start_id + 2, 'Charlie', 'Dean', '01010101', 'Building 24 UOW', '111213141516', '0', '3'),
]

# Insert the data into the CUSTOMER table
cursor.executemany("""
    INSERT INTO CUSTOMER (customer_ID, first_name, last_name, phone, address, pay_info, member, password) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?);
""", users_data)

# Commit changes and close the connection
conn.commit()
conn.close()

@app.route('/api/restaurants', methods=['GET'])
def get_restaurants():
    cursor.execute("SELECT name, description, image FROM restaurants")
    rows = cursor.fetchall()
    conn.close()
    
    restaurants = [{'name': row[0], 'description': row[1], 'image': row[2]} for row in rows]
    return jsonify(restaurants)

@app.route('/')
def serve_index():
    return send_from_directory('.', 'test.html')

@app.route('/<path:path>')
def serve_static(path):
    return send_from_directory('.', path)

if __name__ == '__main__':
    app.run(debug=True)
