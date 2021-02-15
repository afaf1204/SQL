SELECT first_name, department, 
(SELECT COUNT(*) FROM employees e1 WHERE e1.department = e2.department)
FROM employees e2
GROUP BY department, first_name
EXCEPT
SELECT first_name, department, 
COUNT(*) OVER(PARTITION BY department)
FROM employees e2
GROUP BY department, first_name

SELECT first_name, department, hire_date, salary,
SUM(salary) OVER(PARTITION BY department
				 ORDER BY hire_date) as running_total_of_salaries
FROM employees


SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, SUM(salary) AS sum_salary,
SUM(SUM(salary)) OVER(ORDER BY EXTRACT(YEAR FROM hire_date)) AS run_sum_salary
FROM employees
GROUP BY hire_year
ORDER BY hire_year;


SELECT first_name, department, hire_date, salary,
SUM(salary) OVER(ORDER BY hire_date ROWS BETWEEN 1000 PRECEDING
				AND CURRENT ROW)
FROM employees

SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary desc)
FROM employees

SELECT * 
FROM (
SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary desc)
FROM employees
) a
WHERE rank = 8


SELECT first_name, email, department, salary,
NTILE(5) OVER(PARTITION BY department ORDER BY salary desc) as salary_bracket
FROM employees


SELECT first_name, email, department, salary,
first_value(salary) OVER(PARTITION BY department ORDER BY salary desc) as first_value
FROM employees



SELECT first_name, last_name, salary,
LAG(salary) OVER() previous_salary
FROM employees

SELECT department, last_name, salary,
LAG(salary) OVER (ORDER BY salary desc) closest_higher_salary
FROM employees

SELECT department, last_name, salary,
LEAD(salary) OVER (ORDER BY salary desc) closest_lower_salary
FROM employees

SELECT department, last_name, salary,
LEAD(salary) OVER (PARTITION BY department ORDER BY salary desc) closest_lower_salary
FROM employees


CREATE TABLE sales
(
	continent varchar(20),
	country varchar(20),
	city varchar(20),
	units_sold integer
);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);

SELECT sum(units_sold) FROM sales 

SELECT continent, sum(units_sold)
FROM sales
GROUP BY continent


SELECT country, sum(units_sold)
FROM sales
GROUP BY country

SELECT city, sum(units_sold)
FROM sales
GROUP BY city

SELECT continent, country, city, sum(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city)


