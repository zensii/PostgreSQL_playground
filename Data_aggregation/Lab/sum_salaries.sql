SELECT 
	department_id,
	SUM(salary) AS total_salsaries
FROM employees
GROUP BY department_id
ORDER BY department_id
