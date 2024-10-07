SELECT
	user_id,
	age(starts_at, booked_at) AS early_birds
FROM 
	bookings
WHERE age(starts_at, booked_at) >= '10 MONTHS';
