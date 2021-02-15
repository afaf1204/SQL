--1 write a query that returns all of those employees that work in
--kids division AND the dates they hired is greater than all of hire_dates
--of maintenance department

SELECT *
FROM employees 
WHERE department IN (SELECT department
					FROM departments
					WHERE division = 'Kids')
AND hire_date > all(SELECT hire_date
				   FROM employees
				   WHERE department = 'Maintenance')

--OR using this query

SELECT *
FROM employees 
WHERE department = any (SELECT department
					FROM departments
					WHERE division = 'Kids')
AND hire_date > all(SELECT hire_date
				   FROM employees
				   WHERE department = 'Maintenance')
				   
--3 return salaries that appear the most

SELECT salary FROM
(SELECT salary, count(*) as cnt
FROM employees
GROUP BY salary
ORDER BY count(*) desc, salary desc
LIMIT 1) a
 
 --OR
 SELECT salary
 FROM employees 
 GROUP BY salary
 HAVING count(*) >= ALL(SELECT count(*) FROM employees
					   GROUP BY salary)
ORDER BY salary desc
LIMIT 1
