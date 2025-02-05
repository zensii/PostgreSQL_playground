CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT AS
$$
    DECLARE
        count int;
    BEGIN
    SELECT COUNT(*) into count
        FROM public.employees e
             JOIN addresses USING (address_id)
             JOIN public.towns t USING (town_id)
    WHERE t.name = town_name
    GROUP BY town_id;

    RETURN count;
    END
$$
LANGUAGE plpgsql;