-- 지원 
# WITH 30DAYS AS (
#     SELECT CAR_TYPE, REPLACE(DURATION_TYPE,'일 이상','') AS DURATION_TYPE, DISCOUNT_RATE
#     FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
#     HAVING DURATION_TYPE = 30
# )

# SELECT
#     CAR_ID,
#     C.CAR_TYPE,
#     ROUND(DAILY_FEE * 30 * (100 - DISCOUNT_RATE)/100) AS FEE
# FROM CAR_RENTAL_COMPANY_CAR C
# LEFT JOIN 30DAYS D ON C.CAR_TYPE = D.CAR_TYPE
# WHERE CAR_ID NOT IN (
#     SELECT CAR_ID
#     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#     WHERE END_DATE >= '2022-11-01' 
#     AND START_DATE <= '2022-11-30'
# )
# AND C.CAR_TYPE IN ('세단','SUV')
# HAVING FEE >= 500000 AND FEE < 2000000
# ORDER BY FEE DESC,CAR_TYPE ASC, CAR_ID DESC

select car_id, c.car_type, 
    round(c.daily_fee * 30 * ((100-d.DISCOUNT_RATE) * 0.01)) as fee
from CAR_RENTAL_COMPANY_CAR c
left join CAR_RENTAL_COMPANY_DISCOUNT_PLAN d
on left(DURATION_TYPE,2) = 30 and d.CAR_TYPE = c.CAR_TYPE
where c.CAR_TYPE in ('세단','SUV')
and CAR_ID not in(
    select car_id
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY
    where START_DATE <= '2022-11-30'
    and END_DATE >= '2022-11-01'
)
having fee >=500000 and fee < 2000000
order by fee desc, car_type, car_id desc