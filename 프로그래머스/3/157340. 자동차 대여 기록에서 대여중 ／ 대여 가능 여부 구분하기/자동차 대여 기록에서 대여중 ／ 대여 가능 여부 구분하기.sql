# -- 코드를 입력하세요
# select h.car_id,
#     (case when sum(sum_date) = 1 then '대여중'
#         else '대여 가능'
#     end) asAVAILABILITY
# from CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
#     left join (
#         select history_id
#             , car_id
#             ,(case when (start_date <= date('2022-10-16') and end_date >= date('2022-10-16')) then 1
#             else 0
#         end) as sum_date
#     from CAR_RENTAL_COMPANY_RENTAL_HISTORY
#     ) as o
# on h.history_id = o.history_id
# group by car_id
# order by car_id desc






-- 2022년 10월 16일날 대여중인 car_id 찾기
WITH rentcar as (
    SELECT car_id
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE start_date <= '2022-10-16' 
            AND end_date >= '2022-10-16'
)

SELECT distinct CAR_ID
    , CASE WHEN A.CAR_ID IN (SELECT * FROM rentcar) THEN '대여중' ELSE '대여 가능' END AS AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A
    #GROUP BY CAR_ID
    ORDER BY CAR_ID DESC