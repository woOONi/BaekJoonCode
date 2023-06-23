# -- 코드를 입력하세요
# WITH RECURSIVE H AS (
#     SELECT 0 AS N
#     UNION ALL
#     SELECT N+1 H FROM H WHERE N < 23
# ),
# C AS (
#     SELECT HOUR(DATETIME) AS HOUR, COUNT(ANIMAL_ID) AS COUNT
#     FROM ANIMAL_OUTS
#     GROUP BY HOUR
# )

# SELECT H.N AS HOUR, IFNULL(C.COUNT, 0) AS COUNT
# FROM H 
# LEFT JOIN C
# ON H.N = C.HOUR

WITH RECURSIVE number 
AS ( 
    SELECT 0 AS n
    UNION ALL
    SELECT n + 1 AS n 
    FROM number
    WHERE n < 23
)

select n as HOUR, count(ANIMAL_ID) as COUNT
from number n
left join ANIMAL_OUTS a
on hour(a.DATETIME) = n.n
group by HOUR
order by HOUR