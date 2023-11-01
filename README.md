# ENGETO_SQL_project

Tvorba tabulky - primary_table_final

Tabulku jsem vytvářel postupně pomocí příkazů join. Nejprve jsem si vytvořil pomocnou tabulku, kde jsem spojil hlavní tabulku czechia_payroll se všemi pod tabulkami (calculation, industry_branch, unit, value_type). Dále jsem vytVořil druhou pomocnou tabulku spojením czechia_price s pomocnou tabulkou (category). Ve druhé pomocné tabulce jsem si vypočítal průměry, abych zmenšil počet záznamů a převedl datum (date_from) na roky. Následně jsem tyto dvě pomocné tabulky spojil na základě společných roků). Veškeré spojování jsem prováděl příkazem "LEFT JOIN". 

Úkol číslo 1.

Pro úkol číslo jedna jsem si vytvořil pomocnou tabulku, kde jsem si vybral jen potřebné údaje, omezil jsem roky jen na první a poslední rok ve sledovaném období, abych mohl tyto dva roky porovnat a zjistit, jestli se v posledním sledovaném roce zvýšila mzda v jednotlivém odvětví od prvního sledovaného roku. Ve výsledcích vidíme profese seřazené abecedně, rozdíl ve mzdách (rok 2000 a 2021) a výsledek zjištění. Pokud mzdy rostly vidíme zápis „Roste“ pokud nerostly vidíme zápis „Klesá“. V zemědělství, lesnictví, rybaření mzdy klesly, v ostatních odvětvích mzdy stoupaly. 

Úkol číslo 2.

Tento úkol jsem si rozdělil na dvě části, nejprve jsem hledal první srovnatelné období, kde jsem si vytvořil pomocnou tabulku s rokem 2006, průměrnou mzdou. Spočítal jsem si průměrnou cenu chleba a mléka pro tento rok. Dále jsem vydělil součet těchto průměrných cen průměrnou mzdou za sledované období a zjistil jsem, že je možné si koupit 679 litu mléka a kila chleba za průměrnou mzdu. U posledního srovnatelného období, které bylo v roce 2018, jsem postupoval stejným způsobem, jen jsem vybíral poslední záznamy. V tomto případě je možné si koupit 742 litrů mléka a kila chleba, za průměrnou mzdu v roce 2018. 

Úkol číslo 3.

V rámci úkolu číslo tří, jsem si připravil pomocnou tabulku, kde mám průměrné roční ceny jednotlivých potravin. Následně jsem vybral jen první a poslední sledovaný rok, kde jsem si vypočítal procentní změny. V poslední části jsem vygeneroval tabulku, kde jde vidět procentní změní mezi prvním a posledním sledovaným rokem. Tyto data jsou seřazená od nejmenších procentních změn po největší. Nejpomalejší růst, nebo spíš pokles je u cukru krystalu, který je levnější o 27,52 %. 

