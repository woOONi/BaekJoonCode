# -- 코드를 입력하세요
with duration as (
    select h.HISTORY_ID, car.DAILY_FEE, car.CAR_TYPE,
        datediff(h.end_date,h.start_date) + 1 as PERIOD,
        case 
            when datediff(h.end_date,h.start_date) + 1 >= 90 then '90일 이상'
            when datediff(h.end_date,h.start_date) + 1 >= 30 then '30일 이상'
            when datediff(h.end_date,h.start_date) + 1 >= 7 then '7일 이상'
        else '' end as date_duration
    from CAR_RENTAL_COMPANY_CAR as car
    join CAR_RENTAL_COMPANY_RENTAL_HISTORY as h 
    on car.CAR_ID = h.CAR_ID
    where car_type = '트럭'
    group by h.HISTORY_ID
)

select dr.HISTORY_ID, 
    ROUND(dr.DAILY_FEE * dr.PERIOD * (100 - COALESCE(dp.DISCOUNT_RATE,0)) / 100) AS FEE
from duration as dr
left outer join CAR_RENTAL_COMPANY_DISCOUNT_PLAN as dp
on dr.date_duration = dp.DURATION_TYPE
and dr.CAR_TYPE = dp.CAR_TYPE
order by FEE desc, HISTORY_ID desc

# # 대여 중인 자동차들의 정보를 담은 CAR_RENTAL_COMPANY_CAR
# # 테이블과 자동차 대여 기록 정보를 담은 CAR_RENTAL_COMPANY_RENTAL_HISTORY
# # 테이블과 자동차 종류 별 대여 기간 종류 별 할인 정책 정보를 담은 CAR_RENTAL_COMPANY_DISCOUNT_PLAN

# select REGEXP_REPLACE(DURATION_TYPE,'[가-힣]','') as 할인대여기간,
#     100 - discount_rate as 할인율
# from CAR_RENTAL_COMPANY_DISCOUNT_PLAN
# where car_type = '트럭'

# 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서 
# 대여 기록 별로 대여 금액(컬럼명: FEE)을 구하여 대여 기록 ID와 대여 금액 리스트를 출력
# 결과는 대여 금액을 기준으로 내림차순 정렬하고, 
# 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬해주세요.