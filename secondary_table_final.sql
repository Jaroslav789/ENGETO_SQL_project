-- min. 2006, max. 2018
SELECT 
	MIN(date_from),
	MAX(date_from)
FROM czechia_price cp;

-- min. 2000, max. 2021
SELECT 
	MIN(payroll_year),
	MAX(payroll_year)
FROM czechia_payroll cp;

SELECT *
FROM czechia_payroll cp;

SELECT 
	AVG(value),
	YEAR(date_from) AS year_of_entry
FROM czechia_price cp
GROUP BY year_of_entry
ORDER BY year_of_entry; 

-- vytvořit tabulku ...secondary_final
CREATE OR REPLACE TABLE t_jaroslav_snajdar_project_SQL_secondary_final
SELECT 
	e.country,
	e.`year`,
	e.GDP 
FROM economies e
WHERE `year` BETWEEN 2006 AND 2018
ORDER BY e.country, `year`;

