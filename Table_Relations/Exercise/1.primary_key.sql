CREATE TABLE products(
    product_name varchar(100)
);

INSERT INTO products(product_name)
VALUES
    ('Broccoli'),
    ('Shampoo'),
    ('Toothpaste'),
    ('Candy');


ALTER TABLE products
ADD COLUMN
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ;

SELECT * FROM products
