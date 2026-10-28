-- Problem:    Big Countries
-- Source:     LeetCode #595
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/big-countries/
-- Topic:      basics
-- Pattern:    Multiple WHERE conditions
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT name, population, area
FROM World
WHERE
    area >= 3000000
    OR population >= 25000000
