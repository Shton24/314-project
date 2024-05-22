-- Table for storing customer information
CREATE TABLE CUSTOMER (
    customer_ID  int PRIMARY KEY,            -- Unique identifier for each customer
    first_name   varchar(30),                -- Customer's first name
    last_name    varchar(30),                -- Customer's last name
    phone        varchar(10),                -- Customer's phone number, formatted as a 10-digit string
    address      varchar(50),                -- Customer's mailing address
    pay_info     varchar(30),                -- Payment details (could include card number, PayPal email, etc.)
    member       boolean,                    -- Flag indicating whether the customer is a member (true/false)
    password     varchar(50)                 -- Customer's password for login (stored as a hash in production)
);

-- Table for storing restaurant information
CREATE TABLE RESTAURANT (
    restaurant_ID    int PRIMARY KEY,        -- Unique identifier for each restaurant
    name             varchar(50),            -- Name of the restaurant
    address          varchar(50),            -- Physical address of the restaurant
    description      varchar(200),           -- Description of the restaurant's theme, cuisine, etc.
    rating           float,                  -- Average customer rating, from 1.0 to 5.0
    CONSTRAINT rating_constraint CHECK(rating > 0 AND rating <= 5)  -- Ensure ratings are within valid range
);

-- Table for storing products (menu items) offered by restaurants
CREATE TABLE PRODUCT (
    product_ID     int PRIMARY KEY,                      -- Unique identifier for each product
    restaurant_ID  int REFERENCES RESTAURANT(restaurant_ID), -- Link to restaurant
    name           varchar(30),              -- Name of the product
    cost           float,                    -- Cost of the product
    discount       float,                    -- Discount amount on the product
    discount_date  date                      -- Date when the discount is applicable
);

-- Table for storing orders placed by customers
CREATE TABLE CUSTOMER_ORDER (
    order_ID        int PRIMARY KEY,                     -- Unique identifier for each order
    customer_ID     int REFERENCES CUSTOMER(customer_ID), -- Link to customer who placed the order
    order_date      date,                    -- Date when the order was placed
    status          varchar(20),             -- Current status of the order
    customer_review float                    -- Customer's rating for the order (1.0 to 10.0 scale)
);

-- Table for storing individual purchase details within an order
CREATE TABLE PURCHASE (
    purchase_ID     int PRIMARY KEY,                     -- Unique identifier for each purchase within an order
    order_ID        int REFERENCES CUSTOMER_ORDER(order_ID), -- Link to the associated order
    product_ID      int REFERENCES PRODUCT(product_ID),      -- Link to the purchased product
    quantity        int                      -- Quantity of the product purchased
);
