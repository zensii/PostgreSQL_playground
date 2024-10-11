SELECT
    c.id,
    v.vehicle_type,
    concat(c.first_name,' ', c.last_name)
from campers as c
    JOIN vehicles as v on c.id = v.driver_id