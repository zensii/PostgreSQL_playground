CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(searched_balance NUMERIC)
LANGUAGE plpgsql
AS
$$
    --DECLARE full_name varchar;
    --DECLARE total_balance numeric;
    DECLARE holder_account RECORD;  -- RECORD type is the whole row in a table containing all the data

    BEGIN
        FOR holder_account IN  -- full_name, total_balance
            SELECT
                concat(first_name, ' ', last_name) AS full_name,
                sum(balance) AS total_balance
            FROM accounts AS a JOIN account_holders AS ah ON a.account_holder_id = ah.id
            GROUP BY first_name, last_name
            HAVING SUM(balance) > 200000
            ORDER BY first_name, last_name
            LOOP
                --RAISE NOTICE 'NOTICE: % - %', full_name, total_balance;
                RAISE NOTICE 'NOTICE: % - %', holder_account.full_name, holder_account.total_balance;
            END LOOP;
    END
$$;