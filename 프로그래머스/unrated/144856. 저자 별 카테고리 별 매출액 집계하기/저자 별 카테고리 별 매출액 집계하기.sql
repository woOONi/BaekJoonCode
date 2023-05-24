-- 코드를 입력하세요
with ab as (select BOOK_ID, category, a.AUTHOR_ID, author_name, price
from BOOK as b
inner join AUTHOR as a
on b.AUTHOR_ID = a.AUTHOR_ID)

SELECT AUTHOR_ID, AUTHOR_NAME,CATEGORY, sum(sales * price) as TOTAL_SALES
from BOOK_SALES as s
right join ab as b
on s.BOOK_ID = b.BOOK_ID
where SALES_DATE between '2022-01-01' and '2022-01-31'
group by AUTHOR_ID,CATEGORY
order by AUTHOR_ID, CATEGORY desc
