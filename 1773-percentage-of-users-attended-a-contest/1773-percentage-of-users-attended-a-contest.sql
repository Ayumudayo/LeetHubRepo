# Write your MySQL query statement below
SELECT R.contest_id,
    ROUND(IFNULL(COUNT(*) / (SELECT COUNT(*) FROM Users), 0) * 100, 2) AS percentage
FROM Register R
LEFT JOIN Users U
    ON R.user_id = U.user_id
GROUP BY R.contest_id
ORDER BY percentage DESC, R.contest_id ASC