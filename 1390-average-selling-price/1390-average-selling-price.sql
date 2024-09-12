# Write your MySQL query statement below
SELECT P.product_id,
       ROUND(IFNULL(SUM(U.units * P.price) / SUM(U.units), 0), 2) AS average_price
FROM Prices P
LEFT JOIN UnitsSold U
    ON U.product_id = P.product_id
    AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id