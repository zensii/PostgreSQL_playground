SELECT
    count(*)
FROM
    employees
where salary > (SELECT AVG(salary) FROM employees)
