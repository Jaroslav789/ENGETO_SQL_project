# ENGETO_SQL_project

Tvorba tabulky - primary_table_final

Tabulku jsem vytvářel postupně pomocí příkazů join. Nejprve jsem si vytvořil pomocnou tabulku, kde jsem spojil hlavní tabulku czechia_payroll se všemi pod tabulkami (calculation, industry_branch, unit, value_type). Dále jsem vytVořil druhou pomocnou tabulku spojením czechia_price s pomocnou tabulkou (category). Ve druhé pomocné tabulce jsem si vypočítal průměry, abych zmenšil počet záznamů a převedl datum (date_from) na roky. Následně jsem tyto dvě pomocné tabulky spojil na základě společných roků). Veškeré spojování jsem prováděl příkazem "LEFT JOIN". 

Úkol číslo 1.
Pro úkol číslo jedna jsem si vytvořil pomocnou tabulku, kde jsem si vybral jen potřebné údaje, omezil jsem roky jen na první a poslední rok ve sledovaném období, abych mohl tyto dva roky porovnat a zjistit, jestli se v posledním sledovaném roce zvýšila mzda v jednotlivém odvětví od prvního sledovaného roku. Ve výsledcích vidíme profese seřazené abecedně, rozdíl ve mzdách (rok 2000 a 2021) a výsledek zjištění. Pokud mzdy rostly vidíme zápis „Roste“ pokud nerostly vidíme zápis „Klesá“. V zemědělství, lesnictví, rybaření mzdy klesly, v ostatních odvětvích mzdy stoupaly. 



