CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_1
SELECT 
	payroll_year,
	industry_branch_name,
	average_gross_wage
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE payroll_year = '2000' OR payroll_year = '2021'
GROUP BY industry_branch_name, payroll_year;