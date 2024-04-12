-- 코드를 작성해주세요
with rnk as (
    select 
        id
        , rank() over (order by SIZE_OF_COLONY desc) as rnk_size
        , (select count(id) from ECOLI_DATA) cnt
    from ECOLI_DATA
)
select id,
    case 
        when rnk_size <= 0.25*cnt then 'CRITICAL'
        when rnk_size <= 0.5*cnt then 'HIGH' 
        when rnk_size <= 0.75*cnt then 'MEDIUM'
        else 'LOW'
    end as COLONY_NAME
from rnk
order by id