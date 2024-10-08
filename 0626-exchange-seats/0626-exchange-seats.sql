# Write your MySQL query statement below
SELECT id,
    COALESCE(CASE WHEN ROW_NUMBER() OVER (ORDER BY id) % 2 = 1
    THEN lead(student) OVER (ORDER BY id)
    ELSE lag(student) OVER (ORDER BY id) END, student) AS student
FROM Seat