-- Problem:    Find Customer Referee
-- Source:     LeetCode #584
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/find-customer-referee/
-- Topic:      basics
-- Pattern:    Multiple WHERE conditions
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       2 min
-- Hints:      none
-- Redo:       -
-- Note:       IS NULL instead of =

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT name
FROM Customer
WHERE
    referee_id != 2
    OR referee_id IS NULL
