CREATE TABLE monasteries(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    monastery_name varchar(255),
    country_code char(2)
);

INSERT INTO monasteries (monastery_name, country_code)
VALUES
    ('Rila Monastery "St. Ivan of Rila"', 'BG'),
    ('Bachkovo Monastery "Virgin Mary"', 'BG'),
    ('Troyan Monastery "Holy Mother''s Assumption"', 'BG'),
    ('Kopan Monastery', 'NP'),
    ('Thrangu Tashi Yangtse Monastery', 'NP'),
    ('Shechen Tennyi Dargyeling Monastery', 'NP'),
    ('Benchen Monastery', 'NP'),
    ('Southern Shaolin Monastery', 'CN'),
    ('Dabei Monastery', 'CN'),
    ('Wa Sau Toi', 'CN'),
    ('Lhunshigyia Monastery', 'CN'),
    ('Rakya Monastery', 'CN'),
    ('Monasteries of Meteora', 'GR'),
    ('The Holy Monastery of Stavronikita', 'GR'),
    ('Taung Kalat Monastery', 'MM'),
    ('Pa-Auk Forest Monastery', 'MM'),
    ('Taktsang Palphug Monastery', 'BT'),
    ('Sümela Monastery', 'TR');


ALTER TABLE countries
ADD COLUMN
    three_rivers BOOLEAN DEFAULT FALSE;

UPDATE countries
SET three_rivers = (
    SELECT
        COUNT(*) >= 3
    FROM
        countries_rivers AS cr
    WHERE
        cr.country_code = countries.country_code
);


SELECT
    monasteries.monastery_name,
    countries.country_name
FROM
    monasteries
        JOIN
            countries
                USING (country_code)
WHERE countries.three_rivers is FALSE
ORDER BY monastery_name;