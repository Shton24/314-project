document.addEventListener('DOMContentLoaded', function() {
    const restaurantInfoDiv = document.getElementById('restaurant-info');

    // Example data, replace with real data from your backend
    const restaurants = [
        {
            name: 'Restaurant 1',
            description: 'Best food in town',
            image: 'path_to_restaurant_image.jpg'
        },
        {
            name: 'Restaurant 2',
            description: 'Delicious and affordable',
            image: 'path_to_restaurant_image.jpg'
        },
        // Add more restaurants
    ];

    restaurants.forEach(restaurant => {
        const restaurantDiv = document.createElement('div');
        restaurantDiv.className = 'restaurant';
        restaurantDiv.innerHTML = `
            <img src="${restaurant.image}" alt="Restaurant Image">
            <p>${restaurant.name}</p>
            <p>${restaurant.description}</p>
        `;
        restaurantInfoDiv.appendChild(restaurantDiv);
    });
});
