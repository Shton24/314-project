-- Users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(15)
);

-- Owners table
CREATE TABLE owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Restaurants table
CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(255)
);

-- Menus table
CREATE TABLE menus (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Order items table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    menu_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES menus(menu_id)
);

-- Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    expiry_date VARCHAR(5) NOT NULL,
    cvv VARCHAR(3) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
