-- 코드를 입력하세요
WITH TMP AS(
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(HISTORY_ID) >= 5
) 

SELECT MONTH(START_DATE) AS MONTH, T.CAR_ID, COUNT(HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H 
INNER JOIN TMP AS T 
ON T.CAR_ID = H.CAR_ID
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH, CAR_ID
HAVING RECORDS >= 0 
ORDER BY MONTH, CAR_ID DESC