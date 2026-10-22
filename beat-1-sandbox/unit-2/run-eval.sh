#!/usr/bin/env bash
set -euo pipefail

phase_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(git -C "$phase_dir" rev-parse --show-toplevel)"
source_skill="$repo_dir/tools/repro-check"
installed_skill="$HOME/.claude/skills/repro-check"

if ! command -v claude >/dev/null 2>&1; then
  echo "Claude Code must be installed and signed in before running the course harness." >&2
  exit 127
fi

mkdir -p "$installed_skill/references"
for file in SKILL.md scope.md rubric.md voice-guide.md references/evidence-guide.md; do
  cp "$source_skill/$file" "$installed_skill/$file"
done

eval_checkout="$(mktemp -d "${TMPDIR:-/tmp}/ai301-unit2.XXXXXXXX")"
trap 'rm -rf -- "$eval_checkout"' EXIT
git clone --quiet https://github.com/codepath/ai301-unit2-starter.git "$eval_checkout"
git -C "$eval_checkout" checkout --quiet 4a688f1ec22f6dc7b66479436c87c58348ae735c
cd "$eval_checkout/eval"

save_flags=(--save-run "$phase_dir/eval-run.txt")
for arg in "$@"; do
  case "$arg" in
    --only|--only=*|--limit|--limit=*) save_flags=() ;;
  esac
done

python3 run_eval.py \
  --skill "$installed_skill/SKILL.md" \
  --rubric "$installed_skill/rubric.md" \
  --evidence "$installed_skill/references/evidence-guide.md" \
  --out "$phase_dir/checks/eval-results.json" \
  "${save_flags[@]}" "$@"

python3 - "$phase_dir" <<'PY'
import json
import re
import sys
from pathlib import Path

phase = Path(sys.argv[1])
results = json.loads((phase / "checks/eval-results.json").read_text())
agree, total = results["agreement"]
kind = "full" if total == 20 else "partial"
report = phase / "reproduction.md"
text = report.read_text()
pattern = r"(\*\*Run history\*\*\n)(.*?)(?=\n\*\*Package analysis\*\*)"
match = re.search(pattern, text, re.S)
if match is None:
    raise SystemExit("Run history field was not found in reproduction.md")
history = match[2].strip()
number = len(re.findall(r"^Run \d+ \(", history, re.M)) + 1
line = f"Run {number} ({kind}, Sonnet): agreement {agree}/{total} scored packages."
updated = (history + "\n\n" + line).strip()
text = text[:match.start(2)] + "\n" + updated + "\n" + text[match.end(2):]
package = next((r for r in results["results"] if r["id"] == "pkg-01"), None)
if package and package.get("verdict"):
    checks = package["checks"]
    deciding = [c for c in checks if c["grade"] != "pass"]
    if not deciding:
        deciding = [c for c in checks if c["name"] == "issue-target-matched"]
    evidence = "\n\n".join(
        f"The `{c['name']}` check was {c['grade']}: {c['evidence']}"
        for c in deciding
    )
    analysis = (
        f"pkg-01: my rubric decided {package['verdict']}; "
        f"the instructor gold label is {package['gold']}.\n\n{evidence}"
    )
    text = re.sub(
        r"(\*\*Package analysis\*\*\n).*?(?=\n\*\*Check rationale\*\*)",
        lambda m: m[1] + "\n" + analysis + "\n",
        text, count=1, flags=re.S,
    )
report.write_text(text)
print("Recorded harness result in reproduction.md:", line)
PY
