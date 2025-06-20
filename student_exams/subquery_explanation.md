## query 

```sql 
select st.student_id, st.student_name, su.subject_name, 
    (
        select count(*)
        from Examinations e
        where e.student_id = st.student_id
        and e.subject_name = su.subject_name
    ) as attended_exams 
    from Students st 
    cross join Subjects su
    order by st.student_id, su.subject_name;
```

## notes

- `attended_exams` is made from a subquery where `Examinations` is joined with a cross join of `Students` and `Subjects`
    - the purpose of this is to provide a count of exams that each student has taken for each subject and returns 0 if that
      student hasn't taken an exam
    - it is able to use `st` and `su` aliases because it's doing a scalar subquery
- the `cross join` makes every combination of students with a subject, filling up a sort of framework to then plug in the
  information that the `attended_exams` table provides

## order of running 
1. **`from`** Students st
2. `cross join` Subjects su (makes full cartesian product)
3. **`select`** on the cartesian product and runs the subquery for that specific student/subject pair
4. `subquery` in the select...`select count(*) from Examinations e...`
5. **`order by`** st.student_id, su.subject_name;

## concepts 
**- scalar subquery:** subquery that returns exactly one value, one row and one column, and can be used in places where a single value
  is expected in SQL statement. It works here since only want count of how many times student and subject pair shows up in Examination table. 
**- cross join:** makes a cartesian product of whatever is cross joined (in this case the Students and Subjects tables)
