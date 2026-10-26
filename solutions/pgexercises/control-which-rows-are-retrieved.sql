-- Problem:    Control which rows are retrieved
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/where.html
-- Topic:      basics
-- Pattern:    SELECT with WHERE
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT *
FROM cd.facilities
WHERE membercost > 0
