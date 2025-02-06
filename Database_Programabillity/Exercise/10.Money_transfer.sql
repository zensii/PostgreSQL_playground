CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id int, receiver_id int, amount numeric)
LANGUAGE plpgsql
AS
$$
    DECLARE current_amount numeric;
    BEGIN
        SELECT balance INTO current_amount FROM accounts WHERE id = sender_id;
        IF current_amount >= amount THEN
            CALL sp_withdraw_money(sender_id, amount);

            CALL sp_deposit_money(receiver_id, amount);

            COMMIT ;
        ELSE
            RAISE NOTICE 'Transfer Aborted';
            ROLLBACK ;
        END IF;

    END

$$;

CALL sp_transfer_money(5, 1, 5000.0000);
SELECT *
FROM accounts
WHERE id IN (1,5);
