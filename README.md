# ENGETO_SQL_project

## Tvorba tabulky - primary_table_final

Tabulku jsem vytvářel postupně pomocí příkazů join. Nejprve jsem si vytvořil pomocnou tabulku, kde jsem spojil hlavní tabulku czechia_payroll se všemi pod tabulkami (calculation, industry_branch, unit, value_type). Dále jsem vytvořil druhou pomocnou tabulku spojením czechia_price s pomocnou tabulkou (category). Ve druhé pomocné tabulce jsem si vypočítal průměr cen potravin, abych zmenšil počet záznamů a převedl datum (date_from) na roky. Následně jsem tyto dvě pomocné tabulky spojil na základě společných roků. Veškeré spojování jsem prováděl příkazem "LEFT JOIN". 

### Úkol číslo 1.

V ukolu číslo jedna, jsem si vypočítal prúměrné mzdy za jednotlivé roky a profeze za první sledované období (rok 2000) a poslední sledované období (rok 2021) a tyto období jsem od sebe odečetl. U vešch sledovaných profesí mzdy rostly a byly v roce 2021 větší, než v roce 2000), tento růst je ve sloupci "grow".

### Úkol číslo 2.

V rámci ukolu čílso dva, jsem vypočítal průměrné ceny a mzdy v prvním a posledním seldovaném odbobím. Jedná se o roky 2006 a 2018. Dále jsem sečetl průměrné ceny pvybraných potravin v jednotlivých letech a vyděli jsem je průměrnými mzdami ve seldovaných letech. V roce 2006 si můžeme za průměrnou mzdu koupit 677 litrů mláka a kila chleba. V roce 2018 to je 737 litrů mléka a kilo chleba. 

### Úkol číslo 3.

V rámci úkolu číslo tří, jsem si připravil pomocnou tabulku, kde mám průměrné roční ceny jednotlivých potravin. Následně jsem vybral jen první a poslední sledovaný rok, kde jsem si vypočítal procentní změny. V poslední části jsem vygeneroval tabulku, kde jde vidět procentní změna mezi prvním a posledním sledovaným rokem. Tyto data jsou seřazená od nejmenších procentních změn po největší. Nejpomalejší růst, nebo spíš pokles je u cukru krystalu, který je levnější o 27,52 %.  

### Úkol číslo 4.

V rámci úkolu číslo čtyři jsem si vytvořil pomocnou tabulku, kde jsem vypočítal procentuální změnu průměrných cen, kterou jsem odečetl od procentuální změny průměrných mezd v jednotlivých letech. Následně jsem zobrazil jen ty roky, kdy byl rozdíl větší, než 10 % a to bylo v letech 2007, 2010, 2011, 2014, 2017. 

## Tvorba tabulky – secondary_table_final
Při tvorbě tabulky secondary_table_final jsem si spojil společné roky tabulek czechia_price a czechia_payroll a podle toho jsem si vygeneroval secondary_table_final, kde jsem vybral jen data, která budu potřebovat pro úkol číslo 5. Spojování dalších potřebných dat jako jsou mzdy a ceny jsem udělal, až v rámci úkolu číslo pět. 

### Úkol číslo 5.

V posledním úkolu jsem si spojil secondary_table_final s potřebnými daty z tabulky primary_table_final (mzdy a ceny v jednotlivých letech), také jsem si vypočítal procentní změny HDP, mezd a cen. V posledním kroku jsem zobrazil tabulku, kde je zaznamenané kdy roste HDP a mzdy, HDP a ceny ve stejném roce. Taky je zobrazeno, kdy roste HDP v aktuálním roce a mzdy v následujícím roce a také kdy roste HDP v aktuálním roce a ceny v následujícím roce. Pokud rostou hodnoty více, než o 2 %, chápeme to jako vliv HDP na ceny a mzdy. 
