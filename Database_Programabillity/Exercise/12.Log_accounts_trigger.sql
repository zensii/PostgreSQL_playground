CREATE TABLE logs(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    account_id int,
    old_sum numeric,
    new_sum numeric
);

CREATE OR REPLACE FUNCTION trigger_fn_insert_new_entry_into_logs()
RETURNS TRIGGER AS
$$
    BEGIN
        IF old.balance <> new.balance THEN
            INSERT INTO logs (account_id, old_sum, new_sum)
            VALUES
            (old.id, old.balance, new.balance);

        END IF;

        RETURN new ;
    END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_account_balance_change

    AFTER UPDATE on accounts
    FOR EACH ROW EXECUTE PROCEDURE trigger_fn_insert_new_entry_into_logs();


UPDATE accounts SET balance = 150.00 WHERE "id" = 1;
SELECT * FROM logs;