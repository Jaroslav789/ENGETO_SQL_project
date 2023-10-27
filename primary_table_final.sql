DROP TABLE t_jaroslav_snajdar_project_SQL_primary_final;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_project_SQL_primary_1 AS 
SELECT 
	cp.value AS average_gross_wage,	
	cp.value_type_code,
	cp.unit_code,
	cp.calculation_code,
	cp.industry_branch_code,
	cp.payroll_year,
	cpc.code AS cpc_code,
	cpc.name AS calculation_name,
	cpib.code AS cpib_code,
	cpib.name AS industry_branch_name,
	cpu.code AS cpu_code,
	cpu.name AS unit_name,
	cpvt.code AS cpvt_code,
	cpvt.name AS value_type_name
FROM czechia_payroll cp 
LEFT JOIN czechia_payroll_calculation cpc 
	ON cpc.code = cp.calculation_code
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cpib.code = cp.industry_branch_code
LEFT JOIN czechia_payroll_unit cpu 
	ON cpu.code = cp.unit_code 
LEFT JOIN czechia_payroll_value_type cpvt 
	ON cpvt.code = cp.value_type_code
WHERE 
	cp.value_type_code = 5958
GROUP BY average_gross_wage, industry_branch_name;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_cp_cpc
SELECT *
FROM czechia_price cp 
LEFT JOIN czechia_price_category cpc  
	ON cpc.code = cp.category_code;
	
CREATE OR REPLACE TABLE t_jaroslav_snajdar_project_SQL_primary_2 AS 
SELECT
	name,
	YEAR(date_from) AS year_of_entry,
	ROUND(AVG(value), 2) AS average_price
FROM t_jaroslav_snajdar_cp_cpc tjscc 
GROUP BY name, year_of_entry;

CREATE OR REPLACE TABLE t_jaroslav_snajdar_project_SQL_primary_final AS
SELECT 
	tjspsp.*,
	tjspsp2.name,
	tjspsp2.average_price
FROM t_jaroslav_snajdar_project_SQL_primary_1 tjspsp 
LEFT JOIN t_jaroslav_snajdar_project_SQL_primary_2 tjspsp2 
   ON tjspsp2.year_of_entry = tjspsp.payroll_year
WHERE industry_branch_name IS NOT NULL;
