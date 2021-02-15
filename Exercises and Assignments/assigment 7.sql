SELECT * FROM students

SELECT * FROM student_enrollment

SELECT * FROM professors

SELECT * FROM courses

SELECT * FROM teach

--1
--No, because there is no related column from both table

--2
SELECT s.student_name, se.course_no, p.last_name 
FROM students s
INNER JOIN student_enrollment se
	  ON s.student_no = se.student_no
INNER JOIN teach t
	  ON se.course_no = t.course_no
INNER JOIN professors p
      ON t.last_name = p.last_name
ORDER BY student_name

--3
--Because we use INNER JOIN that return all the match query and there are 2 professors that teach that lesson

--4
SELECT student_name, course_no, min(last_name)
FROM(
SELECT s.student_name, se.course_no, p.last_name 
FROM students s
INNER JOIN student_enrollment se
	  ON s.student_no = se.student_no
INNER JOIN teach t
	  ON se.course_no = t.course_no
INNER JOIN professors p
      ON t.last_name = p.last_name
) a
GROUP BY student_name, course_no
ORDER BY student_name, course_no

--5
--Because we must compare for every data in correlated subqueries

--6
SELECT first_name, department, salary, (SELECT ROUND(AVG(salary))
										FROM employees
										WHERE department = e1.department) as average_salary_by_department
FROM employees e1
WHERE salary > (
	SELECT AVG(salary)
	FROM employees
	WHERE department = e1.department
)
ORDER BY department

--7
SELECT s.student_no, student_name, course_no
FROM students s 
LEFT JOIN student_enrollment se
ON s.student_no = se.student_no
