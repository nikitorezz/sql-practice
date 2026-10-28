-- Problem:    Rising Temperature
-- Source:     LeetCode #197
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/rising-temperature/
-- Topic:      joins
-- Pattern:    Cross row comparison
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       15 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT b.id
FROM Weather as a
CROSS JOIN Weather as b
WHERE b.temperature > a.temperature
    AND b.recordDate = DATE_ADD(a.recordDate, INTERVAL 1 DAY)
