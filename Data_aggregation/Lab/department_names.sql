SELECT 
	e.id,
	e.first_name,
	e.last_name,
	ROUND(e.salary, 2),
	e.department_id,
	CASE
		WHEN e.department_id = 1 THEN 'Management'
		WHEN e.department_id = 2 THEN 'Kitchen Staff'
		WHEN e.department_id = 3 THEN 'Service Staff'
	ELSE
		'Other'
	END AS name
FROM 
	employees AS e,
	departments AS d
WHERE e.department_id = d.id
ORDER BY e.id;