const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

// Helper function to read JSON files
const readJSONFile = (filename) => {
    return JSON.parse(fs.readFileSync(path.join(__dirname, filename), 'utf-8'));
};

// Helper function to write to JSON files
const writeJSONFile = (filename, data) => {
    fs.writeFileSync(path.join(__dirname, filename), JSON.stringify(data, null, 2), 'utf-8');
};

// Endpoints
app.get('/restaurants', (req, res) => {
    const restaurants = readJSONFile('restaurants.json');
    res.json(restaurants);
});

app.post('/orders', (req, res) => {
    const orders = readJSONFile('orders.json');
    const newOrder = req.body;
    orders.push(newOrder);
    writeJSONFile('orders.json', orders);
    res.status(201).json(newOrder);
});

app.get('/orders', (req, res) => {
    const orders = readJSONFile('orders.json');
    res.json(orders);
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
