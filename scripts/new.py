"""Create a new solution file from the template.

Interactive (asks for each field):
    python scripts/new.py

With arguments (anything you leave out is asked for):
    python scripts/new.py leetcode "Students and Examinations" --id 1280 --difficulty Easy --topic joins

Run `python scripts/new.py --help` for every option.
"""

import argparse
import sys
from datetime import date

from sqlpractice import HINTS, SOLUTIONS, SOURCES, TEMPLATE, TOPICS, ROOT, slugify


def ask(prompt, default="", choices=None):
    hint = f" [{default}]" if default else ""
    if choices:
        hint = f" ({' / '.join(choices)})" + hint
    while True:
        try:
            value = input(f"{prompt}{hint}: ").strip()
        except EOFError:
            value = ""
        value = value or default
        if choices and value not in choices:
            print(f"  Choose one of: {', '.join(choices)}")
            continue
        return value


def main(argv=None):
    p = argparse.ArgumentParser(description="Create a solution file from templates/solution.sql.")
    p.add_argument("source", nargs="?", choices=list(SOURCES), help="where the problem is from")
    p.add_argument("title", nargs="?", help="problem title, e.g. \"Students and Examinations\"")
    p.add_argument("--id", default=None, help="problem number, e.g. 1280 (optional)")
    p.add_argument("--link", default=None)
    p.add_argument("--difficulty", default=None, help="Easy / Medium / Hard")
    p.add_argument("--topic", default=None, choices=TOPICS)
    p.add_argument("--pattern", default=None, help="one line naming the technique")
    p.add_argument("--dialect", default=None)
    p.add_argument("--minutes", default=None, help="time spent, in minutes")
    p.add_argument("--hints", default=None, choices=list(HINTS), help="none / hint / solution (you opened the solution)")
    p.add_argument("--note", default=None, help="the key idea or trap, in one line")
    p.add_argument("--yes", action="store_true", help="don't ask for missing optional fields")
    a = p.parse_args(argv)

    quick = a.yes
    source = a.source or ask("Source", "leetcode", list(SOURCES))
    label, default_dialect = SOURCES[source]
    title = a.title or ask("Problem title")
    if not title:
        sys.exit("A problem title is needed.")
    pid = a.id if a.id is not None else ("" if quick else ask("Problem number (Enter to skip)"))
    slug = slugify(title)
    guess_link = f"https://leetcode.com/problems/{slug}/" if source == "leetcode" else ""
    link = a.link if a.link is not None else (guess_link if quick else ask("Link", guess_link))
    difficulty = a.difficulty if a.difficulty is not None else ("" if quick else ask("Difficulty", "Easy", ["Easy", "Medium", "Hard"]))
    topic = a.topic or ("mixed" if quick else ask("Topic", "joins", TOPICS))
    pattern = a.pattern if a.pattern is not None else ("" if quick else ask("Pattern (one line)"))
    dialect = a.dialect or (default_dialect if quick else ask("Dialect", default_dialect))
    minutes = a.minutes if a.minutes is not None else ("" if quick else ask("Minutes spent (Enter to fill in later)"))
    hints = a.hints or ("none" if quick else ask("Hints", "none", list(HINTS)))
    note = a.note if a.note is not None else ("" if quick else ask("Note: the key idea or trap (Enter to skip)"))

    name = f"{slugify(pid, 20)}-{slug}.sql" if pid else f"{slug}.sql"
    folder = SOLUTIONS / source
    folder.mkdir(parents=True, exist_ok=True)
    path = folder / name
    if path.exists():
        sys.exit(f"Already exists: {path.relative_to(ROOT).as_posix()} (open it instead, or add your redo below the first query).")

    values = {
        "title": title,
        "source": (f"{label} #{pid}" if pid.isdigit() else f"{label} ({pid})") if pid else label,
        "difficulty": difficulty or "-",
        "link": link or "-",
        "topic": topic,
        "pattern": pattern or "-",
        "dialect": dialect,
        "date": date.today().isoformat(),
        "minutes": minutes or "?",
        "hints": HINTS[hints],
        "note": note or "-",
    }
    text = TEMPLATE.read_text(encoding="utf-8")
    for key, value in values.items():
        text = text.replace("{" + key + "}", value)
    with open(path, "w", encoding="utf-8", newline="\n") as fh:
        fh.write(text)

    print(f"Created {path.relative_to(ROOT).as_posix()}")
    if hints == "solution":
        print("You opened the solution: log it in your SQL Mistake Log and rewrite the query from a blank screen tomorrow.")


if __name__ == "__main__":
    main()
