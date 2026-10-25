"""Shared helpers for the sql-practice scripts. Standard library only (Python 3.8+)."""

import re
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SOLUTIONS = ROOT / "solutions"
PATTERNS = ROOT / "patterns"
TEMPLATE = ROOT / "templates" / "solution.sql"
README = ROOT / "README.md"

# folder name -> (label shown in files and README, default dialect)
SOURCES = {
    "leetcode": ("LeetCode", "MySQL"),
    "datalemur": ("DataLemur", "PostgreSQL"),
    "pgexercises": ("pgexercises", "PostgreSQL"),
    "stratascratch": ("StrataScratch", "PostgreSQL"),
    "hackerrank": ("HackerRank", "MySQL"),
    "other": ("Other", "DuckDB"),
}

# In plan order: phase 1 -> phase 4
TOPICS = ["basics", "joins", "aggregation", "subqueries", "dates", "ctes", "windows", "patterns", "mixed"]

HINTS = {"none": "none", "hint": "hint", "solution": "opened solution"}

PATTERN_FILES = [
    ("funnel-conversion", "Funnel conversion between ordered steps"),
    ("cohort-retention", "Cohort retention: first-activity week x weeks since"),
    ("sessionization", "Sessionization: new session after a 30-minute gap"),
    ("gaps-and-islands", "Gaps and islands: longest streak of active days"),
    ("date-spine", "Date spine: fill missing days"),
    ("period-over-period-growth", "Week-over-week and year-over-year growth"),
    ("median-percentiles", "Median and percentiles with PERCENTILE_CONT"),
    ("experiment-metrics", "Experiment metrics per arm"),
]

HEADER_RE = re.compile(r"^--\s*([A-Za-z]+):\s*(.*?)\s*$")


def slugify(text, max_len=60):
    slug = re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")
    return slug[:max_len].rstrip("-") or "untitled"


def read_header(path):
    """Return the '-- Key: value' fields at the top of a .sql file, keys lower-cased."""
    fields = {}
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            line = line.rstrip("\n")
            if not line.strip():
                if fields:
                    break
                continue
            m = HEADER_RE.match(line)
            if not m:
                if fields:
                    break
                continue
            fields[m.group(1).lower()] = m.group(2)
    return fields


def parse_date(value):
    try:
        return date.fromisoformat(value.strip()[:10])
    except (ValueError, AttributeError):
        return None


def load_solutions():
    """Every solution file with its parsed header, newest first."""
    rows = []
    for path in sorted(SOLUTIONS.rglob("*.sql")):
        h = read_header(path)
        folder = path.relative_to(SOLUTIONS).parts[0]
        label = SOURCES.get(folder, (folder.title(), ""))[0]
        minutes = re.match(r"\s*(\d+)", h.get("time", ""))
        rows.append({
            "path": path,
            "rel": path.relative_to(ROOT).as_posix(),
            "folder": folder,
            "source_label": label,
            "title": h.get("problem") or path.stem,
            "source": h.get("source") or label,
            "difficulty": (h.get("difficulty") or "").strip(),
            "link": (h.get("link") or "").strip(),
            "topic": (h.get("topic") or "").strip().lower(),
            "pattern": (h.get("pattern") or "").strip(),
            "date": parse_date(h.get("date", "")),
            "minutes": int(minutes.group(1)) if minutes else None,
            "hints": (h.get("hints") or "").strip().lower(),
            "redo": (h.get("redo") or "").strip(),
        })
    rows.sort(key=lambda r: (r["date"] or date.min, r["rel"]), reverse=True)
    return rows


def needs_redo(row):
    return "solution" in row["hints"] and row["redo"] in ("", "-")


def pattern_status():
    done = {p.stem for p in PATTERNS.glob("*.sql")}
    return [(stem, label, stem in done) for stem, label in PATTERN_FILES]
