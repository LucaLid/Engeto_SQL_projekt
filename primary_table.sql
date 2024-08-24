-- CREATING PRIMARY TABLE NR. 1 -- 
CREATE OR REPLACE TABLE t_Lucie_Lidajova_project_SQL_primary_final AS 
SELECT 
    payroll_year, 
    average_payroll, 
    branch_code,
    work_branch, 
    food_name,
    food_price
FROM (
    SELECT 
        cp.payroll_year, 
        ROUND(AVG(cp.value)) AS average_payroll, 
        cpib.code AS branch_code,
        cpib.name AS work_branch, 
        cpc.name AS food_name,
        ROUND(AVG(cpri.value)) AS food_price 
    FROM 
        czechia_payroll cp
    JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code 
    JOIN czechia_price cpri ON cp.payroll_year = YEAR(cpri.date_from)
    JOIN czechia_price_category cpc ON cpri.category_code = cpc.code    
    WHERE 
        cp.value_type_code = '5958'
        AND cp.unit_code = '200'
        AND cp.industry_branch_code IS NOT NULL 
    GROUP BY 
        cp.payroll_year, 
        cpib.code, 
        cpib.name, 
        cpc.name
) AS subquery
GROUP BY payroll_year, average_payroll, branch_code, food_name, food_price
ORDER BY payroll_year, branch_code, food_name, food_price 
