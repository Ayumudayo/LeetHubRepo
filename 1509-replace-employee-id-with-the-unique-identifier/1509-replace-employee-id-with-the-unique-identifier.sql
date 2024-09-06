# Write your MySQL query statement below
SELECT U.unique_id, E.name
FROM EmployeeUNI U
RIGHT OUTER JOIN Employees E
    ON U.id = E.id