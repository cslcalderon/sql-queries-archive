## problem: [user avg duration]([[https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50](https://platform.stratascratch.com/coding/10352-users-by-avg-session-time/official-solution?code_type=3)](https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=3))

## query

```sql
with events as (
select 
    user_id, 
    timestamp, 
    action, 
    if(action = 'page_load', @last_load := timestamp, null) as session_start, 
    if(action = 'page_exit' and @user_id = user_id and @last_load is not NULL, TIMESTAMPDIFF(SECOND, @last_load, timestamp), NULL) as session_duration,
    @user_id := user_id
    from facebook_web_log
    order by user_id, timestamp),
filtered_sessions as (
    select 
        user_id,
        session_duration
    from events
    where session_duration is not NULL
)
select 
    user_id,
    AVG(session_duration) as avg_session_duration
from filtered_sessions
group by user_id;
```

## notes
- I first used this query trying to solve it:
```sql
with events_per_day as (
    select user_id, 
    date(timestamp) as day, 
    max(case when action = 'page_load' then timestamp end) as session_start, 
    min(case when action = 'page_exit' then timestamp end) as session_exit
    from facebook_web_log 
    where action in ('page_load', 'page_exit')
    group by user_id, date(timestamp)
    having session_start is not null 
    and session_exit is not null
    and session_exit > session_start
    )
    select 
        user_id, 
        avg(session_exit - session_start) as avg_session_time
        from events_per_day
        group by user_id;
```

And I quickly realized I needed a better way to calculate timestamp differences for each day or find a better way to group the days. I saw that one user had no issues and the one that did have issues was because they had multiple dates, so the logic error was with the session dates not being aggregated right that then led to the wrong calculation. 
In order to fix this, I tried a couple times and variations, ultimately having to ask for hints and learning more about MySQL variables. I then realized this would be the best course of action. 
## order of running 
1. from
2. left join
3. on
4. group by
5. select 

## concepts 
- **variables in MySQL**: temporary storage containers that hold values during query execution.
  - Particularly useful in:
    - Maintaing state across rows in a result set (give why it's good for this since grouped by day)
    - Performing running calculations
    - Sequential data processing
  - Types of variables
    - User defined variables (@variable_name) are session wide and persists until connection ends and are also case sensitive
    - System Variables (@@variable_name) and are global or session-level
  - Assignment (what is tripping me up)
    - ```:=``` is for setting
    - ```=``` is for comparing

## example code snippets
```sql
-- Method 1: Using set
set @counter = 0;
set @user_name = 'John';
set @rate = 0.05;

-- Method 2: Using select
select @counter := 0;
select @max_salary := MAX(salary) FROM employees;

-- Method 3: Inline assignment (within queries)
select @running_total := @running_total + amount from transactions;
```

## using variables
```sql
-- In select
select @counter, @user_name;

-- In where clauses
select * from users where user_id = @target_user;

-- In calculations
select salary * @rate as bonus from employees;
```


## practical examples 
**Running Total**
```sql
set @running_total = 0;

select 
    date,
    amount,
    @running_total := @running_total + amount as running_total
from transactions 
order by date;
```

**Sequentail Data**
```sql
set @prev_status = '';
set @group_num = 0;

select 
    id,
    status,
    @group_num := if(@prev_status != status, @group_num + 1, @group_num) as group_id,
    @prev_status := status
from status_changes
order by id;
```
  
