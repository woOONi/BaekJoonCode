# Write your MySQL query statement below
# select 'Low Salary' as category,count(*) as accounts_count
# from Accounts
# where income < 20000

# union

# select 'Average Salary' as category,count(*) as accounts_count
# from Accounts
# where income between 20000 and 50000

# union

# select 'High Salary' as category,count(*) as accounts_count
# from Accounts
# where income > 50000

#어디가 틀린 걸까
-- SELECT category, COALESCE(a.account_id,0) AS accounts_count
-- FROM (
--   SELECT 'Low Salary' AS category
--   UNION ALL
--   SELECT 'Average Salary' AS category
--   UNION ALL
--   SELECT 'High Salary' AS category
-- ) AS Temp
-- LEFT JOIN Accounts a ON (
--   CASE
--     WHEN a.income < 20000 THEN 'Low Salary'
--     WHEN a.income > 50000 THEN 'High Salary'
--     ELSE 'Average Salary'
--   END
-- ) = Temp.category
-- GROUP BY category;





SELECT 'Low Salary' AS category, COUNT(CASE WHEN income < 20000 THEN 1 END) accounts_count
    FROM Accounts
UNION ALL
SELECT 'Average Salary' 
        , COUNT(CASE WHEN (income >= 20000) AND (income <= 50000) THEN 1 END) 
    FROM Accounts
UNION ALL
SELECT 'High Salary', COUNT(CASE WHEN income > 50000 THEN 1 END)
    FROM Accounts

