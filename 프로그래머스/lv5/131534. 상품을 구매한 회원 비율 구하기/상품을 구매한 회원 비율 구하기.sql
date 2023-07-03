# # -- 코드를 입력하세요
# SELECT 
#     YEAR(sales_date) YEAR, 
#     MONTH(sales_date) MONTH, 
#     COUNT(DISTINCT S.user_id) AS PUCHASED_USERS,
#     ROUND(COUNT(DISTINCT S.user_id) / (
#         SELECT COUNT(USER_ID) AS COUNT
#         FROM USER_INFO
#         WHERE YEAR(JOINED) = 2021
#     ),1) AS PUCHASED_RATIO
# FROM ONLINE_SALE S
# LEFT JOIN USER_INFO U
# ON S.USER_ID = U.USER_ID
# WHERE YEAR(JOINED) = '2021'
# GROUP BY YEAR, MONTH
# ORDER BY YEAR, MONTH






with u as(
    select * 
    from USER_INFO 
    where year(JOINED)=2021
)
select
    year(SALES_DATE) as year,
    month(SALES_DATE) as month,
    count(distinct s.USER_ID) as PUCHASED_USERS,
    round(count(distinct s.USER_ID)/ (select count(user_id) from u),1) as PUCHASED_RATIO
from ONLINE_SALE s
join u
on s.USER_ID = u.USER_ID
group by year,month
ORDER BY YEAR, MONTH