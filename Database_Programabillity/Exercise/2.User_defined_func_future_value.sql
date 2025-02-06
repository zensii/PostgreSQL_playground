CREATE OR REPLACE FUNCTION fn_calculate_future_value(
    initial_sum numeric,
    yearly_interest_rate decimal,
    number_of_years int
)
RETURNS numeric AS
$$
    DECLARE future_value decimal;

    BEGIN
    
    future_value := initial_sum * POWER((1 + yearly_interest_rate), number_of_years);
    RETURN trunc(future_value, 4);

    END
$$

LANGUAGE plpgsql;

SELECT fn_calculate_future_value (1000, 0.1, 5)