# Write your MySQL query statement below
SELECT A1.machine_id, ROUND(AVG(
    CASE WHEN A1.activity_type = 'start' AND A2.activity_type = 'end'
        THEN A2.timestamp - A1.timestamp
    END
), 3) AS 'processing_time'
FROM Activity A1
JOIN Activity A2
    ON A1.machine_id = A2.machine_id
GROUP BY A1.machine_id