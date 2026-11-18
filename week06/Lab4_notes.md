# Lab 4 Notes: Referential Integrity

When I tried to delete the "Library and Information Science" department, MySQL gave me 
---Error 1451: Cannot delete or update a parent row: a foreign key constraint fails.

It happened because I had just added a student (Transfer Student) whose `dept_id` pointed to that department. Student has a foreign key to Department, so if MySQL let me delete the department, that student would be pointing at a department that doesn't exist anymore. MySQL blocks the delete to stop that from happening. I didn't set any ON DELETE rule in Week 5, so it just refuses by default.

To fix it, I first updated the student and moved them to Software Engineering, and after that the delete worked because nothing was pointing at the department. I ended up with 5 departments again and the student was still in the table.

I could have fixed it another way by changing the foreign key to `ON DELETE SET NULL`, so the student's `dept_id` becomes empty when the department is deleted (this works because `dept_id` in Student can be NULL). `ON DELETE CASCADE` would also let the delete go through, but it would delete the student as well, so I wouldn't use that here because we'd lose data.