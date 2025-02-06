CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name varchar(50))
RETURNS TABLE (total_cash numeric) AS
$$
    BEGIN
    RETURN QUERY
        SELECT
            ROUND(sum(cash), 2)
            FROM (
            SELECT
                ug.cash,
                row_number() OVER (ORDER BY cash DESC ) as row_rank
            FROM
                games g JOIN users_games ug ON g.id = ug.game_id
            WHERE
                name = game_name) AS ranked
        WHERE
            row_rank % 2 <> 0 ;
    END
$$
LANGUAGE plpgsql;


SELECT fn_cash_in_users_games('Love in a mist');