SELECT
    count(*) as countries_without_rivers
FROM countries c
LEFT JOIN countries_rivers cr ON c.country_code = cr.country_code
WHERE cr.country_code IS NULL ;
