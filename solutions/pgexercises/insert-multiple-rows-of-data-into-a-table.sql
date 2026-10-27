-- Problem:    Insert multiple rows of data into a table
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/updates/insert2.html
-- Topic:      basics
-- Pattern:    Multiple INSERT
-- Dialect:    PostgreSQL
-- Date:       2026-10-27
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
INSERT INTO cd.facilities
VALUES
	(9, 'Spa', 20, 30, 100000, 800),
	(10, 'Squash Court 2', 3.5, 17.5, 5000, 80)
