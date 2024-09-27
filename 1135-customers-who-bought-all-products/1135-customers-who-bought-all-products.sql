# Write your MySQL query statement below
WITH HaveProduct AS (
    SELECT C.customer_id, C.product_key
    FROM Customer C
        LEFT JOIN Product P
        ON C.product_key = P.product_key
    GROUP BY C.customer_id, C.product_key
    HAVING C.customer_id IS NOT NULL
        AND C.product_key IS NOT NULL
)
SELECT DISTINCT customer_id
FROM HaveProduct
GROUP BY customer_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM Product)