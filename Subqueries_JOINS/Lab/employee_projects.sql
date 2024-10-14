SELECT
    e.employee_id,
    concat(e.first_name, ' ', e.last_name) as full_name,
    p.project_id,
    p.name as project_name
FROM
    employees as e
JOIN
    employees_projects as ep
        USING (employee_id)
        JOIN projects as p
            USING (project_id)
WHERE p.project_id = 1;