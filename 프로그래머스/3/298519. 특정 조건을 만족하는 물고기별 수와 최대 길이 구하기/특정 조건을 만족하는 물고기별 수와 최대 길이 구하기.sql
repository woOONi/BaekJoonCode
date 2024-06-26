# -- 코드를 작성해주세요
# WITH avg_fish as(
#     SELECT FISH_TYPE
#     , AVG(COALESCE(LENGTH,10)) avg_length
#     FROM FISH_INFO
#     GROUP BY FISH_TYPE
#     HAVING avg_length >= 33
# )

# SELECT 
#     COUNT(distinct ID) FISH_COUNT
#     , MAX(LENGTH) MAX_LENGTH
#     , i.FISH_TYPE
# FROM avg_fish a
# LEFT JOIN FISH_INFO i ON i.FISH_TYPE = a.FISH_TYPE
# GROUP BY FISH_TYPE
# ORDER BY FISH_TYPE


WITH avg_fish as (
    SELECT FISH_TYPE
        , avg(coalesce(length, 10)) as avg_length
    FROM FISH_INFO
    GROUP BY FISH_TYPE
    HAVING avg_length >= 33
)

SELECT COUNT(ID) as FISH_COUNT
    , MAX(length) as MAX_LENGTH
    , i.FISH_TYPE
FROM FISH_INFO i
JOIN avg_fish a ON i.FISH_TYPE = a.FISH_TYPE
GROUP BY FISH_TYPE
ORDER BY FISH_TYPE