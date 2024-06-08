# Write your MySQL query statement below
select Id
from (
    select *
        , lag(recordDate, 1) over (order by recordDate) date_1
        , lag(temperature,1) over (order by recordDate) tmp_1
    from Weather
) a
where temperature > tmp_1
and datediff(recordDate,date_1) = 1