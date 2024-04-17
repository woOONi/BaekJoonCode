-- 코드를 작성해주세요
select e1.id, count(e2.id) as CHILD_COUNT
from ECOLI_DATA e1
left join ECOLI_DATA e2 on e1.id = e2.PARENT_ID
group by id