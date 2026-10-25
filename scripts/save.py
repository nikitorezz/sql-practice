"""Update the README progress, then commit and push everything in one step.

    python scripts/save.py                      # commit message written for you
    python scripts/save.py "Redo LeetCode 1934" # your own message
"""

import subprocess
import sys

import progress
from sqlpractice import ROOT, read_header


def git(*args, check=True):
    result = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=True, encoding="utf-8")
    if check and result.returncode != 0:
        sys.exit(f"git {' '.join(args)} failed:\n{result.stderr.strip() or result.stdout.strip()}")
    return result.stdout.strip()


def describe(path):
    h = read_header(ROOT / path)
    if h.get("problem"):
        return f"{h.get('source', '').strip()} {h['problem']}".strip()
    return path.rsplit("/", 1)[-1]


def auto_message(changes):
    added = [p for s, p in changes if s == "A" and p.endswith(".sql") and not p.startswith("templates/")]
    changed = [p for s, p in changes if s == "M" and p.endswith(".sql")]
    if len(added) == 1:
        verb = "Add pattern" if added[0].startswith("patterns/") else "Add"
        return f"{verb} {describe(added[0])}"
    if added:
        return f"Add {len(added)} solutions: " + ", ".join(describe(p) for p in added[:3]) + (" and more" if len(added) > 3 else "")
    if len(changed) == 1:
        return f"Update {describe(changed[0])}"
    if changed:
        return f"Update {len(changed)} solutions"
    return "Update notes"


def main():
    progress.main()
    git("add", "-A")
    lines = git("diff", "--cached", "--name-status").splitlines()
    if not lines:
        print("Nothing new to save.")
        return
    changes = []
    for line in lines:
        parts = line.split("\t")
        changes.append((parts[0][0], parts[-1]))
    message = " ".join(sys.argv[1:]).strip() or auto_message(changes)
    git("commit", "-m", message)
    print(f"Committed: {message}")
    upstream = git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}", check=False)
    result = subprocess.run(["git", "push"] if upstream else ["git", "push", "-u", "origin", "HEAD"], cwd=ROOT)
    if result.returncode != 0:
        sys.exit("Push failed. Your commit is saved locally; see 'Troubleshooting' in GUIDEBOOK.md.")
    print("Pushed to GitHub.")


if __name__ == "__main__":
    main()
