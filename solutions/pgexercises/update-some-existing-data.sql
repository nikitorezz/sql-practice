-- Problem:    Update some existing data
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/updates/update.html
-- Topic:      basics
-- Pattern:    UPDATE SET usage
-- Dialect:    PostgreSQL
-- Date:       2026-10-27
-- Time:       5 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
UPDATE cd.facilities
SET initialoutlay = 10000
WHERE name = 'Tennis Court 2'
