--  Vytvoření tabulky pro srovnání s evropskými zeměmi, sledované období 2006-2018 (dle dostupnosti dat ke mzdám a cenám potravin) --  
CREATE OR REPLACE TABLE t_lucie_lidajova_project_sql_secondary_final AS
SELECT 
	c.country, 
	e.year, 
	c.population,
	e.gdp, 
	e.gini
FROM countries c 
JOIN economies e ON e.country = c.country
WHERE c.continent = "Europe" AND e.YEAR BETWEEN 2006 AND 2018     -- omezeny roky; v datových sadách ke mzdám a cenám potravin jsou uvedena data z období 2006-2018 
GROUP BY e.year, c.country; 

SELECT * FROM t_lucie_lidajova_project_sql_secondary_final
