-- 처음 로그인한 날의 다음 날에 다시 로그인한 플레이어의 비율을 
-- 소수점 둘째 자리에서 반올림하여 보고하는 솔루션을 작성하세요. 
-- 즉, 첫 로그인 날짜부터 최소 이틀 연속 로그인한 플레이어 수를 세고 
-- 그 수를 총 플레이어 수로 나누어야 합니다.
WITH TOTAL_PLAYER AS (
    SELECT COUNT(DISTINCT player_id)
    FROM Activity
), TWICE_VISIT AS (
    SELECT player_id
        , MIN(event_date) over (PARTITION BY player_id) FIRST_DAY
        , LEAD(event_date) over (PARTITION BY player_id ORDER BY event_date) next_day
    FROM Activity
)
SELECT ROUND(COUNT(DISTINCT CASE WHEN NEXT_DAY IS NOT NULL AND DATEDIFF(next_day, FIRST_DAY) = 1 THEN player_id END) / (SELECT * FROM TOTAL_PLAYER), 2) as fraction
FROM TWICE_VISIT