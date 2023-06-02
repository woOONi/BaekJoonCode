# Write your MySQL query statement below
SELECT P.product_id, product_name
FROM Sales AS S
LEFT JOIN Product AS P
ON S.product_id = P.product_id
GROUP BY P.product_id
HAVING MAX(sale_date) BETWEEN '2019-01-01' and '2019-03-31'
AND MIN(sale_date) BETWEEN '2019-01-01' and '2019-03-31'
