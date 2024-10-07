select 
	continent_name,
	TRIM(LEADING FROM continent_name) AS "trim"
from continents;