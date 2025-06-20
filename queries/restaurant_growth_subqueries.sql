select 
    current_day.visited_on, 
    sum(past_7.amount) as amount, 
    round(sum(past_7.amount)/7, 2) as average_amount
from (
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
) as current_day 
left join (
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
) as past_7
    on past_7.visited_on between date_sub(current_day.visited_on, interval 6 day)
    and current_day.visited_on
    group by current_day.visited_on
    having count(*) = 7
order by current_day.visited_on;
