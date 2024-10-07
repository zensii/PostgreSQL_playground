CREATE OR REPLACE VIEW view_continents_countries_currencies_details AS
SELECT
	CONCAT(c.continent_name,': ', c.continent_code) AS continent_details,
	CONCAT_WS(' - ', co.country_name, co.capital, co.area_in_sq_km, 'km2') AS country_information,
	CONCAT(cur.description, ' (', cur.currency_code,')') AS currencies
FROM
	continents AS c, countries AS co, currencies AS cur
WHERE c.continent_code = co.continent_code AND cur.currency_code = co.currency_code
ORDER BY
	country_information, currencies;