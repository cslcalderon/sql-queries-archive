## problem: [confirmation rate](https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50)

## query

```sql
select s.user_id,
round(ifnull(
        count((case when c.action = 'confirmed' then 1 end))/
        count(c. action), 0),2) as confirmation_rate
from Signups s 
left join Confirmations c 
on s.user_id = c.user_id
group by s.user_id;
```

## notes
- I first used CTE when solving this, but then the more I looked at it, the more I thought it can be condensed. Using a CTE syntax at first though helped me process what was going on so it was helpful. I do think this query is hard to understand and follow but it is 'cleaner' and 'shorter'.
- Instead of saving the total signups by each user and confirmations in variables (their own columns) I am pulling them in the select using count statements.
- The rest of it is pretty self-explanatory, but like I said before it's a little hard to follow without all the context off the get-go so maybe a good in between is a subquery, but then could be inefficient depending on length of data...

## order of running 
1. from
2. left join
3. on
4. group by
5. select 

## concepts 
- **case when**: Can use this to count the cases of this happening for each row instead of having to do more complex work. Breaking it down, you pull the column name in this case `c.action` then set the condition you want it to fufill. I'm assuming you can really play and customize this. The other part is the `then' which you tell the `count` how much to "count" and you have to end it with the word `end` or else it gives you an error (keep learning that the hard way)
- **aliasing complex columns in select:** easier and shorter but can make queries more complicated, trying to find better balance for that. 
