SELECT *,
	name 
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf 
GROUP BY name;

SELECT 
	payroll_year, 
	name, 
	average_price,
	round(avg(average_price), 2) AS price_avg,
	round(avg(average_gross_wage), 2) AS wage_avg
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY payroll_year, name
ORDER BY payroll_year ASC 
LIMIT 2;

