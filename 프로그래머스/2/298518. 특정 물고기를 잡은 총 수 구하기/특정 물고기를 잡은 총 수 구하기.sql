-- 코드를 작성해주세요
select count(*) as FISH_COUNT
from FISH_INFO i 
left join FISH_NAME_INFO n on i.FISH_TYPE = n.FISH_TYPE
where FISH_NAME in ('BASS','SNAPPER')
