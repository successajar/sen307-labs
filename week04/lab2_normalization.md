# SEN 307 Week 4 Practical — Lab 2: Normalization

  Scenario:   University course registration, academic session 2026/2027.   Assumption:   Each student registers for a given course at most once per session in the supplied data. A full multi-semester system would also identify the semester.

## Unnormalized registration sheet (UNF)

| Matric | Student | Student department | Courses | Course titles | Lecturers | Lecturer departments | Session |


| 20231234 | Ada Obi | Software Engineering | SEN307, SEN301 | Database Systems, Software Architecture | Dr A. Okafor, Dr M. Bello | Software Eng., Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | SEN307, COS301 | Database Systems, Operating Systems | Dr A. Okafor, Mrs F. Eze | Software Eng., Computer Sci. | 2026/2027 |
| 20231236 | Grace Okon | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |

## First Normal Form (1NF)

| matric_no | student_name | student_dept | course_code | course_title | lecturer_name | lecturer_dept | session |

| 20231234 | Ada Obi | Software Engineering | SEN307 | Database Systems | Dr A. Okafor | Software Engineering | 2026/2027 |
| 20231234 | Ada Obi | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Engineering | 2026/2027 |
| 20231235 | John Musa | Computer Science | SEN307 | Database Systems | Dr A. Okafor | Software Engineering | 2026/2027 |
| 20231235 | John Musa | Computer Science | COS301 | Operating Systems | Mrs F. Eze | Computer Science | 2026/2027 |
| 20231236 | Grace Okon | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Engineering | 2026/2027 |

  Fix:   Removed comma-separated lists so each row records one student–course registration, identified for this scenario by   (matric_no, course_code, session)  .

## Second Normal Form (2NF): intermediate arrangement

  Student   — `matric_no (PK), student_name, student_dept`

| matric_no | student_name | student_dept |

| 20231234 | Ada Obi | Software Engineering |
| 20231235 | John Musa | Computer Science |
| 20231236 | Grace Okon | Software Engineering |

  Course   — `course_code (PK), course_title, lecturer_name, lecturer_dept` (lecturer fields are a *temporary shortcut for the single-session sample*, not suitable for courses with multiple lecturers)

| course_code | course_title | lecturer_name | lecturer_dept |

| SEN307 | Database Systems | Dr A. Okafor | Software Engineering |
| SEN301 | Software Architecture | Dr M. Bello | Software Engineering |
| COS301 | Operating Systems | Mrs F. Eze | Computer Science |

  Enrolment   — `matric_no (PK part, FK), course_code (PK part, FK), session (PK part)`

| matric_no | course_code | session |

| 20231234 | SEN307 | 2026/2027 |
| 20231234 | SEN301 | 2026/2027 |
| 20231235 | SEN307 | 2026/2027 |
| 20231235 | COS301 | 2026/2027 |
| 20231236 | SEN301 | 2026/2027 |

  Fix:   Separated information determined by student alone (name and department) or by course alone (title and, in this snapshot, lecturer details) from student–course registrations.

## Third Normal Form (3NF): final relational schema

- Department (`dept_id`   PK  , `dept_name`   UNIQUE  )
- Student (`student_id`   PK  , `matric_no`   UNIQUE  , `full_name`, `dept_id`   FK → Department.dept_id  )
- Lecturer*(`lecturer_id`   PK  , `lecturer_name`, `dept_id`   FK → Department.dept_id  )
-   Course  (`course_id`   PK  , `course_code`   UNIQUE  , `course_title`)
-   Enrolment  (`enrolment_id`   PK  , `student_id`   FK → Student.student_id  , `course_id`   FK → Course.course_id  , `session`;   UNIQUE  (`student_id`, `course_id`, `session`))
-   TeachingAssignment  (`assignment_id`   PK  , `lecturer_id`   FK → Lecturer.lecturer_id  , `course_id`   FK → Course.course_id  , `session`;   UNIQUE  (`lecturer_id`, `course_id`, `session`))

  Fix:   Moved department details and lecturer details into their own tables, and used TeachingAssignment to support multiple lecturers teaching multiple courses across sessions without duplicating course or lecturer facts.

  Cardinalities:   Department 1:M Student; Department 1:M Lecturer; Student M:N Course via Enrolment; Lecturer M:N Course via TeachingAssignment (with the relevant session).

  Note:   For production registration across multiple semesters within one session, add a `semester` field (or a separate term table) and include it in the relevant uniqueness constraints.
