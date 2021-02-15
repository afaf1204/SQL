SELECT *
from students

-1
SELECT student_name, age
FROM students
WHERE age BETWEEN 18 and 20

-2
SELECT student_name
FROM students
WHERE student_name like '%ch%' 
OR student_name like '%%nd'

-3
SELECT student_name, age
FROM students
WHERE (student_name like '%ae%' 
OR student_name like '%ph%')
AND age != 19

-4
SELECT student_name,age
FROM students
ORDER BY age desc

-5
SELECT student_name
FROM students
limit 4

-6
SELECT *
FROM students
WHERE (age <= 20 
AND ((student_no BETWEEN 3 AND 5) OR student_no = 7))
OR (age > 20 and student_no >= 4)

SELECT *
FROM students
WHERE AGE <= 20 
AND ( student_no BETWEEN 3 AND 5 OR student_no = 7 )
OR (AGE > 20 AND student_no >= 4);