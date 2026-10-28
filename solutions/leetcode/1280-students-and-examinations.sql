-- Problem:    Students and Examinations
-- Source:     LeetCode #1280
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/students-and-examinations/
-- Topic:      joins
-- Pattern:    Multiple JOIN
-- Dialect:    MySQL
-- Date:       2026-10-28
-- Time:       15 min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution
SELECT s.student_id, s.student_name, b.subject_name, COUNT(e.subject_name) as attended_exams
FROM Students as s
    CROSS JOIN Subjects as b
    LEFT JOIN Examinations as e
        ON s.student_id = e.student_id AND b.subject_name = e.subject_name
GROUP BY s.student_id, b.subject_name
ORDER BY student_id, subject_name