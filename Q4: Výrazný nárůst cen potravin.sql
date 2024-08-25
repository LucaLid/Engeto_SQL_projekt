Q4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? 
WITH cte_price_growth AS (
    SELECT
        payroll_year,
        AVG(food_price) AS average_price,
        LAG(AVG(food_price), 1) OVER (ORDER BY payroll_year ASC) AS previous_year_price
    FROM 
        t_lucie_lidajova_project_sql_primary_final
    GROUP BY 
        payroll_year
),
cte_payroll_growth AS (
    SELECT
        payroll_year,
        AVG(average_payroll) AS average_payroll,
        LAG(AVG(average_payroll), 1) OVER (ORDER BY payroll_year ASC) AS previous_year_payroll
    FROM 
        t_lucie_lidajova_project_sql_primary_final
    GROUP BY 
        payroll_year
),
cte_growth_comparison AS (
    SELECT
        p.payroll_year,
        ROUND(((p.average_price - p.previous_year_price) / p.previous_year_price) * 100, 2) AS price_growth_percentage,
        ROUND(((pr.average_payroll - pr.previous_year_payroll) / pr.previous_year_payroll) * 100, 2) AS payroll_growth_percentage,
        ROUND(((p.average_price - p.previous_year_price) / p.previous_year_price) * 100, 2) - 
        ROUND(((pr.average_payroll - pr.previous_year_payroll) / pr.previous_year_payroll) * 100, 2) AS growth_difference
    FROM 
        cte_price_growth p
    JOIN 
        cte_payroll_growth pr 
    ON 
        p.payroll_year = pr.payroll_year
)
SELECT 
    payroll_year,
    price_growth_percentage,
    payroll_growth_percentage,
    growth_difference
FROM 
    cte_growth_comparison
