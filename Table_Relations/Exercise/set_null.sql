CREATE TABLE customers(
    id serial PRIMARY KEY,
    customer_name varchar(50)

);

CREATE TABLE contacts(
    id serial PRIMARY KEY ,
    contact_name varchar(50),
    phone varchar(50),
    email varchar(50),
    customer_id int
        REFERENCES customers(id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

INSERT INTO customers (customer_name)
VALUES ('BlueBird Inc'),
       ('Dolphin LLC');

INSERT INTO contacts(contact_name, phone, email, customer_id)
VALUES
    ('John Doe','(408)-111-1234','john.doe@bluebird.dev',1),
    ('Jane Doe','(408)-111-1235','jane.doe@bluebird.dev',1),
    ('David Wright','(408)-222-1234','david.wright@dolphin.dev',2);

DELETE
FROM customers
WHERE id = 1;

SELECT *
FROM customers;