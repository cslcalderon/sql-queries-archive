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
