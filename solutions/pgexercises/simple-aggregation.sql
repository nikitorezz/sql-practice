-- Problem:    Simple aggregation
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/agg.html
-- Topic:      basics
-- Pattern:    MAX aggreation
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT MAX(joindate) as latest
FROM cd.members
