SELECT *
FROM students

SELECT *
FROM student_enrollment

SELECT *
FROM courses

--1
--No, because we need another table to make the data related to each other

--2
SELECT student_name
FROM students
WHERE student_no IN (
	  (SELECT student_no
	   FROM student_enrollment
	   WHERE course_no IN (
		   (SELECT course_no
	        FROM courses
	        WHERE course_title IN ('Physics', 'US History')
	        )
	        )
      )
	)

--3
SELECT student_name
FROM students
WHERE student_no IN (
					SELECT student_no
					FROM student_enrollment
					GROUP BY student_no
					ORDER BY count(*) desc
					LIMIT 1					
					)

--4 FALSE

--5 
SELECT *
FROM students
WHERE age = ( 
				SELECT MAX(age)
			  	FROM students
				
				)
