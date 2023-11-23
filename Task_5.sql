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

SELECT 
	`year`,
	gdp,
	average_gross_wage AS wage,
	average_price AS price,
	different_GDP_percen AS GDP_p,
	different_WAGE_percen AS WAGE_p,
	different_PRICE_percen AS PRICE_p
FROM t_jaroslav_snajdar_task_5 tjst;

SELECT 
	`year`,
	CASE
        WHEN  different_GDP_percen > 2 AND different_WAGE_percen > 2 THEN 'roste'
        ELSE ''
    END AS wage_this_year,
    CASE
        WHEN  different_GDP_percen > 2 AND different_PRICE_percen > 2 THEN 'roste'
        ELSE ''
    END AS price_this_year,
	CASE 
    	WHEN different_GDP_percen > 2 AND LAG(tjst.different_WAGE_percen,-1) OVER(ORDER BY tjst.`year`) > 2 THEN 'roste'
    	ELSE ''
    END AS wage_next_year,
    CASE 
    	WHEN different_GDP_percen > 2 AND LAG(tjst.different_PRICE_percen,-1) OVER(ORDER BY tjst.`year`) > 2 THEN 'roste'
    	ELSE ''
    END AS price_next_year
FROM t_jaroslav_snajdar_task_5 tjst
WHERE different_GDP_percen IS NOT NULL; 