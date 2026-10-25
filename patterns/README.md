# Pattern library

Eight patterns that cover most analyst SQL interview questions. Write each one **from memory** (phase 3, Nov 23 – Dec 6), then rewrite it from a blank screen a week later. It's done when you can do that in under 20 minutes.

Save each as `patterns/<file name>.sql`. `progress.py` ticks it off in the main README when the file exists.

| File name | Pattern | Typical question |
|---|---|---|
| `funnel-conversion.sql` | Conversion between ordered steps | What share of users who viewed a product added it to cart, then bought? |
| `cohort-retention.sql` | Cohort retention table | Of users who first appeared in week W, what share came back in weeks 1, 2, 3…? |
| `sessionization.sql` | Sessions from an inactivity gap | Group events into sessions, starting a new one after 30 idle minutes |
| `gaps-and-islands.sql` | Consecutive runs | Longest streak of consecutive active days per user |
| `date-spine.sql` | Fill missing dates | Daily revenue including days with no orders (as 0) |
| `period-over-period-growth.sql` | Week-over-week, year-over-year | Weekly revenue and its % change from the week before |
| `median-percentiles.sql` | Median and percentiles | Median order value per country; 90th percentile delivery time |
| `experiment-metrics.sql` | A/B test metrics per arm | Users, conversions, conversion rate and revenue per user for control vs treatment |

## File format

```sql
-- Pattern:   Sessionization
-- Use when:  events need grouping into visits separated by inactivity
-- Idea:      LAG gives the gap to the previous event; a gap over 30 min starts a session;
--            a running SUM of those starts numbers the sessions
-- Dialect:   DuckDB (PostgreSQL: same)
-- Written:   2026-11-26 from memory, 18 min
-- Rewritten: 2026-12-03 from memory, 11 min

WITH events AS (
    -- tiny inline sample so the file runs on its own in DuckDB
    SELECT * FROM (VALUES
        (1, TIMESTAMP '2026-11-01 10:00'),
        (1, TIMESTAMP '2026-11-01 10:10')
    ) AS t(user_id, event_time)
),
...
```

Include a small inline sample (a `VALUES` list) so each pattern runs as-is in DuckDB. That makes it easy to check, and easy for anyone reading the repo to run.
