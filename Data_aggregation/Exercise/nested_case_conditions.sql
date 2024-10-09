-- CCREATE OR REPLACE VIEW view_performance_rating
-- AS
-- SELECT
--     employees.first_name,
--     employees.last_name,
--     employees.job_title,
--     employees.salary,
--     employees.department_id,
--     CASE
--         WHEN salary >= 25000 AND job_title LIKE 'Senior%' THEN 'High-performing Senior'
--         WHEN salary >= 25000 AND job_title NOT LIKE 'Senior%' THEN 'High-performing Employee'
--         ELSE 'Average-performing'
--     END AS performance_rating
-- FROM employees

CREATE OR REPLACE VIEW view_performance_rating
AS
SELECT
    employees.first_name,
    employees.last_name,
    employees.job_title,
    employees.salary,
    employees.department_id,
    CASE
        WHEN salary >= 25000 THEN
            CASE
                WHEN job_title LIKE 'Senior%' THEN 'High-performing Senior'
            ELSE
            'High-performing Employee'
            END
        ELSE 'Average-performing'
    END AS performance_rating
FROM employees