## problem[confirmation rate](https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50)

## query 

```sql 
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
from totals
```

## notes

- I first approached the problem using Common Table Expressions because my brain works better trying to split things apart. Assuming you would need to use this again for other types of data pulling can also be good for that. Otherwise, I do see the CTE being not as efficient.
- `total` is the cte produced by this query and it essentially provides a table of total signups for each user and then total confirms.
- The `select user_id..` is the actual query used on the cte to give you final result using the `total` and `confirms` columns made by the cte.
- I noticed it gave `null` when doing invalid math like 0/0 which makes sense so i used `ifnull` but want to seek a better way to do it if there is but good for data validation as well.

## order of running 
1. cte
2. from
3. select 

## concepts 
- **common table expressions**: a temporary named result set defined at the start of a query using the `with` keyword. this makes complex queries easier to read and manage. Sort of like a virtual table you can reference. Good if you want to reuse the data it provides and also to simplify and improve readability.
- **ifnull**: if the returns value is null, you can choose what you want the data to be replaced by, so in this case `null` gets repalced by `0`
