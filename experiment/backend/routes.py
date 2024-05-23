from flask import request, jsonify
from app import app, db
from models import Restaurant, MenuItem, Order

@app.route('/restaurants', methods=['GET'])
def get_restaurants():
    restaurants = Restaurant.query.all()
    return jsonify([r.serialize() for r in restaurants])

@app.route('/restaurants/<int:id>', methods=['GET'])
def get_restaurant(id):
    restaurant = Restaurant.query.get(id)
    return jsonify(restaurant.serialize())

@app.route('/orders', methods=['POST'])
def create_order():
    data = request.get_json()
    new_order = Order(
        customer_name=data['customer_name'],
        address=data['address'],
        total_price=data['total_price'],
        items=data['items']
    )
    db.session.add(new_order)
    db.session.commit()
    return jsonify(new_order.serialize()), 201

@app.route('/orders/<int:id>', methods=['PUT'])
def update_order(id):
    order = Order.query.get(id)
    data = request.get_json()
    order.status = data['status']
    db.session.commit()
    return jsonify(order.serialize())
