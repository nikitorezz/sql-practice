-- Problem:    Delete a member from the cd.members table
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/updates/deletewh.html
-- Topic:      basics
-- Pattern:    Conditional DELETE
-- Dialect:    PostgreSQL
-- Date:       2026-10-27
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
DELETE FROM cd.members
WHERE memid = 37
