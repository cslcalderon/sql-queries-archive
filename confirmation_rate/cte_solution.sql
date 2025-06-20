with totals as (
    select s.user_id, 
    count(action) as total,
    count(case when c.action = 'confirmed' then 1 end) as confirms
    from Signups s 
    left join Confirmations c
    on s.user_id = c.user_id
    group by s.user_id
)
select user_id,
round(ifnull((confirms/total), 0),2) as confirmation_rate
from totals;
