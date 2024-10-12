CREATE TABLE passports(
    id int GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 1) PRIMARY KEY,
    nationality varchar(50)
);

INSERT INTO passports(nationality)
VALUES
    ('N34FG21B'),
    ('K65LO4R7'),
    ('ZE657QP2');

CREATE TABLE people(
    id serial PRIMARY KEY,
    first_name varchar(50),
    salary numeric(10, 2),
    passport_id int REFERENCES passports(id)
    --passport_id INT,
    --CONSTRAINT fk_people_passports
    --    FOREIGN KEY  (passport_id)
    --        REFERENCES passports(id)   Long syntax for naming the constraint
);

INSERT INTO people(first_name, salary, passport_id)
VALUES
    ('Roberto', 43300.0000, 101),
    ('Tom', 56100.0000, 102),
    ('Yana', 60200.0000, 100);