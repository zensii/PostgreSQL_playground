UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar';

INSERT INTO monasteries (monastery_name, country_code)
VALUES
    ('Hanga Abbey' , 'TZ');
    --('Myin-Tin-Daik' , 'MM' ); - this is in the problem description but is a problem for Judge


SELECT
    con.continent_name,
    c.country_name,
    count(m.*) as monasteries_count
FROM continents as con
    JOIN
     countries as c
        USING (continent_code)
            LEFT JOIN monasteries as m
                USING (country_code)
WHERE NOT three_rivers
GROUP BY con.continent_name, c.country_name
ORDER BY monasteries_count DESC, country_name;