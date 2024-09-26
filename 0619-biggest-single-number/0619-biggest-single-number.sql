# Write your MySQL query statement below
WITH OnlyOnce AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)
SELECT MAX(num) AS num
FROM OnlyOnce