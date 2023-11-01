# ENGETO_SQL_project

Tvorba tabulky - primary_table_final

Tabulku jsem vytvářel postupně pomocí příkazů join. Nejprve jsem si vytvořil pomocnou tabulku, kde jsem spojil hlavní tabulku czechia_payroll se všemi pod tabulkami (calculation, industry_branch, unit, value_type). Dále jsem vytVořil druhou pomocnou tabulku spojením czechia_price s pomocnou tabulkou (category). Ve druhé pomocné tabulce jsem si vypočítal průměry, abych zmenšil počet záznamů a převedl datum (date_from) na roky. Následně jsem tyto dvě pomocné tabulky spojil na základě společných roků). Veškeré spojování jsem prováděl příkazem "LEFT JOIN". 


