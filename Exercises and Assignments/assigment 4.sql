SELECT * FROM fruit_imports

-1
SELECT state
FROM fruit_imports 
GROUP BY state
ORDER BY SUM(supply) desc
LIMIT 1

-2
SELECT season, max(cost_per_unit)
FROM fruit_imports 
GROUP BY season

-3
SELECT state
FROM fruit_imports
GROUP BY state, name
HAVING COUNT(name) > 1

-4
SELECT season
FROM fruit_imports
GROUP BY season
HAVING COUNT(season) between 3 and 4

-5
SELECT state, SUM(supply * cost_per_unit) total_cost
FROM fruit_imports
GROUP BY state
ORDER BY total_cost desc
LIMIT 1

-6
CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);

SELECT COUNT(COALESCE(fruit_name, 'SOMEVALUE'))
FROM fruits;

