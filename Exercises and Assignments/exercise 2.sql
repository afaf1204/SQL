SELECT *
FROM professors

-1
SELECT last_name || ' works in the ' || department || ' department'
FROM professors

-2
SELECT 'It is ' || (salary>95000) || ' that professor ' 
|| last_name || ' is highly paid'
FROM professors

-3
SELECT last_name,
UPPER (SUBSTRING(department from 1 for 3)) as department,
salary, hire_date
FROM professors

-4
SELECT MIN(salary), MAX(salary)
FROM professors
WHERE last_name != 'Wilson'

-5
SELECT MIN(hire_date)
FROM professors