-- Problem:    More aggregation
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/agg2.html
-- Topic:      basics
-- Pattern:    Subquery in WHERE clause
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       3 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT firstname, surname, joindate
FROM cd.members
WHERE joindate = (SELECT MAX(joindate) from cd.members)
