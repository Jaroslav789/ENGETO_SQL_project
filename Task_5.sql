CREATE OR REPLACE TABLE t_jaroslav_snajdar_task_5
SELECT 
	tjspssf.country,
	tjspssf.`year`,
	ROUND(AVG(tjspssf.GDP), 0) AS gdp,
	ROUND(AVG(tjspspf.average_gross_wage), 0) AS wage,
	ROUND(AVG(tjspspf.price), 2) AS price
FROM t_jaroslav_snajdar_project_SQL_secondary_final tjspssf
LEFT JOIN t_jaroslav_snajdar_project_SQL_primary_final tjspspf 
	 ON tjspspf.payroll_year = tjspssf.`year` 
WHERE average_gross_wage IS NOT NULL AND country = 'Czech Republic'	 
GROUP BY tjspssf.`year`
ORDER BY tjspssf.`year`;

SELECT *
FROM t_jaroslav_snajdar_task_5;

WITH a AS (
SELECT 
	*,
	ROUND(((gdp - LAG(gdp,1) OVER(ORDER BY `year`)) / (LAG(gdp,1) OVER(ORDER BY `year`)) * 100), 2) AS d_gbp_percen,
	ROUND(((wage - LAG(wage,1) OVER(ORDER BY `year`)) / (LAG(wage,1) OVER(ORDER BY `year`)) * 100), 2) AS d_ware_percen,
	ROUND(((price - LAG(price,1) OVER(ORDER BY `year`)) / (LAG(price,1) OVER(ORDER BY `year`)) * 100), 2) AS d_rage_percen
FROM t_jaroslav_snajdar_task_5 tjst
)
SELECT 
	`year`,
	CASE
        WHEN  d_gbp_percen > 2 AND d_ware_percen > 2 THEN 'roste'
        ELSE ''
    END AS wage_this_year,
    CASE
        WHEN  d_gbp_percen > 2 AND d_rage_percen > 2 THEN 'roste'
        ELSE ''
    END AS price_this_year,
	CASE 
    	WHEN d_gbp_percen > 2 AND LAG(d_ware_percen,-1) OVER(ORDER BY `year`) > 2 THEN 'roste'
    	ELSE ''
    END AS wage_next_year,
    CASE 
    	WHEN d_gbp_percen > 2 AND LAG(d_rage_percen,-1) OVER(ORDER BY `year`) > 2 THEN 'roste'
    	ELSE ''
    END AS price_next_year
FROM a
WHERE d_gbp_percen IS NOT NULL; 