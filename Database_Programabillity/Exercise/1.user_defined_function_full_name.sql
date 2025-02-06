CREATE OR REPLACE FUNCTION fn_full_name(
    first_name varchar,
    last_name varchar)
RETURNS varchar AS
$$
    DECLARE full_name varchar;

    BEGIN

     RETURN concat_ws(' ', initcap(first_name), initcap(last_name));

    END
$$

LANGUAGE plpgsql;

select fn_full_name('fred', 'sanford');

select fn_full_name('', 'SIMPSONS');

select fn_full_name('JOHN', '');

select fn_full_name(NULL, NULL);