select round(count(*)*1.0 / (select count(distinct player_id) from activity), 2) as fraction 
from
(select
    player_id,
    event_date,
    lead(event_date) over(partition by player_id order by event_date) as next_login,
    row_number() over(partition by player_id order by event_date) as rn
from activity) t
where rn=1
and diff_date(day,event_date, coalesce(next_login, '9999-12-31'))=1
