-- Q1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

CREATE OR REPLACE VIEW v_payroll_changes AS (
    SELECT  
        payroll_year, 
        average_payroll, 
        work_branch,
        LAG (average_payroll, 1) OVER (PARTITION BY work_branch ORDER BY payroll_year, work_branch) AS prev_year_avg_payroll
        FROM t_lucie_lidajova_project_sql_primary_final 
    GROUP BY payroll_year, work_branch
    );
   
SELECT  
	payroll_year, 
    average_payroll, 
    work_branch, 
    prev_year_avg_payroll,  
    CASE 
		WHEN average_payroll > prev_year_avg_payroll THEN "rising"
		ELSE "falling"
	END AS payroll_trend 
FROM v_payroll_changes
WHERE prev_year_avg_payroll IS NOT NULL

CREATE OR REPLACE VIEW v_payroll_changes AS (
    SELECT  
        payroll_year, 
        average_payroll, 
        work_branch,
        LAG (average_payroll, 1) OVER (PARTITION BY work_branch ORDER BY payroll_year, work_branch) AS prev_year_avg_payroll
        FROM t_lucie_lidajova_project_sql_primary_final 
    GROUP BY payroll_year, work_branch
    );
   
WITH payroll_data AS (
    SELECT  
        payroll_year, 
        average_payroll, 
        work_branch, 
        prev_year_avg_payroll,  
        CASE 
            WHEN average_payroll > prev_year_avg_payroll THEN "rising"
            ELSE "falling"
        END AS payroll_trend 
    FROM v_payroll_changes
    WHERE prev_year_avg_payroll IS NOT NULL 
)
SELECT *
FROM payroll_data
WHERE payroll_trend = "falling"; 
