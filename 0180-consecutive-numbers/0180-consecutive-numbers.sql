# Write your MySQL query statement below
WITH CON_NUM AS (
    SELECT num,
           LAG(num, 1) OVER (ORDER BY id) AS prev_num_1,
           LAG(num, 2) OVER (ORDER BY id) AS prev_num_2
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM CON_NUM
WHERE num = prev_num_1 AND num = prev_num_2;