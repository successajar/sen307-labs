-- SEN 307: Database Systems
-- Week 6 Practical - Lab 4: DML (Insert, Update, Delete)
-- Name: Ajar Success Daniel
-- Matric Number: VUG/SEN/24/11522

USE sen307_vug_sen_24_11522;


SET SQL_SAFE_UPDATES = 0;
DELETE FROM CourseAllocation;
DELETE FROM Enrolment;
DELETE FROM Lecturer;
DELETE FROM Student;
DELETE FROM Course;
DELETE FROM Department;
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE Department AUTO_INCREMENT = 1;
ALTER TABLE Lecturer AUTO_INCREMENT = 1;
ALTER TABLE Student AUTO_INCREMENT = 1;
ALTER TABLE Course AUTO_INCREMENT = 1;
ALTER TABLE Enrolment AUTO_INCREMENT = 1;
ALTER TABLE CourseAllocation AUTO_INCREMENT = 1;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
 'Architectural styles, design patterns, microservices and how to structure large software systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
 'Processes, threads, CPU scheduling, memory management and file systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
 'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
 'Intelligent agents, search algorithms, knowledge representation and reasoning.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
 'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
 'Exploratory data analysis, charts, dashboards and telling stories with data.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
 'Distributed storage and processing of very large datasets with Hadoop and Spark.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));


SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;


SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
  ('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
  ('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
  ('VUA/ST/103', 'Prof Ngozi Eze', 'n.eze@vua.edu.ng', 2),
  ('VUA/ST/104', 'Dr Ibrahim Yusuf', 'i.yusuf@vua.edu.ng', 2),
  ('VUA/ST/105', 'Dr Chidi Nwosu', 'c.nwosu@vua.edu.ng', 3),
  ('VUA/ST/106', 'Mrs Folake Adeyemi', 'f.adeyemi@vua.edu.ng', 3),
  ('VUA/ST/107', 'Dr Emeka Obiora', 'e.obiora@vua.edu.ng', 4),
  ('VUA/ST/108', 'Dr Hauwa Abdullahi', 'h.abdullahi@vua.edu.ng', 4),
  ('VUA/ST/109', 'Mr Tunde Balogun', 't.balogun@vua.edu.ng', 5),
  ('VUA/ST/110', 'Dr Blessing Udoh', 'b.udoh@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
  ('VUG/SEN/24/11522', 'Ajar Success Daniel', NULL, '2007-01-20', 1),
  ('VUG/SEN/24/11530', 'Chinedu Okeke', 'M', '2004-11-02', 1),
  ('VUG/SEN/24/11541', 'Fatima Sani', 'F', '2005-03-14', 1),
  ('VUG/SEN/24/11553', 'Tolu Adebayo', 'M', '2003-08-21', 1),
  ('VUG/COS/24/20112', 'Aisha Mohammed', 'F', '2004-05-30', 2),
  ('VUG/COS/24/20127', 'Emmanuel Okonkwo', 'M', '2005-09-09', 2),
  ('VUG/COS/24/20138', 'Zainab Lawal', 'F', '2006-01-17', 2),
  ('VUG/AIN/24/30105', 'Oluwaseun Ajayi', 'M', '2003-12-05', 3),
  ('VUG/AIN/24/30119', 'Chiamaka Nnamdi', 'F', '2004-07-26', 3),
  ('VUG/AIN/24/30124', 'Yusuf Garba', 'M', '2006-04-11', 3),
  ('VUG/AIN/24/30136', 'Blessing Effiong', 'F', '2005-10-03', 3),
  ('VUG/DTS/24/40108', 'Samuel Danjuma', 'M', '2004-02-19', 4),
  ('VUG/DTS/24/40115', 'Ifeoma Eze', 'F', '2005-06-28', 4),
  ('VUG/DTS/24/40122', 'Abubakar Umar', 'M', '2003-10-14', 4),
  ('VUG/CYB/24/50103', 'Halima Idris', 'F', '2006-08-07', 5),
  ('VUG/CYB/24/50117', 'Kelechi Obi', 'M', '2004-09-23', 5),
  ('VUG/CYB/24/50129', 'Temitope Fashola', 'F', '2005-12-31', 5),
  ('VUG/SEN/24/11567', 'Daniel Ogbu', 'M', '2007-02-15', 1),
  ('VUG/COS/24/20145', 'Grace Ekanem', 'F', '2006-11-20', 2),
  ('VUG/AIN/24/30148', 'Ahmed Suleiman', 'M', '2005-04-02', 3);


SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;

INSERT INTO Enrolment (student_id, course_id) VALUES
  (1, 1),
  (1, 2),
  (1, 5),
  (2, 1),
  (2, 2),
  (3, 1),
  (3, 3),
  (4, 1),
  (4, 2),
  (4, 4),
  (5, 1),
  (5, 3),
  (5, 4),
  (6, 3),
  (6, 4),
  (7, 3),
  (7, 5),
  (8, 5),
  (8, 6),
  (8, 7),
  (9, 6),
  (9, 7),
  (10, 5),
  (10, 6),
  (11, 1),
  (11, 7),
  (12, 8),
  (12, 9),
  (13, 8),
  (13, 9),
  (14, 1),
  (14, 9),
  (15, 10),
  (15, 4),
  (16, 10),
  (16, 1),
  (17, 10),
  (17, 8),
  (18, 1),
  (18, 2);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 5),
  (7, 6),
  (8, 7),
  (9, 8),
  (10, 9),
  (10, 10);


SELECT course_id, COUNT(*) AS students FROM Enrolment GROUP BY course_id HAVING COUNT(*) > 5;

SELECT s.student_id, s.full_name FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id WHERE e.enrolment_id IS NULL;

SELECT course_id, COUNT(*) AS lecturers FROM CourseAllocation GROUP BY course_id HAVING COUNT(*) > 1;

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/SEN/24/11522';
UPDATE Student SET dept_id = 2 WHERE matric_no = 'VUG/SEN/24/11522';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/SEN/24/11522';


INSERT INTO Department (dept_name) VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
  (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));


DELETE FROM Department WHERE dept_name = 'Library and Information Science';


UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;