SELECT 
	peak_name,
	LEFT(peak_name, 4) as positive_left,
	LEFT(peak_name, -4) as negative_left
FROM
	peaks;