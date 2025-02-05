SELECT fn_count_employees_by_town('Sofia') ;

CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name varchar)
LANGUAGE plpgsql
AS 
$$
    --DECLARE
    BEGIN
        UPDATE employees
        SET salary = salary *1.05
        WHERE employee_id IN (
        SELECT
            employee_id
        FROM employees e JOIN departments d USING (department_id)
        WHERE name = department_name);

        --RAISE NOTICE '%',
    END
    
$$;

CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name varchar)
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE employees e
    SET salary = salary * 1.05
    WHERE EXISTS (
        SELECT 1
        FROM departments d
        WHERE d.department_id = e.department_id
          AND d.name = department_name
    );

    RAISE NOTICE 'Salaries updated for department: %', department_name;
END
$$;