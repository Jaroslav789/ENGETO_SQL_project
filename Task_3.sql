CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_3  
SELECT 
	payroll_year,
	name,
	average_price 
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IS NOT NULL 
GROUP BY payroll_year, name
ORDER BY name, payroll_year; 