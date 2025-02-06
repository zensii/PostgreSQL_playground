CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    set_of_letters varchar(50),
    word varchar(50)
)
RETURNS bool AS
$$
    DECLARE i int := 1;
    DECLARE current_char char(1);

    BEGIN

        WHILE i <= length(word) LOOP
                current_char := substring(word FROM i FOR 1);
                IF POSITION(lower(current_char) IN lower(set_of_letters)) = 0 THEN
                    RETURN FALSE;
                ELSE
                    set_of_letters := regexp_replace(set_of_letters, current_char, '', 1);
                END IF;
        i := i + 1;

        END LOOP;

        RETURN TRUE;

    END
$$

LANGUAGE plpgsql;