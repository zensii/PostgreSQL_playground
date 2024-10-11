SELECT
    r.start_point,
    r.end_point,
    r.leader_id,
    CONCAT(c.first_name, ' ', c.last_name)
from campers as c
    JOIN routes as r on r.leader_id = c.id