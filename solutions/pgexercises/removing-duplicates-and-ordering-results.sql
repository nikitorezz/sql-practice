-- Problem:    Removing duplicates, and ordering results
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/unique.html
-- Topic:      basics
-- Pattern:    DISTINCT + ORDER BY
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT DISTINCT (surname)
FROM cd.members
ORDER BY surname
LIMIT 10
