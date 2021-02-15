SELECT first_name, COUNT(*) as cnt
FROM employees
GROUP BY first_name
HAVING count(*) > 1
ORDER BY cnt desc

SELECT department
FROM employees
GROUP BY department
ORDER BY department 

SELECT SUBSTRING(email,(POSITION('@' IN email))+1)  email_domain, 
COUNT(*) as count 
FROM employees
WHERE email IS NOT NULL 
GROUP BY SUBSTRING(email,(POSITION('@' IN email))+1)
ORDER BY count desc

SELECT gender, region_id, min(salary), max(salary), avg(salary)
FROM employees
GROUP BY gender,region_id
ORDER BY gender, region_id


SELECT * FROM employees