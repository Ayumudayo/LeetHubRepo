# Write your MySQL query statement below
WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(COUNT(A.player_id) / COUNT(F.player_id), 2) AS fraction
FROM first_logins F
LEFT JOIN Activity A
    ON F.player_id = A.player_id
    AND A.event_date = DATE_ADD(F.first_login, INTERVAL 1 DAY);