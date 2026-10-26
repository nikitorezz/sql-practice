-- Problem:    Classify results into buckets
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/basic/classify.html
-- Topic:      basics
-- Pattern:    CASE WHEN usage
-- Dialect:    PostgreSQL
-- Date:       2026-10-26
-- Time:       2 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT
	name,
	CASE
		WHEN monthlymaintenance > 100 THEN 'expensive'
		ELSE 'cheap'
	END AS cost
FROM cd.facilities
