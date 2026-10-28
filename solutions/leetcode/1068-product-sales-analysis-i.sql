-- Problem:    Product Sales Analysis I
-- Source:     LeetCode #1068
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/product-sales-analysis-i/
-- Topic:      joins
-- Pattern:    JOIN ON usage
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT p.product_name, s.year, s.price
FROM Sales as s
LEFT JOIN Product as p ON s.product_id = p.product_id
