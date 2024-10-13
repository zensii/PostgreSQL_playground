CREATE TABLE item_types(
    id serial PRIMARY KEY,
    item_type_name varchar(50)
);

CREATE TABLE items(
    id serial PRIMARY KEY ,
    item_name varchar(50),
    item_type_id int,

        CONSTRAINT fk_items_item_types
            FOREIGN KEY (item_type_id) REFERENCES item_types(id)
);

CREATE TABLE cities(
    id serial PRIMARY KEY ,
    city_name varchar(50)
);


CREATE TABLE customers(
    id serial PRIMARY KEY ,
    customer_name varchar(50),
    birthday date,
    city_id int,

    CONSTRAINT fk_city_id_cities
        FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE orders(
    id serial PRIMARY KEY ,
    customer_id int,

    CONSTRAINT fk_customer_id_customers
        FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items(
    order_id int,
    item_id int,

    CONSTRAINT pk_order_id_item_id
        PRIMARY KEY (order_id, item_id),

    CONSTRAINT  fk_order_id_items
        FOREIGN KEY (order_id) REFERENCES orders(id),

    CONSTRAINT fk_item_id_items
        FOREIGN KEY (item_id) REFERENCES items(id)
);