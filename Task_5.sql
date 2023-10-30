SELECT 
	tjspssf.`year`,
	 CASE
        WHEN ROUND(((tjspssf.GDP - LAG(tjspssf.GDP,1) OVER(ORDER BY tjspssf.`year`)) / (LAG(tjspssf.GDP,1) OVER(ORDER BY tjspssf.`year`)) * 100), 2) > 5 THEN 'roste'
        ELSE 'neroste'
    END AS grow_GDP,
     CASE
        WHEN ROUND(((tjspspf.average_gross_wage - LAG(tjspspf.average_gross_wage,1) OVER(ORDER BY tjspssf.`year`)) / (LAG(tjspspf.average_gross_wage,1) OVER(ORDER BY tjspssf.`year`)) * 100), 2) > 5 THEN 'roste'
        ELSE 'neroste'
    END AS grow_PRICE, 
    CASE
        WHEN ROUND(((tjspspf.average_price - LAG(tjspspf.average_price,1) OVER(ORDER BY tjspssf.`year`)) / (LAG(tjspspf.average_price,1) OVER(ORDER BY tjspssf.`year`)) * 100), 2) > 5 THEN 'roste'
        ELSE 'neroste'
    END AS grow_WAGE
FROM t_jaroslav_snajdar_project_SQL_secondary_final tjspssf
LEFT JOIN t_jaroslav_snajdar_project_SQL_primary_final tjspspf 
	 ON tjspspf.payroll_year = tjspssf.`year` 
WHERE country = 'Czech Republic' 
GROUP BY tjspssf.`year`
ORDER BY tjspssf.`year`;