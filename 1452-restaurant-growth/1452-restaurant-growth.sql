SELECT 
    MA.visited_on, 
    MA.amount, 
    ROUND(MA.amount / 7, 2) AS average_amount
FROM 
(
    SELECT 
        visited_on, 
        SUM(SUM(amount)) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
    FROM Customer
    GROUP BY visited_on
) MA
WHERE MA.visited_on >= (SELECT MIN(visited_on) FROM Customer) + INTERVAL 6 DAY
ORDER BY MA.visited_on ASC