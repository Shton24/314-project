CREATE TABLE CUSTOMER
{
    customer_ID  int PRIMARY KEY,
    first_name  varchar(30),
    last_name   varchar(30),
    phone#      varchar(10),
    address     varchar(50),
    pay_info    varchar(30),
    member      bool,
    password    varchar(50)
};

CREATE TABLE RESTAURANT
{
    restaurant_ID   int PRIMARY KEY,
    name        varchar(50),
    address     varchar(50),
    description varchar(200),
    rating      float(10),

    CONSTRAINT rating_constraint CHECK(rating > 0 AND rating <= 5)
};

CREATE TABLE PRODUCT
{
    product_ID      int,
    restaurant_ID   int REFERENCES RESTAURANT(restaurant_ID),
    name            varchar(30),
    cost            float(10),
    discount        float(10),
    discount_date   date,

    PRIMARY KEY(product_ID)
};

CREATE TYPE ORDER_STATUS AS ENUM ('IN_CART', 'FINALISATION', 'AWAITING_PAYMENT', 'PAID','PENDING','REJECTED','
                            AWAITING_REFUND','REFUNDED','ACCEPTED','PROCESSING','AWAITING_DELIVERY',
                            'DELIVERY_IN_PROGRESS','DELIVERED','NO_FEEDBACK','FEEDBACK','END','ERROR');

CREATE TABLE CUSTOMER_ORDER
{
    order_ID        int,
    customer_ID     REFERENCES CUSTOMER(customer_ID),
    order_date      date,
    status          ORDER_STATUS,
    customer_review float(10)
};

CREATE TABLE PURCHASE
{
    purchase_ID     int,
    order_ID        REFERENCES CUSTOMER_ORDER(order_ID),
    product_ID      REFERENCES PRODUCT(product_ID),
    quantity        int,

    PRIMARY KEY(purchase_ID)
};