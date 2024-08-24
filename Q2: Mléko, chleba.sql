-- Q2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
SELECT 
	payroll_year ,
	average_payroll, 
	food_name,
	food_price, 
	round (average_payroll/food_price) AS quantity
	FROM t_lucie_lidajova_project_sql_primary_final tllpspf     
		WHERE food_name IN ('Chléb konzumní kmínový','Mléko polotučné pasterované') 
		AND payroll_year IN (2006,2018)
GROUP BY food_name, 
		 payroll_year ;   
		
