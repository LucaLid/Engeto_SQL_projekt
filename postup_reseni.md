##  DÍLČÍ KROKY PŘI ŘEŠENÍ ##
1. V DBeaver jsem se nejprve potřebovala zorientovat v tabulkách, které nahraná datová sada obsahuje a co se pod jednotlivými sloupci skrývá za význam. Datovou sadu jsme měli již nahranou od Engeta. 
2. Následně jsem si oldschoolově na papíře zaznamenala, které sloupce z kterých tabulek potřebuju využít. 
3. Vytvořila jsem primární tabulky:
   * t_lucie_lidajova_project_sql_primary_final *
   * t_lucie_lidajova_project_sql_secondary_final *
4. Pak jsem ke každé otázce dotazovala přes SQL odpovědi. 
## ODPOVĚDI NA KONKRÉTNÍ VÝZKUMNÉ OTÁZKY ##

### Q1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? ###
U většiny odvětví meziročně mzdy rostly. Z celkových 228 záznamů klesly celkem v 23 případech. Nejvýraznější pokles mezd nastal v roce 2013, a to celkem v 11 z 19 odvětví, což odpovídá ekonomické krizi roku 2013.    

[Zde datové podklady](https://github.com/LucaLid/Engeto_SQL_projekt/edit/main/postup_reseni.md)

### Q2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? ###
- **CHLÉB**
  - V roce 2006 bylo možné si z průměrného platu koupit 1297 kg chleba. 
  - V roce 2018 bylo možné si z průměrného platu koupit 1356 kg chleba. 
- **MLÉKO**
  - V roce 2006 bylo možné si z průměrného platu koupit  1482 l mléka. 
  - V roce 2018 bylo možné si z průměrného platu koupit  1627 l mléka. 

[Zde datové podklady](https://github.com/LucaLid/Engeto_SQL_projekt/blob/main/Q2%3A%20Ml%C3%A9ko%2C%20chleba.sql)

### Q3: Která kategorie potravin zdražuje nejpomaleji?
Ve sledovaném období zdražovaly nejpomaleji potraviny: cukr, rajčata a banány. 
- Naopak nejrychlejší nárůst cen je zaznamenán u paprik, másla a vajec.

[Zde datové podklady](https://github.com/LucaLid/Engeto_SQL_projekt/blob/main/Q3%3A%20Nejpomalej%C5%A1%C3%AD%20zdra%C5%BEov%C3%A1n%C3%AD.sql)

### Q4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? ###
Největší zaznamenaný rozdíl v meziročním růstu potravin v porovnání s růstem mezd nastal v roce 2009, a to **9,42%**.
Naproti tomu v letech 2010 a 2017 byly meziroční přírůstky cen VS mezd nejnižší - **0.36%**. 

[Zde datové podklady](https://github.com/LucaLid/Engeto_SQL_projekt/blob/main/Q4%3A%20V%C3%BDrazn%C3%BD%20n%C3%A1r%C5%AFst%20cen%20potravin.sql)


### Q5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem? ###
Zatím nedokážu odpověďět, myslím, že nemám sprváně nápočty. 
[Zde datové podklady] (https://github.com/LucaLid/Engeto_SQL_projekt/blob/main/Q5%3A%20Vliv%20HDP%20na%20mzdy%20a%20potraviny.sql)
