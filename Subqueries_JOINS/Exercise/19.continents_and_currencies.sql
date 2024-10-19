CREATE OR REPLACE VIEW continent_currency_usage
AS
SELECT
    top.continent_code,
    top.currency_code,
    top.currency_usage
FROM(
    SELECT
        cu.continent_code,
        cu.currency_code,
        cu.currency_usage,
        dense_rank() OVER(PARTITION BY continent_code ORDER BY cu.currency_usage DESC) AS ranked_by_usage
    FROM (
        SELECT
            continent_code,
            currency_code,
            COUNT(currency_code) as currency_usage
        FROM
            countries
        GROUP BY
            continent_code,

            currency_code
        HAVING
            COUNT(*) > 1
        ORDER BY
            currency_usage DESC
    ) AS cu
) AS top
WHERE top.ranked_by_usage = 1
ORDER BY currency_usage DESC, continent_code, currency_code