-- Problem:    Combining results from multiple queries
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/union.html
-- Topic:      basics
-- Pattern:    UNION
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       3 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT surname
FROM cd.members

UNION

SELECT name
FROM cd.facilities
