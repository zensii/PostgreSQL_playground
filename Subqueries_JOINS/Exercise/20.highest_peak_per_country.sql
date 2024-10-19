SELECT
    country_name,
    peak_name AS highest_peak_name,
    elevation AS highest_peak_elevation,
    mountain_range AS mountain

FROM (SELECT
          c.country_name,
          CASE
              WHEN p.peak_name IS NULL THEN '(no highest peak)'
              ELSE
                  p.peak_name
              END AS peak_name,
          CASE
              WHEN p.elevation IS NULL THEN 0
              ELSE
                  p.elevation
              END AS elevation,
          CASE
              WHEN m.mountain_range IS NULL THEN '(no mountain)'
              ELSE
                  m.mountain_range
              END AS mountain_range,
          row_number() OVER (PARTITION BY country_name ORDER BY elevation DESC) as rnk
      FROM countries AS c
               LEFT JOIN
           mountains_countries AS mc
           USING (country_code)
               LEFT JOIN
           peaks AS p
           ON mc.mountain_id = p.mountain_id
               LEFT JOIN
           mountains AS m
           ON p.mountain_id = m.id
      ) AS mcv
WHERE rnk = 1
ORDER BY country_name, elevation DESC


