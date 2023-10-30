SELECT *,
	name 
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf 
GROUP BY name;

SELECT 
	payroll_year, 
	name, 
	average_price,
	round(avg(average_gross_wage), 2) AS wage_avg
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY payroll_year, name
ORDER BY payroll_year ASC 
LIMIT 2;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_2_first
SELECT 
	payroll_year, 
	name, 
	average_price, 
	round(avg(average_gross_wage), 2) AS wage_avg
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY payroll_year, name
ORDER BY payroll_year ASC  
LIMIT 2;

SELECT 
	payroll_year,
	wage_avg, 
	SUM(average_price),
	ROUND( wage_avg / SUM(average_price), 2) AS buy_times 
FROM t_jaroslav_snajdar_task_2_first;

SELECT 
	payroll_year, 
	name, 
	average_price,
	round(avg(average_gross_wage), 2) AS wage_avg
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY payroll_year, name
ORDER BY payroll_year DESC
LIMIT 2;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_2_last
SELECT 
	payroll_year, 
	name, 
	average_price, 
	round(avg(average_gross_wage), 2) AS wage_avg
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY payroll_year, name
ORDER BY payroll_year DESC 
LIMIT 2;

