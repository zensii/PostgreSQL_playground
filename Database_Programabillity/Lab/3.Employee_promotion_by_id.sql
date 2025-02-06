CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(
    id int
)
LANGUAGE plpgsql
AS
$$
    DECLARE employee_exists bool;
    BEGIN
        SELECT
            exists(
                SELECT 1
                FROM employees
                WHERE employee_id = id
            ) INTO employee_exists;

        IF employee_exists THEN
            UPDATE employees
            SET salary = salary * 1.05
            WHERE employee_id = id;
            RAISE NOTICE 'Employee % was promoted with 5%%', id;
            COMMIT ;
        ELSE
            RAISE NOTICE 'No such employee exists %', id;
            RETURN ;
        END IF;
        RETURN ;
    END
$$;


CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id int)
AS
$$
BEGIN
    IF (SELECT employee_id FROM employees WHERE employee_id = id) is NULL THEN
        RETURN ;
    END IF ;
    UPDATE employees
    SET salary = salary * 1.05
    WHERE employee_id = id;
    COMMIT ;
END;
$$
    LANGUAGE plpgsql;