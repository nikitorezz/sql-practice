-- Problem:    Confirmation Rate
-- Source:     LeetCode #1934
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/confirmation-rate/
-- Topic:      joins
-- Pattern:    Subquery in SELECT
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       5 min
-- Hints:      none
-- Redo:       -
-- Note:       LEFT and RIGHT JOIN can have a difference when using COUNT

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT s.user_id, ROUND(
    SUM( CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)
    / COUNT(*),
    2) as confirmation_rate
FROM Signups as s
LEFT JOIN Confirmations as c ON c.user_id = s.user_id
GROUP BY user_id
