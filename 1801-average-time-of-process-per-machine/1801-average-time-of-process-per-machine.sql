# Write your MySQL query statement below
WITH ActivityWithLead AS (
    SELECT 
        machine_id,
        activity_type,
        timestamp,
        LEAD(timestamp) OVER (PARTITION BY machine_id, process_id ORDER BY timestamp) AS next_timestamp,
        LEAD(activity_type) OVER (PARTITION BY machine_id, process_id ORDER BY timestamp) AS next_activity_type
    FROM Activity
)
SELECT 
    machine_id,
    ROUND(AVG(next_timestamp - timestamp), 3) AS processing_time
FROM ActivityWithLead
WHERE activity_type = 'start' AND next_activity_type = 'end'
GROUP BY machine_id;
