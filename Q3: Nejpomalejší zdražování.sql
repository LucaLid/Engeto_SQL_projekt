Q3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
CREATE OR REPLACE VIEW v_food_price_growth AS 
WITH cte_price_growth AS (
    SELECT
        payroll_year,
        food_name,
        AVG(food_price) AS average_food_price,
        LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) AS previous_year_average_price,
        CASE 
            WHEN LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) IS NOT NULL THEN
                (AVG(food_price) - LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC)) / LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) * 100
            ELSE NULL
        END AS year_over_year_growth
    FROM 
        t_Lucie_Lidajova_project_SQL_primary_final
    GROUP BY
        payroll_year,
        food_name
)
SELECT 
    food_name,
    payroll_year,
    average_food_price,
    previous_year_average_price,
    year_over_year_growth
FROM 
    cte_price_growth
ORDER BY 
    food_name,
    payroll_year;
CREATE OR REPLACE VIEW v_food_price_min_growth AS 
WITH cte_price_growth AS (
    SELECT
        payroll_year,
        food_name,
        AVG(food_price) AS average_food_price,
        LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) AS previous_year_average_price,
        CASE 
            WHEN LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) IS NOT NULL THEN
                (AVG(food_price) - LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC)) / LAG(AVG(food_price), 1) OVER (PARTITION BY food_name ORDER BY payroll_year ASC) * 100
            ELSE 
                NULL
        END AS year_over_year_growth
    FROM 
        t_Lucie_Lidajova_project_SQL_primary_final
    GROUP BY
        payroll_year,
        food_name
)
SELECT 
    food_name,
    year_over_year_growth
FROM 
    cte_price_growth
WHERE 
    year_over_year_growth IS NOT NULL
ORDER BY 
    year_over_year_growth ASC

SELECT * FROM v_food_price_min_growth 
GROUP BY food_name
