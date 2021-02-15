SELECT first_name, country
FROM employees, regions
WHERE employees.region_id = regions.region_id

SELECT first_name, email, employees.department, division, country
FROM employees, departments, regions
WHERE employees.department = departments.department
AND employees.region_id = regions.region_id
AND email IS NOT NULL
ORDER BY division

SELECT country, count(*)
FROM employees e, regions r
WHERE e.region_id = r.region_id
GROUP BY country


SELECT first_name, email, division, country
FROM employees INNER JOIN regions
ON employees.region_id = regions.region_id
INNER JOIN departments 
ON employees.department = departments.department
WHERE email IS NOT NULL

SELECT distinct department FROM employees
-- 27 departments
SELECT distinct department FROM departments
-- 24 departments


SELECT distinct e.department, d.department
FROM employees e INNER JOIN departments d
ON e.department = d.department


SELECT distinct e.department, d.department
FROM employees e LEFT JOIN departments d
ON e.department = d.department

SELECT distinct e.department, d.department
FROM employees e RIGHT JOIN departments d
ON e.department = d.department

SELECT distinct e.department
FROM employees e LEFT JOIN departments d
ON e.department = d.department
WHERE d.department IS NULL

SELECT distinct d.department,e.department
FROM departments d FULL OUTER JOIN employees e
ON e.department = d.department

SELECT distinct department FROM employees
UNION 
SELECT department FROM departments

SELECT distinct department FROM employees
EXCEPT
SELECT department FROM departments

SELECT department, COUNT(*)
FROM employees
GROUP BY department
UNION ALL
SELECT 'TOTAL', COUNT(*)
FROM employees

SELECT *
FROM employees a CROSS JOIN departments b


(SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MIN(hire_date) FROM employees) 
LIMIT 1)
UNION ALL
SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MAX(hire_date) FROM employees) 

SELECT first_name, hire_date, hire_date - 90
FROM employees

SELECT hire_date, salary,
(SELECT SUM(salary) FROM employees e2
WHERE e2.hire_date BETWEEN e.hire_date - 90 AND e.hire_date) as spending_pattern
FROM employees e
ORDER BY hire_date


CREATE VIEW v_employee_information as
SELECT first_name, email, e.department, salary, division, region, country
FROM employees e, departments d, regions r
WHERE e.department= d.department
AND e.region_id = r.region_id

SELECT * FROM v_employee_information







SELECT * FROM departments

SELECT * FROM regions





