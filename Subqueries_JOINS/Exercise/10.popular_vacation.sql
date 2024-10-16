10.SELECT
    a.country,
    COUNT(b.booking_id) as booking_count

FROM
    bookings AS b
        JOIN
            apartments AS a
                USING(apartment_id)

WHERE '2021-05-18 07:52:09.904+03' < b.booked_at and b.booked_at < '2021-09-17 19:48:02.147+03'
GROUP BY a.country
ORDER BY booking_count DESC