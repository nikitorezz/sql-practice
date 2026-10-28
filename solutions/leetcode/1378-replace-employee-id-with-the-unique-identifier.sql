-- Problem:    Replace Employee ID With The Unique Identifier
-- Source:     LeetCode #1378
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
-- Topic:      joins
-- Pattern:    JOIN ON usage
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       5 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT unique_id, name
FROM Employees as e
LEFT JOIN EmployeeUNI as uni ON e.id = uni.id
