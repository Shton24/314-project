import sqlite3

# Connect to the database
conn = sqlite3.connect('test2.db')
cursor = conn.cursor()

# Create a list of dummy data for restaurants
restaurant = [
    ('Restaurant 1', 'Best food in town', 'path_to_restaurant_image1.jpg'),
    ('Restaurant 2', 'Delicious and affordable', 'path_to_restaurant_image2.jpg'),
    ('Restaurant 3', 'Exquisite dining experience', 'path_to_restaurant_image3.jpg'),
    ('Restaurant 4', 'Fast food at its finest', 'path_to_restaurant_image4.jpg'),
    ('Restaurant 5', 'Authentic Asian cuisine', 'path_to_restaurant_image5.jpg'),
    ('Restaurant 6', 'Healthy and fresh', 'path_to_restaurant_image6.jpg'),
    ('Restaurant 7', 'Gourmet delights', 'path_to_restaurant_image7.jpg'),
    ('Restaurant 8', 'Casual dining', 'path_to_restaurant_image8.jpg'),
    ('Restaurant 9', 'Family-friendly', 'path_to_restaurant_image9.jpg'),
    ('Restaurant 10', 'Traditional recipes', 'path_to_restaurant_image10.jpg')
]

# Insert the dummy data into the restaurants table
cursor.executemany("INSERT INTO RESTAURANT (name, description, image) VALUES (?, ?, ?)", restaurant)

# Commit the changes and close the connection
conn.commit()
conn.close()

# Verify the data has been inserted correctly
conn = sqlite3.connect('test2.db')
cursor = conn.cursor()
cursor.execute("SELECT * FROM RESTAURANT")
rows = cursor.fetchall()
conn.close()

import pandas as pd

# Display the inserted data
df = pd.DataFrame(rows, columns=['id', 'name', 'description', 'image'])
print(df)
