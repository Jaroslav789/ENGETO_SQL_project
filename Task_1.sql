CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_1_1
SELECT *
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE average_gross_wage IS NOT NULL;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_1
SELECT 
	payroll_year,
	industry_branch_name,
	average_gross_wage
FROM t_jaroslav_snajdar_task_1_1
WHERE payroll_year = '2000' OR payroll_year = '2021'
GROUP BY industry_branch_name, payroll_year;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_1_2
SELECT 
	average_gross_wage,
	industry_branch_name,
	payroll_year,
	LAG(average_gross_wage) OVER(ORDER BY industry_branch_name) AS previous_AVG_wage
FROM t_jaroslav_snajdar_task_1 tjst
WHERE industry_branch_name IS NOT NULL
GROUP BY industry_branch_name, payroll_year;

SELECT 
	industry_branch_name,
	average_gross_wage - previous_AVG_wage AS different,
	CASE
		WHEN average_gross_wage - previous_AVG_wage > 0 THEN  'Roste'
		ELSE 'Klesá'
	END AS 'Result'
FROM t_jaroslav_snajdar_task_1_2 tjst
WHERE payroll_year = 2021;