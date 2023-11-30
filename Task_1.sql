WITH a AS (
SELECT 
	payroll_year,
	industry_branch_name, 
	ROUND(AVG (average_gross_wage), 0) AS WAGE_2021
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE 
	(payroll_year = '2000' OR payroll_year = '2021') AND industry_branch_name IS NOT NULL 
GROUP BY industry_branch_name, payroll_year 
ORDER BY industry_branch_name, payroll_year
),
b AS (
SELECT 
	*,
	LAG(wage_2021) OVER (ORDER BY industry_branch_name, payroll_year) AS wage_2000
FROM a
)
SELECT 
	industry_branch_name,
	wage_2000,
	wage_2021,
	wage_2021 - wage_2000 AS grow 
FROM b
WHERE payroll_year = '2021';