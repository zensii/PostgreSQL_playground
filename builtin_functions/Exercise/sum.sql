select 
	 SUM(booked_for) as total_value
from bookings
WHERE apartment_id = 90;