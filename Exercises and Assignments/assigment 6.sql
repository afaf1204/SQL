SELECT *
FROM fruit_imports

--1
SELECT name, total_supply,
CASE 	WHEN total_supply < 20000 THEN 'LOW'
		WHEN total_supply > 20000 AND total_supply < 50000 THEN 'ENOUGH'
		WHEN total_supply > 50000 THEN 'FULL' END as category
FROM
	(SELECT name, sum(supply) as total_supply
	FROM fruit_imports
	GROUP BY name)a
	
--2
SELECT 
SUM(CASE WHEN season = 'Winter' THEN total_cost end) as Winter_total,
SUM(CASE WHEN season = 'Summer' THEN total_cost end) as Summer_total,
SUM(CASE WHEN season = 'Spring' THEN total_cost end) as Spring_total,
SUM(CASE WHEN season = 'Fall' THEN total_cost end) as Fall_total,
SUM(CASE WHEN season = 'All Year' THEN total_cost end) as All_Year
FROM
	(SELECT season, sum(supply*cost_per_unit) as total_cost
	FROM fruit_imports
	GROUP BY season)a



