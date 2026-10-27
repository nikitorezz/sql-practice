-- Problem:    Update multiple rows and columns at the same time
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/updates/updatemultiple.html
-- Topic:      basics
-- Pattern:    Multiple UPDATE SET
-- Dialect:    PostgreSQL
-- Date:       2026-10-27
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
UPDATE cd.facilities
SET membercost = 6,
	guestcost = 30
WHERE name LIKE '%Tennis Court%'
