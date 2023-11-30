WITH a AS (
SELECT 
	payroll_year,
	ROUND(AVG(average_gross_wage), 2) AS wage,
	ROUND(AVG(price), 2) AS price
FROM t_jaroslav_snajdar_project_SQL_primary_final tjspspf
WHERE payroll_year BETWEEN 2006 AND 2018
GROUP BY payroll_year
),
b AS (
SELECT 
	*,
	LAG(wage,1) OVER(ORDER BY payroll_year) AS p_wage,
	LAG(price,1) OVER(ORDER BY payroll_year) AS p_price
FROM a
),	
c AS (
SELECT 
	*,	
	ROUND(((wage - p_wage) / p_wage), 4) * 100 AS wage_p, 
	ROUND(((price - p_price) / p_price), 4) * 100 AS price_p
FROM b
)
SELECT
	payroll_year,
	wage,
	price,
	wage_p,
	price_p,
	wage_p - price_p AS different_p
FROM c;