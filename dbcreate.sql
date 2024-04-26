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

CREATE TABLE 