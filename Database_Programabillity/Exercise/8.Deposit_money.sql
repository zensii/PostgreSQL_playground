CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id int, money_amount numeric(20,4))
LANGUAGE plpgsql
AS
$$
    --DECLARE
    BEGIN
        UPDATE accounts SET
            balance = balance + money_amount
        WHERE account_id = id;

        COMMIT ;
    END

$$;


CALL sp_deposit_money(14, 1000);
SELECT *
FROM accounts
WHERE id = 14;