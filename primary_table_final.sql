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