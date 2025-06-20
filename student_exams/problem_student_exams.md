## original problem 

### Table: Students

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| student_name | varchar |

**student_id** is the primary key for this table.  
Each row contains the ID and name of one student in the school.

---

### Table: Subjects

| Column Name  | Type    |
|--------------|---------|
| subject_name | varchar |

**subject_name** is the primary key for this table.  
Each row contains the name of one subject in the school.

---

### Table: Examinations

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| subject_name | varchar |

There is no primary key.  
Each row indicates a student attended an exam.  
Each student takes every subject in the school.

---

### 🧠 Goal

Write a query to find the number of times **each student attended each exam**.

Return the result table ordered by `student_id` and `subject_name`.

---

### 🧪 Example Input

**Students**

| student_id | student_name |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |

**Subjects**

| subject_name |
|--------------|
| Math         |
| Physics      |
| Programming  |

**Examinations**

| student_id | subject_name |
|------------|--------------|
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |

---

### ✅ Expected Output

| student_id | student_name | subject_name | attended_exams |
|------------|--------------|--------------|----------------|
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |

---


## solutions 
- [subquery solution](https://github.com/cslcalderon/sql-queries-archive/blob/main/student_exams/subquery_solution.sql)



