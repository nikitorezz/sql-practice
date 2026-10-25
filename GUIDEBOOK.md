# Guidebook: how to save your solutions

This is the working manual for this repo. The README is what visitors see; this file tells you how to use it.

Your local copy lives in `G:\PROJECTS\Data Analytics\Personal\SQL Practice`. Run every command below from that folder: open it in VS Code and use its terminal, or open PowerShell there.

## The daily loop

1. **Solve.** Give each problem 20 minutes before opening the solution.
2. **Create the file.** Run `python scripts/new.py`, answer the prompts, and paste your query under `-- My solution`.
3. **Log any mistake.** If a submission came back wrong or you opened the solution, add a line to your [SQL Mistake Log](https://claude.ai/artifact/3LqYLf3EVX7HK1pcCiVxoC) (a private page only you can open).
4. **Save and push.** Run `python scripts/save.py`. It updates the progress table in the README, commits with a message written for you, and pushes to GitHub.

That's it. Steps 2 and 4 take under a minute.

## Creating a solution file

Interactive. The script asks for each field and suggests defaults:

```
python scripts/new.py
```

In one line. Anything you leave out is asked for, or add `--yes` to skip the optional questions:

```
python scripts/new.py leetcode "Students and Examinations" --id 1280 --difficulty Easy --topic joins --pattern "CROSS JOIN all pairs, LEFT JOIN results, COUNT a right-table column"
```

This creates `solutions/leetcode/1280-students-and-examinations.sql`:

```sql
-- Problem:    Students and Examinations
-- Source:     LeetCode #1280
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/students-and-examinations/
-- Topic:      joins
-- Pattern:    CROSS JOIN all pairs, LEFT JOIN results, COUNT a right-table column
-- Dialect:    MySQL
-- Date:       2026-10-27
-- Time:       ? min
-- Hints:      none
-- Redo:       -
-- Note:       -

-- Approach: one or two lines in your own words (never paste the problem text).


-- My solution

```

Then fill in `Time`, the approach line and your query. For LeetCode the link is guessed from the title; check it.

### The header fields

Keep the header lines exactly as `-- Key: value`; `progress.py` reads them.

| Field | What to write |
|---|---|
| Problem | The title as the site shows it |
| Source | Filled in for you, with the number if you gave one |
| Difficulty | Easy, Medium or Hard (or `-` if the site has none) |
| Link | The problem's URL |
| Topic | One of: `basics`, `joins`, `aggregation`, `subqueries`, `dates`, `ctes`, `windows`, `patterns`, `mixed` |
| Pattern | **One line naming the technique**, e.g. "anti-join with LEFT JOIN … IS NULL", "top-N per group with DENSE_RANK". This is the line a reviewer reads, so make it specific. |
| Dialect | MySQL, PostgreSQL, DuckDB… (set to the site's default; change it if you switch) |
| Date | The day you solved it (filled in) |
| Time | Minutes it took, roughly |
| Hints | `none`, `hint`, or `opened solution` |
| Redo | The date you rewrote it from memory, or `-` |
| Note | The key idea or trap, in one line |

### Folders and file names

| Source | Folder | File name |
|---|---|---|
| LeetCode | `solutions/leetcode/` | `1280-students-and-examinations.sql` |
| DataLemur | `solutions/datalemur/` | `<title-slug>.sql` |
| pgexercises | `solutions/pgexercises/` | use the section as the id: `--id joins` gives `joins-<title-slug>.sql` |
| StrataScratch | `solutions/stratascratch/` | `<id>-<title-slug>.sql` |
| HackerRank | `solutions/hackerrank/` | `<title-slug>.sql` |
| Anything else | `solutions/other/` | `<title-slug>.sql` |

`new.py` builds these names for you; lowercase with hyphens, no spaces.

## When you opened the solution (the 20-minute rule)

1. Set `Hints: opened solution` (or pass `--hints solution` to `new.py`).
2. Log it in the mistake log and tick **I opened the solution**. It goes into the redo queue.
3. Next day, rewrite it from a blank screen **below** the first query, in the same file:

   ```sql
   -- Redo 2026-10-28, from memory, 9 min
   SELECT ...
   ```

4. Change the header to `-- Redo:       2026-10-28`, press **Redone** in the mistake log, and run `python scripts/save.py`.

Keep both queries. The pair shows the learning, and the README counts how many problems still need a redo.

## Writing good solution files

- **Format for reading:** keywords in capitals, one clause per line, CTEs named for what they hold (`first_orders`, not `t1`).
- **Comment the why, not the what:** `-- LEFT JOIN so students with no exams still appear` is useful; `-- join tables` is not.
- **One idea per CTE.** If a query has three steps, it has three CTEs.
- **Never paste the problem statement.** It belongs to the site. The link plus your one-line approach is enough.
- **No real company data, passwords or keys**, ever. The repo is public.

## Saving and pushing

The easy way:

```
python scripts/save.py
python scripts/save.py "Redo LeetCode 1934 from memory"   # your own message
```

`save.py` updates the README, stages everything, writes a message like `Add LeetCode #1280 Students and Examinations`, commits and pushes.

By hand, if you prefer:

```
python scripts/progress.py
git add -A
git commit -m "Add LeetCode #1280 Students and Examinations"
git push
```

Or in VS Code: Source Control panel (Ctrl+Shift+G), write the message, **Commit**, then **Sync Changes**. Run `python scripts/progress.py` first so the README stays current.

Commit once a day or after each session, not once a week. A steady history is part of what this repo shows.

## Patterns and timed sets

- **Patterns (phase 3):** see [`patterns/README.md`](patterns/README.md) for the eight files and their format. Write them from memory and include a tiny inline sample so they run in DuckDB.
- **Timed sets and take-homes (phase 4):** see [`timed-sets/README.md`](timed-sets/README.md).

## Sunday review (15 minutes)

1. Open the **Sunday review** in the mistake log. Note the types flagged **drill**.
2. Clear the redo queue: anything still waiting gets rewritten today.
3. Run `python scripts/progress.py` and look at the README: problems this week, share solved without the solution, topics you have barely touched.
4. Plan the week: two problems on each drill type, plus the next block of your current phase.
5. Optional: in the mistake log press **Download CSV** and save it to a private folder to keep a copy.

## Troubleshooting

| Message | Fix |
|---|---|
| `Author identity unknown` | Tell git who you are, once: `git config --global user.name "Nikita Reznichenko"` and `git config --global user.email "<your GitHub email or the noreply address from GitHub → Settings → Emails>"` |
| `detected dubious ownership in repository` | Run the `git config --global --add safe.directory ...` command that the message prints |
| A sign-in window opens on push | Sign in to GitHub in it; Git Credential Manager remembers you |
| `Updates were rejected` / `fetch first` | Someone (or you, on GitHub's website) changed the repo: `git pull --rebase`, then `python scripts/save.py` again |
| `python` is not recognised | Use `py scripts/new.py`, or run from the Anaconda Prompt |
| `Already exists: …` from `new.py` | You've saved that problem before: open the file and add your new attempt below the first query |
