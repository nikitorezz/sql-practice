-- Problem:    Insert calculated data into a table
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/updates/insert3.html
-- Topic:      basics
-- Pattern:    Subquery in VALUES
-- Dialect:    PostgreSQL
-- Date:       2026-10-27
-- Time:       5 min
-- Hints:      hint
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
INSERT INTO cd.facilities
VALUES
	( ( SELECT MAX(facid) + 1 FROM cd.facilities ),
	'Spa', 20, 30, 100000, 800)
