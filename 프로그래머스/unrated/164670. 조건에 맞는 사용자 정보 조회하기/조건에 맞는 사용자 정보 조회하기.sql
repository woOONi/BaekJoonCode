select user_id, NICKNAME,
    concat(CITY, ' ', STREET_ADDRESS1, ' ',STREET_ADDRESS2) as '전체주소',
    concat(LEFT(TLNO,3),'-',substring(TLNO, 4,4),'-', RIGHT(TLNO,4)) as 전화번호
from USED_GOODS_BOARD as b
left join USED_GOODS_USER as u
on u.user_id = b.WRITER_ID
group by user_id
having count(user_id) >=3
order by user_id desc