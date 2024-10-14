SELECT
    a.town_id,
    t.name as town_name,
    a.address_text
FROM addresses AS a
JOIN towns AS t
USING (town_id)
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY town_id, address_id