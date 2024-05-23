document.addEventListener('DOMContentLoaded', function() {
    const restaurantInfoDiv = document.getElementById('restaurant-info');

    // Fetch data from the backend API
    fetch('/api/restaurants')
        .then(response => response.json())
        .then(restaurants => {
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
        })
        .catch(error => console.error('Error fetching restaurant data:', error));
});

