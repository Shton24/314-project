// JavaScript for form validation
document.getElementById('orderForm').addEventListener('submit', function(event) {
    let valid = true;
    
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const address = document.getElementById('address').value;
    
    if (name === '') {
        valid = false;
        document.getElementById('nameError').textContent = 'Name is required.';
    } else {
        document.getElementById('nameError').textContent = '';
    }
    
    if (email === '') {
        valid = false;
        document.getElementById('emailError').textContent = 'Email is required.';
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        valid = false;
        document.getElementById('emailError').textContent = 'Invalid email format.';
    } else {
        document.getElementById('emailError').textContent = '';
    }
    
    if (address === '') {
        valid = false;
        document.getElementById('addressError').textContent = 'Address is required.';
    } else {
        document.getElementById('addressError').textContent = '';
    }
    
    if (!valid) {
        event.preventDefault();
    }
});

// JavaScript for search and filter
document.getElementById('searchBox').addEventListener('input', filterRestaurants);
document.getElementById('categoryFilter').addEventListener('change', filterRestaurants);

function filterRestaurants() {
    const searchValue = document.getElementById('searchBox').value.toLowerCase();
    const categoryValue = document.getElementById('categoryFilter').value;
    const restaurants = document.querySelectorAll('#restaurantList li');
    
    restaurants.forEach(restaurant => {
        const text = restaurant.textContent.toLowerCase();
        const category = restaurant.getAttribute('data-category');
        
        if ((text.includes(searchValue) || searchValue === '') &&
            (category === categoryValue || categoryValue === '')) {
            restaurant.style.display = '';
        } else {
            restaurant.style.display = 'none';
        }
    });
}

// JavaScript for interactive elements
document.getElementById('toggleMenu').addEventListener('click', function() {
    const menu = document.getElementById('menu');
    if (menu.style.display === 'none') {
        menu.style.display = 'block';
    } else {
        menu.style.display = 'none';
    }
});
