-- 코드를 입력하세요
with user_count as 
    (SELECT count(HOST_ID) as count, HOST_ID
    FROM PLACES
    group by HOST_ID
    having count(HOST_ID) >= 2)
select ID,NAME,p.HOST_ID
from PLACES as p 
inner join user_count as u on p.HOST_ID = u.HOST_ID