-- 코드를 입력하세요
SELECT USER_ID,
    NICKNAME,
    sum(PRICE) as TOTAL_SALES
from USED_GOODS_USER as u
join USED_GOODS_BOARD as b on u.USER_ID = b.WRITER_ID
where STATUS = 'DONE'
group by WRITER_ID
having TOTAL_SALES >= 700000
order by TOTAL_SALES