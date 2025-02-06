CREATE TABLE notification_emails(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    recipient_id int,
    subject varchar(50),
    body text
);


CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER AS

$$
    DECLARE subject varchar ;
    DECLARE body varchar;

    BEGIN

        subject := 'Balance change for account: ' || NEW.account_id;
        body := 'On ' || '2023-08-19' || ' ' || 'your balance was changed from ' || new.old_sum|| ' to ' || new.new_sum;

        INSERT INTO notification_emails (recipient_id, subject, body)
    VALUES (new.account_id ,subject ,body);

    RETURN NEW ;

    END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_send_email_on_balance_change

    AFTER UPDATE ON logs
    FOR EACH ROW
    EXECUTE FUNCTION trigger_fn_send_email_on_balance_change();

UPDATE logs
SET new_sum = new_sum + 100
WHERE account_id = 1;

SELECT *
FROM notification_emails;