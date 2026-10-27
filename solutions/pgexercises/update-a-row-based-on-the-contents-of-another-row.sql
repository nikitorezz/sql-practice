-- Problem:    Update a row based on the contents of another row
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/updates/updatecalculated.html
-- Topic:      basics
-- Pattern:    UPDATE using subqueries
-- Dialect:    PostgreSQL
-- Date:       2026-10-27
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
UPDATE cd.facilities
SET membercost = (
  		SELECT membercost * 1.1
  		FROM cd.facilities
  		WHERE name = 'Tennis Court 1'),
	guestcost = (
	  	SELECT guestcost * 1.1
  		FROM cd.facilities
  		WHERE name = 'Tennis Court 1')
WHERE name = 'Tennis Court 2'
