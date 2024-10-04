# Write your MySQL query statement below
SELECT 
    category,
    COUNT(account_id) AS accounts_count
FROM (
    SELECT 
        account_id,
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
) AS salary_group
GROUP BY category

UNION ALL

SELECT 'Low Salary', 0
WHERE NOT EXISTS (SELECT 1 FROM Accounts WHERE income < 20000)

UNION ALL

SELECT 'Average Salary', 0
WHERE NOT EXISTS (SELECT 1 FROM Accounts WHERE income BETWEEN 20000 AND 50000)

UNION ALL

SELECT 'High Salary', 0
WHERE NOT EXISTS (SELECT 1 FROM Accounts WHERE income > 50000);