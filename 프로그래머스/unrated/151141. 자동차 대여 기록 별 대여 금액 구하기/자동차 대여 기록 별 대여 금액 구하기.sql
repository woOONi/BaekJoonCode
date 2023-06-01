# -- 코드를 입력하세요
# with duration as (
#     select h.HISTORY_ID, car.DAILY_FEE, car.CAR_TYPE,
#         datediff(h.end_date,h.start_date) + 1 as PERIOD,
#         case 
#             when datediff(h.end_date,h.start_date) + 1 >= 90 then '90일 이상'
#             when datediff(h.end_date,h.start_date) + 1 >= 30 then '30일 이상'
#             when datediff(h.end_date,h.start_date) + 1 >= 7 then '7일 이상'
#         else '' end as date_duration
#     from CAR_RENTAL_COMPANY_CAR as car
#     join CAR_RENTAL_COMPANY_RENTAL_HISTORY as h 
#     on car.CAR_ID = h.CAR_ID
#     where car_type = '트럭'
#     group by h.HISTORY_ID
# )

# select dr.HISTORY_ID, 
#     ROUND(dr.DAILY_FEE * dr.PERIOD * (100 - COALESCE(dp.DISCOUNT_RATE,0)) / 100) AS FEE
# from duration as dr
# left outer join CAR_RENTAL_COMPANY_DISCOUNT_PLAN as dp
# on dr.date_duration = dp.DURATION_TYPE
# and dr.CAR_TYPE = dp.CAR_TYPE
# order by FEE desc, HISTORY_ID desc


# # WITH 30DAYS AS (
# #     SELECT CAR_TYPE, REPLACE(DURATION_TYPE,'일 이상','') AS DURATION_TYPE, DISCOUNT_RATE
# #     FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
# #     HAVING DURATION_TYPE = 30
# # )

# # SELECT HISTORY_ID, DATEDIFF(END_DATE, START_DATE)+1,
# # FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
# # LEFT JOIN CAR_RENTAL_COMPANY_CAR C ON H.CAR_ID = C.CAR_ID
# # WHERE CAR_TYPE = '트럭'

WITH HC AS (
    SELECT HISTORY_ID, 
        DATEDIFF(END_DATE, START_DATE) + 1 AS DURATION, 
        DAILY_FEE,
        CAR_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    LEFT JOIN CAR_RENTAL_COMPANY_CAR C
    ON H.CAR_ID = C.CAR_ID
    WHERE CAR_TYPE = '트럭'
)

SELECT HISTORY_ID, ROUND(DURATION*DAILY_FEE*(1 - (COALESCE(P.DISCOUNT_RATE, 0) / 100))) AS FEE
FROM HC
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
ON HC.CAR_TYPE = P.CAR_TYPE AND
    CASE WHEN HC.DURATION BETWEEN 7 AND 29 THEN P.DURATION_TYPE LIKE '7%'
        WHEN HC.DURATION BETWEEN 30 AND 89 THEN P.DURATION_TYPE LIKE'30%'
        WHEN HC.DURATION >= 90 THEN P.DURATION_TYPE LIKE'90%'
    END 
ORDER BY FEE DESC, HISTORY_ID DESC