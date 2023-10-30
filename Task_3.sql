CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_3  
SELECT 
	payroll_year,
	name,
	average_price 
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE name IS NOT NULL 
GROUP BY payroll_year, name
ORDER BY name, payroll_year; 

CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_3_2  
SELECT 
	*, 
	LAG(average_price,1) OVER(PARTITION BY name ORDER BY payroll_year) AS previous,
	average_price - LAG(average_price,1) OVER(PARTITION BY name ORDER BY payroll_year) AS different,
	ROUND(((average_price - LAG(average_price,1) OVER(PARTITION BY name ORDER BY payroll_year)) / (LAG(average_price,1) OVER(PARTITION BY name ORDER BY payroll_year)) * 100), 2) AS different_percen
FROM t_jaroslav_snajdar_task_3 tjst
WHERE payroll_year IN ('2006', '2018')
ORDER BY name, payroll_year;

SELECT 
	name, 
	different_percen 
FROM t_jaroslav_snajdar_task_3_2 tjst
WHERE different_percen IS NOT NULL
ORDER BY different_percen ASC;