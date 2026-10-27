-- Problem:    Delete based on a subquery
-- Source:     pgexercises
-- Difficulty: Easy
-- Link:       https://pgexercises.com/questions/updates/deletewh2.html
-- Topic:      basics
-- Pattern:    DELETE using subquery
-- Dialect:    PostgreSQL
-- Date:       2026-10-27
-- Time:       1 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
DELETE FROM cd.members
WHERE memid NOT IN (
    SELECT DISTINCT (memid)
    FROM cd.bookings
    )
