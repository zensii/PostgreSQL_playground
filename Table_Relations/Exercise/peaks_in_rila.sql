SELECT
    mountain_range,
    peak_name,
    elevation
FROM peaks as p
    JOIN mountains as m on p.mountain_id = m.id
         WHERE mountain_range = 'Rila'
order BY p.elevation DESC 