-- Problem:    Average Time of Process per Machine
-- Source:     LeetCode #1661
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/average-time-of-process-per-machine/
-- Topic:      joins
-- Pattern:    Computations on the same column
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       15 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
WITH starts AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
),
ends AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
)

SELECT starts.machine_id, ROUND(AVG(ends.timestamp - starts.timestamp), 3) as processing_time
FROM starts
JOIN ends ON starts.machine_id = ends.machine_id AND starts.process_id = ends.process_id
GROUP BY starts.machine_id
