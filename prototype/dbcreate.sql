-- Table for storing customer information
CREATE TABLE CUSTOMER
{
    customer_ID  int PRIMARY KEY,            -- Unique identifier for each customer
    first_name   varchar(30),                -- Customer's first name
    last_name    varchar(30),                -- Customer's last name
    phone#       varchar(10),                -- Customer's phone number, formatted as a 10-digit string
    address      varchar(50),                -- Customer's mailing address
    pay_info     varchar(30),                -- Payment details (could include card number, PayPal email, etc.)
    member       bool,                       -- Flag indicating whether the customer is a member (true/false)
    password     varchar(50)                 -- Customer's password for login (stored as a hash in production)
};

-- Table for storing restaurant information
CREATE TABLE RESTAURANT
{
    restaurant_ID    int PRIMARY KEY,        -- Unique identifier for each restaurant
    name             varchar(50),            -- Name of the restaurant
    address          varchar(50),            -- Physical address of the restaurant
    description      varchar(200),           -- Description of the restaurant's theme, cuisine, etc.
    rating           float(10),              -- Average customer rating, from 1.0 to 5.0

    CONSTRAINT rating_constraint CHECK(rating > 0 AND rating <= 5)  -- Ensure ratings are within valid range
};

-- Table for storing products (menu items) offered by restaurants
CREATE TABLE PRODUCT
{
    product_ID     int,                      -- Unique identifier for each product
    restaurant_ID  int REFERENCES RESTAURANT(restaurant_ID), -- Link to restaurant
    name           varchar(30),              -- Name of the product
    cost           float(10),                -- Cost of the product
    discount       float(10),                -- Discount amount on the product
    discount_date  date,                     -- Date when the discount is applicable

    PRIMARY KEY(product_ID)
};

-- Enum type for order status to enforce consistency in status entries
CREATE TYPE ORDER_STATUS AS ENUM (
    'IN_CART', 'FINALISATION', 'AWAITING_PAYMENT', 'PAID', 'PENDING', 'REJECTED',
    'AWAITING_REFUND', 'REFUNDED', 'ACCEPTED', 'PROCESSING', 'AWAITING_DELIVERY',
    'DELIVERY_IN_PROGRESS', 'DELIVERED', 'NO_FEEDBACK', 'FEEDBACK', 'END', 'ERROR'
);

-- Table for storing orders placed by customers
CREATE TABLE CUSTOMER_ORDER
{
    order_ID        int PRIMARY KEY,                     -- Unique identifier for each order
    customer_ID     REFERENCES CUSTOMER(customer_ID), -- Link to customer who placed the order
    order_date      date,                    -- Date when the order was placed
    status          ORDER_STATUS,            -- Current status of the order
    customer_review float(10)                -- Customer's rating for the order (1.0 to 10.0 scale)
};

-- Table for storing individual purchase details within an order
CREATE TABLE PURCHASE
{
    purchase_ID     int PRIMARY KEY,                     -- Unique identifier for each purchase within an order
    order_ID        REFERENCES CUSTOMER_ORDER(order_ID), -- Link to the associated order
    product_ID      REFERENCES PRODUCT(product_ID),      -- Link to the purchased product
    quantity        int,                     -- Quantity of the product purchased

    PRIMARY KEY(purchase_ID)
};
