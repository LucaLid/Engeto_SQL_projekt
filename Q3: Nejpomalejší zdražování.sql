Q3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
CREATE OR REPLACE VIEW v_price_growth AS  
SELECT
    payroll_year,
    food_name,
    food_price,
    LAG(food_price, 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) AS previous_price_value,
    CASE 
        WHEN LAG(food_price, 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) IS NOT NULL THEN
            (food_price - LAG(food_price, 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC)) / LAG(food_price, 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) * 100
        ELSE NULL
    END AS year_over_year_growth
FROM 
    t_Lucie_Lidajova_project_SQL_primary_final;

SELECT 
    food_name,
    MIN(year_over_year_growth) AS lowest_year_over_year_growth
FROM 
    v_price_growth
WHERE 
    year_over_year_growth IS NOT NULL
GROUP BY 
    food_name
ORDER BY 
    lowest_year_over_year_growth ASC  
LIMIT 3; 
