SELECT 
	payroll_year,
	average_gross_wage,
	industry_branch_name,
	name,
	average_price 
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
GROUP BY payroll_year;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_4
SELECT 
	payroll_year,
	ROUND(((average_price - LAG(average_price,1) OVER(PARTITION BY name ORDER BY payroll_year)) / (LAG(average_price,1) OVER(PARTITION BY name ORDER BY payroll_year)) * 100), 2)
	- ROUND(((average_gross_wage - LAG(average_gross_wage,1) OVER(PARTITION BY name ORDER BY payroll_year)) / (LAG(average_gross_wage,1) OVER(PARTITION BY name ORDER BY payroll_year)) * 100), 2) AS price_wage_different
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE average_gross_wage IS NOT NULL 
GROUP BY payroll_year;

SELECT *
FROM t_jaroslav_snajdar_task_4 tjst
WHERE price_wage_different >= 10;