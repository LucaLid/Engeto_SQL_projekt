Q5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
-- Výpočet meziročního procentuálního nárůstu HDP
WITH gdp_growth AS (
    SELECT
        year,
        LAG(gdp) OVER (ORDER BY year) AS previous_gdp,
        ROUND(((gdp - LAG(gdp) OVER (ORDER BY year)) / LAG(gdp) OVER (ORDER BY year)) * 100, 2) AS gdp_growth_percentage
    FROM t_lucie_lidajova_project_sql_secondary_final
    WHERE country = 'Czech Republic'
),
-- Výpočet meziročního procentuálního nárůstu mezd
payroll_growth AS (
    SELECT
        payroll_year AS year,
        ROUND(((average_payroll - LAG(average_payroll) OVER (PARTITION BY work_branch ORDER BY payroll_year)) / LAG(average_payroll) OVER (PARTITION BY work_branch ORDER BY payroll_year)) * 100, 2) AS payroll_growth_percentage
    FROM t_Lucie_Lidajova_project_SQL_primary_final
),
-- Výpočet meziročního procentuálního nárůstu cen potravin
price_growth AS (
    SELECT
        food_year AS year,
        ROUND(((food_price - LAG(food_price) OVER (PARTITION BY food_name ORDER BY food_year)) / LAG(food_price) OVER (PARTITION BY food_name ORDER BY food_year)) * 100, 2) AS price_growth_percentage
    FROM t_Lucie_Lidajova_project_SQL_primary_final
)
-- Kombinace všech výpočtů
SELECT
    gdp.year,
    gdp.gdp_growth_percentage,
    ROUND(AVG(pg.payroll_growth_percentage), 2) AS avg_payroll_growth_percentage,
    ROUND(AVG(pgr.price_growth_percentage), 2) AS avg_price_growth_percentage
FROM gdp_growth gdp
LEFT JOIN payroll_growth pg ON gdp.year = pg.year
LEFT JOIN price_growth pgr ON gdp.year = pgr.year
GROUP BY gdp.year, gdp.gdp_growth_percentage
ORDER BY gdp.year;
