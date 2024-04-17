# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from (
    select id, num
        , lead(id, 1) over(order by id) first_id
        , lead(num, 1) over(order by id) first_num
        , lead(id, 2) over(order by id) second_id
        , lead(num, 2) over(order by id) second_num
    from Logs
) tmp
where num = first_num
and num = second_num
and first_id = id + 1
and second_id = id + 2