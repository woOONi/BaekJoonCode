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




WITH RECURSIVE TIME as (
    SELECT 0 as  HOUR
    
    UNION ALL
    
    SELECT HOUR + 1
    FROM TIME
    WHERE HOUR < 23
)
SELECT t.HOUR
    , COUNT(o.ANIMAL_ID) as COUNT
FROM TIME t
LEFT JOIN ANIMAL_OUTS o ON t.HOUR = HOUR(o.DATETIME)
GROUP BY HOUR
ORDER BY HOUR