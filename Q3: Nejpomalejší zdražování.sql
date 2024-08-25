Q3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
WITH cte_q3 AS (  
    SELECT 
        payroll_year,
        food_name,
        AVG(food_price) AS average_price
    FROM 
        t_lucie_lidajova_project_sql_primary_final
    GROUP BY 
        payroll_year,
        food_name
),
cte2_q3 AS (
    SELECT 
        *,
        LAG(average_price, 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) AS previous_price
    FROM 
        cte_q3
),
cte3_q3 AS (
    SELECT 
        *,
        ROUND(((average_price - previous_price) / previous_price) * 100, 2) AS perc_growth
    FROM 
        cte2_q3
)
SELECT
    food_name,
    ROUND(AVG(perc_growth), 2) AS perc_growth_final
FROM 
    cte3_q3
GROUP BY 
    food_name 
ORDER BY 
    perc_growth_final ASC;
