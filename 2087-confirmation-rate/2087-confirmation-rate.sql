# Write your MySQL query statement below
WITH ConfirmCount AS (
    SELECT user_id,
           SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_count,
           COUNT(*) AS total_count
    FROM Confirmations
    GROUP BY user_id
)
SELECT S.user_id,
       ROUND(IFNULL(C.confirmed_count / C.total_count, 0), 2) AS confirmation_rate
FROM Signups S
LEFT JOIN ConfirmCount C
    ON S.user_id = C.user_id
GROUP BY S.user_id;