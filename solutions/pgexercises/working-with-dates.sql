-- Problem:    Working with dates
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/date.html
-- Topic:      basics
-- Pattern:    Date comparison
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       5 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01'
