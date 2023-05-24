-- 코드를 입력하세요
with m as (SELECT CART_ID
from CART_PRODUCTS
where NAME = 'Milk'),

y as (SELECT CART_ID
from CART_PRODUCTS
where NAME = 'Yogurt')

SELECT m.CART_ID 
FROM m
inner join y 
on m.CART_ID = y.CART_ID
order by m.CART_ID