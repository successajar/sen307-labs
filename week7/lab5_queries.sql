-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Ajar Success Daniel   Matric: VUG/SEN/24/11522

USE sen307_vug_sen_24_11522;

-- Recap: check that the Week 6 data is still there
SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;

SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

SELECT c.course_code, c.course_title, l.full_name AS lecturer
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code;

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;


SELECT matric_no, full_name, gender, date_of_birth, dept_id
FROM Student
WHERE gender = 'F'
  AND dept_id IN (1, 3)
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY full_name;



SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 0;

SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 10;


SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON e.course_id = c.course_id
RIGHT JOIN Student s ON s.student_id = e.student_id
ORDER BY s.full_name;

