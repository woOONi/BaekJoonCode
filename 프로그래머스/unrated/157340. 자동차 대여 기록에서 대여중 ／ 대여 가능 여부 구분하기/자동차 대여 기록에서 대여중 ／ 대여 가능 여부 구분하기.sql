-- 코드를 입력하세요
select h.car_id,
    (case when sum(sum_date) = 1 then '대여중'
        else '대여 가능'
    end) asAVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
left join (select history_id, car_id,
    (case when (start_date <= date('2022-10-16') and end_date >= date('2022-10-16')) then 1
        else 0
    end) as sum_date
from CAR_RENTAL_COMPANY_RENTAL_HISTORY) as o
on h.history_id = o.history_id
group by car_id
order by car_id desc
