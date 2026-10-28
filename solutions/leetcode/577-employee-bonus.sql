-- Problem:    Employee Bonus
-- Source:     LeetCode #577
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/employee-bonus/
-- Topic:      joins
-- Pattern:    LEFT JOIN
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT name, bonus
FROM Employee as e
LEFT JOIN Bonus as b ON e.empId = b.empId
WHERE bonus < 1000 OR bonus IS NULL
