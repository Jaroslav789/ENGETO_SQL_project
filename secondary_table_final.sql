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
