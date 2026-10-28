-- Problem:    Recyclable and Low Fat Products
-- Source:     LeetCode #1757
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Topic:      basics
-- Pattern:    SELECT WHERE
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT product_id
FROM Products
WHERE
    low_fats = 'Y'
    AND recyclable = 'Y'
