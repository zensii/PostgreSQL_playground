CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id int, money_amount numeric(20,4))
    LANGUAGE plpgsql
AS
$$

BEGIN
    IF (SELECT accounts.balance FROM accounts WHERE id = account_id) < money_amount THEN
        RAISE NOTICE 'NOTICE: Insufficient balance to withdraw %', money_amount;
        RETURN ;
    END IF;

    UPDATE accounts SET
        balance = balance - money_amount
    WHERE account_id = id;

    COMMIT;
END

$$;

CALL sp_withdraw_money(2, 4000.0000);
SELECT * FROM accounts WHERE id = 2;