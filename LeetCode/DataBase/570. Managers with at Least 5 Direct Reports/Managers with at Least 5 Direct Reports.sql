# Write your MySQL query statement below
WITH M_ID AS (
  SELECT managerId
  FROM Employee
  GROUP BY managerId
  HAVING COUNT(managerId) >= 5
)

SELECT (NAME)
FROM M_ID M 
JOIN Employee E
ON M.managerId = E.ID
