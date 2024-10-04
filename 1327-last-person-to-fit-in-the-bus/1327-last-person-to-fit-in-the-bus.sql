WITH WeightSum AS (
    SELECT
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS cur_total_weight
    FROM Queue
)
SELECT person_name
FROM WeightSum
WHERE cur_total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;