-- Problem:    Invalid Tweets
-- Source:     LeetCode #1683
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/invalid-tweets/
-- Topic:      basics
-- Pattern:    LENGTH usage
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT tweet_id
FROM Tweets
WHERE
    LENGTH (content) > 15
