# Write your MySQL query statement below
WITH ActiveUsers AS (
    SELECT DISTINCT user_id, activity_date
    FROM Activity
    GROUP BY user_id, activity_date
    HAVING DATEDIFF('2019-07-27', activity_date) + 1 <= 30
    AND activity_date <= '2019-07-27'
)
SELECT activity_date AS day, COUNT(*) AS active_users
FROM ActiveUsers
GROUP BY activity_date