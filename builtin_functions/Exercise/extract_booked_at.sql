SELECT
	EXTRACT(YEAR from booked_at) AS "YEAR",
	EXTRACT(MONTH from booked_at) AS "MONTH",
	EXTRACT(DAY from booked_at) AS "DAY",
	EXTRACT(HOUR from booked_at AT TIME ZONE 'UTC') AS "HOUR",
	EXTRACT(MINUTE from booked_at) AS "MINUTE",
	CEILING(EXTRACT(SECOND from booked_at)) AS "SECOND"
FROM
	bookings;