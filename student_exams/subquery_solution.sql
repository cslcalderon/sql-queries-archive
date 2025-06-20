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
