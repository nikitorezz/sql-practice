-- Problem:    Customer Who Visited but Did Not Make Any Transactions
-- Source:     LeetCode #1581
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
-- Topic:      joins
-- Pattern:    WHERE and GROUP BY in JOIN
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       10 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT v.customer_id, COUNT( * ) as count_no_trans
FROM Visits as v
LEFT JOIN Transactions as t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id
