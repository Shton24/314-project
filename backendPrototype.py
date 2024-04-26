from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

"""
import sqlite3

def init_db():
    conn = sqlite3.connect('deliveryservice.db')
    cursor = conn.cursor()
    with open('dbcreate.sql', 'r') as sql_file:
        sql_script = sql_file.read()
    cursor.executescript(sql_script)
    conn.commit()
    conn.close()

init_db()

"""

# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///deliveryservice.db'  
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Here is an example model
class Restaurant(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(300), nullable=False)
    image_path = db.Column(db.String(300), nullable=False)

@app.route('/')
def index():
    restaurants = Restaurant.query.all()
    return render_template('prototype.html', restaurants=restaurants)

@app.route('/search')
def search():
    query = request.args.get('query')
    restaurants = Restaurant.query.filter(Restaurant.name.like(f'%{query}%')).all()
    return render_template('prototype.html', restaurants=restaurants)

if __name__ == '__main__':
    db.create_all()  # Creates the database tables
    app.run(debug=True)

