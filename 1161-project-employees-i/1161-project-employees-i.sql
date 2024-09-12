# Write your MySQL query statement below
SELECT P.project_id,
    ROUND(IFNULL(SUM(e.experience_years) / COUNT(E.employee_id), 0), 2) AS average_years
FROM Project P
JOIN Employee E
    ON P.employee_id = E.employee_id
GROUP BY project_id