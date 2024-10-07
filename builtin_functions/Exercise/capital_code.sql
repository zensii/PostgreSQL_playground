ALTER TABLE countries
ADD capital_code VARCHAR(3);

UPDATE countries
SET capital_code = SUBSTRING(capital, 1, 2);
