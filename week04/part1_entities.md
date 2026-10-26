# SEN 307 — Week 4 Lab 2 — Part 1: Entities and Relationships

## 1. Entities, attributes and primary keys

| Entity | Attributes | Primary key |
|---|---|---|
| Department | dept_id, dept_name | dept_id |
| Student | student_id, matric_no, full_name, dept_id (FK) | student_id |
| Lecturer | lecturer_id, lecturer_name, dept_id (FK) | lecturer_id |
| Course | course_id, course_code, course_title | course_id |
| Enrolment | enrolment_id, student_id (FK), course_id (FK), session | enrolment_id |

   Additional linking table for the second many-to-many relationship:    TeachingAssignment(assignment_id PK, lecturer_id FK, course_id FK, session).

## 2. Relationships and cardinalities

1.    Department (1) to Student (many):    Each student belongs to one department; a department can have many students.
2.    Department (1) to Lecturer (many):    Each lecturer belongs to one department; a department can employ many lecturers.
3.    Student (many) to Course (many):    A student registers for many courses, and a course can have many students. The    Enrolment    junction table resolves this M:N relationship.
4.    Lecturer (many) to Course (many):    A lecturer can teach many courses, and a course may have multiple lecturers across sessions. The    TeachingAssignment    junction table resolves this M:N relationship and records the academic session.

   Design note:    The handout lists five starting entities. TeachingAssignment is an extra junction table needed because it explicitly asks us to check for two M:N relationships. The final EER design therefore has six tables.
