-- Problem:    Matching against multiple possible values
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/where4.html
-- Topic:      basics
-- Pattern:    IN usage
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
WHERE facid IN (1,5)
