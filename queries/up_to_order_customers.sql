select 
    c.customer_id,
    c.customer_name,
    o.order_date,
    o.order_amount,
    SUM(o.order_amount) OVER (
        partition by c.customer_id 
        order by o.order_date 
        rows between unbounded preceding and current row
    ) as running_total_amount,
    row_number() over (
        partition by c.customer_id 
        order by o.order_date
    ) as running_order_count
from customers c
join orders o on c.customer_id = o.customer_id
order by c.customer_id, o.order_date;
