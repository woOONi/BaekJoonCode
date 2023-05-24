select USER_ID, NICKNAME, sum(PRICE) as TOTAL_SALES
from USED_GOODS_USER as u
left join (select *
    from USED_GOODS_BOARD
    where STATUS = 'DONE') as g
on u.USER_ID = g.WRITER_ID
group by USER_ID
having TOTAL_SALES >= 700000
order by TOTAL_SALES