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


-- alternative approach

SELECT
    country_name,
    coalesce(peak_name, '(no highest peak)') as highest_peak_name,
    coalesce(elevation, 0) as highest_peak_elevation,
    coalesce(mountain_range, '(no mountain)') as mountain
FROM (
    SELECT
        country_name,
        peak_name,
        elevation,
        mountain_range,
        dense_rank() OVER (PARTITION BY country_name ORDER BY elevation DESC ) as peak_rank
    FROM countries AS c
             LEFT JOIN mountains_countries AS mc USING (country_code)
             LEFT JOIN peaks AS p ON mc.mountain_id = p.mountain_id
             LEFT JOIN mountains AS m ON p.mountain_id = m.id) AS mp
WHERE peak_rank = 1
ORDER BY country_name ;
