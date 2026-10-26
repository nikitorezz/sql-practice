-- Problem:    Control which rows are retrieved - part 2
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/where2.html
-- Topic:      basics
-- Pattern:    Several WHERE conditions
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       2 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE (membercost > 0) AND (membercost < monthlymaintenance/50)
