-- 코드를 입력하세요
with oct_rental as (
    select CAR_ID, Month(START_DATE) as start_month
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where Month(START_DATE) = 10
)
SELECT distinct(o.car_id) as CAR_ID
from CAR_RENTAL_COMPANY_CAR as c
right join oct_rental as o on c.CAR_ID = o.CAR_ID
where CAR_TYPE = '세단'
order by CAR_ID desc