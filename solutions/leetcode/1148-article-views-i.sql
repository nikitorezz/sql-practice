-- Problem:    Article Views I
-- Source:     LeetCode #1148
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/article-views-i/
-- Topic:      basics
-- Pattern:    ORDER BY usage
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT DISTINCT (author_id) as id
FROM Views
WHERE author_id = viewer_id
ORDER BY id
