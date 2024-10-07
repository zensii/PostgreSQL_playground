ALTER TABLE bookings
ADD 
	billing_day TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

SELECT
	TO_CHAR(billing_day, 'DD "Day" MM "Month" YYY "Year" HH24:MI:SS') AS "Billing Day"
FROM bookings;