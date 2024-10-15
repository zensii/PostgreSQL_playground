SELECT
    bookings.booking_id,
    customers.first_name AS customer_name
FROM bookings
    CROSS JOIN customers
ORDER BY customer_name