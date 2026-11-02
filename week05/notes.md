# SEN 307 — Week 5 Practical Notes

## Lab 3: Data Definition Language (DDL)

Database: sen307_vug_sen_24_11522

### Constraint Testing Results

| Test | Constraint | Error Code | Result |
|---------------|------|--------|
1) NOT NULL     | 1048 | Passed |
2) CHECK        | 3819 | Passed |
3) FOREIGN KEY  | 1452 | Passed |
4) ENUM         | 1265 | Passed |
5) UNIQUE       | 1062 | Passed |

# Observations

1. The NOT NULL constraint prevented inserting a department without a name.
2. The CHECK constraint rejected a course with 9 credit units because the allowed range is 1–6.
3. The FOREIGN KEY constraint prevented assigning a student to a department that does not exist.
4. The ENUM constraint rejected an invalid gender value of 'X'.
5. The UNIQUE constraint prevented inserting two departments with the same name.

The temporary department record created during the UNIQUE test was deleted successfully. Department, Course, and Student were verified to be empty.

### Comparison Between Week 4 and Week 5

The Week 4 ER diagram represents the logical design of the university database, while the Week 5 diagram is reverse-engineered from the actual MySQL tables.

The Week 5 schema follows the lecturer's six-table reference design, including the Enrolment and CourseAllocation junction tables. It also implements database constraints and the additional phone column in Student. Any differences from the Week 4 diagram should be confirmed by comparing the two diagrams.