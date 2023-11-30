WITH a AS (
SELECT 
	payroll_year,
	AVG (average_gross_wage) AS wage,
	name,
	price AS milk
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY payroll_year, name
HAVING payroll_year = 2006 OR payroll_year = 2018
ORDER BY payroll_year, name
),
b AS (
SELECT 
	*,
	LAG(milk,2) OVER (ORDER BY name, payroll_year) AS bread
FROM a  
)
SELECT 
	payroll_year,
	wage,
	ROUND(milk + bread, 2) AS mil_bread,
	ROUND(wage / (milk + bread), 0) AS buy_times
FROM b
WHERE bread IS NOT NULL;