-- 코드를 작성해주세요
select f.id, n.FISH_NAME, f.length
from FISH_INFO f
left join FISH_NAME_INFO n on f.FISH_TYPE = n.FISH_TYPE
where (f.FISH_TYPE,LENGTH) in (
    select FISH_TYPE, max(LENGTH)
    from FISH_INFO
    group by FISH_TYPE
)