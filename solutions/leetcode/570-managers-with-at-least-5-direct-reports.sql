-- Problem:    Managers with at Least 5 Direct Reports
-- Source:     LeetCode #570
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
-- Topic:      joins
-- Pattern:    IN with subquery
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       2 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)
