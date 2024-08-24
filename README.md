# ENGETO_SQL_PROJEKT
Projekt k zakončení kurzu Datová akademie (ún-kv 2024). Zpracovává otázky v oblasti dostupnosti základních potravin široké veřejnosti.

## Zadání projektu ##
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují **dostupnost základních potravin široké veřejnosti** . Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět **porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období**.
Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

## Výzkumné otázky ##
- Q1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
- Q2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- Q3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
- Q4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
- Q5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

## Výstup projektu ##
Výstupem by měly být **dvě tabulky v databázi, ze kterých se požadovaná data dají získat**. 
1. *t_{jmeno}_{prijmeni}_project_SQL_primary_final*   - pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky
2. *t_{jmeno}_{prijmeni}_project_SQL_secondary_final* - pro dodatečná data o dalších evropských státech.

Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

## Datová sada ##
Data pocházejí z Portálu otevřených dat ČR. 

