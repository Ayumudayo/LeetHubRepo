# Write your MySQL query statement below
SELECT P.product_name, S.year, s.price
FROM Product P
    JOIN Sales S ON P.product_id = S.product_id