CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_5
SELECT 
	tjspssf.country,
	tjspssf.`year`,
	tjspssf.GDP,
	tjspspf.average_gross_wage,
	tjspspf.average_price, 
	LAG(tjspssf.GDP,1) OVER(ORDER BY tjspssf.`year`) AS previous_GDP,
	LAG(tjspspf.average_gross_wage,1) OVER(ORDER BY tjspssf.`year`) AS previous_WAGE,
	LAG(tjspspf.average_price,1) OVER(ORDER BY tjspssf.`year`) AS previous_PRICE,
	ROUND(((tjspssf.GDP - LAG(tjspssf.GDP,1) OVER(ORDER BY tjspssf.`year`)) / (LAG(tjspssf.GDP,1) OVER(ORDER BY tjspssf.`year`)) * 100), 2) AS different_GDP_percen,
	ROUND(((tjspspf.average_gross_wage - LAG(tjspspf.average_gross_wage,1) OVER(ORDER BY tjspssf.`year`)) / (LAG(tjspspf.average_gross_wage,1) OVER(ORDER BY tjspssf.`year`)) * 100), 2) AS different_WAGE_percen,
	ROUND(((tjspspf.average_price - LAG(tjspspf.average_price,1) OVER(ORDER BY tjspssf.`year`)) / (LAG(tjspspf.average_price,1) OVER(ORDER BY tjspssf.`year`)) * 100), 2) AS different_PRICE_percen
FROM t_jaroslav_snajdar_project_SQL_secondary_final tjspssf
LEFT JOIN t_jaroslav_snajdar_project_SQL_primary_final tjspspf 
	 ON tjspspf.payroll_year = tjspssf.`year` 
WHERE country = 'Czech Republic' 
GROUP BY tjspssf.`year`
ORDER BY tjspssf.`year`;