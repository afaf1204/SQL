SELECT department, first_name, salary, 
CASE WHEN salary = max_by_department THEN 'Highest Salary'
	 WHEN salary = min_by_department THEN 'Lowest Salary'
END as salary_in_department
FROM(
SELECT department, first_name, salary,
		(SELECT MAX(salary) FROM employees e2
		 WHERE e1.department = e2.department) as max_by_department,
		(SELECT MIN(salary) FROM employees e2
		 WHERE e1.department = e2.department) as min_by_department
FROM employees e1
	) a
WHERE salary = max_by_department
	OR salary = min_by_department
ORDER BY department
