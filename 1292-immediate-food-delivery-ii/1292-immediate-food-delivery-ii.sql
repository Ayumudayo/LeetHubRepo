# Write your MySQL query statement below
WITH FirstOrder AS (
    SELECT customer_id, MIN(order_date) AS "first_order_date"
    FROM Delivery
    GROUP BY customer_id
)
SELECT ROUND(AVG(CASE WHEN D.order_date = D.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2) AS "immediate_percentage"
FROM Delivery D
JOIN FirstOrder F
    ON D.customer_id = F.customer_id
    AND D.order_date = F.first_order_date