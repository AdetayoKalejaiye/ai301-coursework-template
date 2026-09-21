# Unit 1 — Issue Selection

Path: `beat-1-sandbox/unit-1/selection.md`

Record of the issue carried into Unit 2, and of the evaluation runs that produced
`eval-run.txt`. This file is graded at the path above; a copy kept anywhere else in
the repository is not read.

Complete every labelled field below. Each is graded on its own; content placed under the
wrong label is not graded.

---

## Selected issue

**Issue link**

https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73

**Verdict output**

```
Reading scope.md — source confirmed: codepath/pathreview-ai301-fa26-s1 ✓
Reading rubric.md — 9 required checks, 3 preferred checks.

Grading: https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73

Maintainer is alive:        PASS — repo has recent commits (opened Sep 16 2026, repo active)
Repo is active:             PASS — active repo with open issues and PRs
Issue is unassigned:        PASS — Assignees: No one assigned
Issue is open:              PASS — State: open
Scope fits a newcomer:      PASS — documentation fix touching exactly 2 files (README.md, .env.example); no architectural decisions required
Sufficient context:         PASS — body names the exact discrepancy, the two files to edit, and gives a 1–2 hour estimate
Not a duplicate:            PASS — no duplicate label or comment
No blocking comment:        PASS — no comments at all; no maintainer has flagged it blocked or wont-fix
Not already claimed:        PASS — no claim comments, no linked PRs

Preferred:
Has a response from maintainer:              FAIL — no comments in thread
Has a good-first-issue or help-wanted label: PASS — labels include "good first issue" and "tier-1"
Issue body is clear and specific:            PASS — title names the exact conflict; body identifies the files and expected effort

VERDICT: accept
Fit reason: tier-1 difficulty, documentation-only change to 2 files, clear scope, good first issue label.

Accepted candidates (ranked):
1. https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73 — documentation fix, 2 files, 1–2 hours, tier-1
```

```json
{
  "item": "https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73",
  "checks": [
    {"name": "Maintainer is alive", "grade": "pass", "evidence": "Repo is active with recent activity as of Sep 2026"},
    {"name": "Repo is active", "grade": "pass", "evidence": "71 open issues, active contributions visible"},
    {"name": "Issue is unassigned", "grade": "pass", "evidence": "Assignees: No one assigned"},
    {"name": "Issue is open", "grade": "pass", "evidence": "State: open"},
    {"name": "Scope fits a newcomer", "grade": "pass", "evidence": "Documentation fix touching exactly README.md and .env.example; no architectural decisions"},
    {"name": "Sufficient context", "grade": "pass", "evidence": "Body names exact discrepancy, two relevant files, and estimated effort of 1-2 hours"},
    {"name": "Not a duplicate", "grade": "pass", "evidence": "No duplicate label or comment in thread"},
    {"name": "No blocking comment", "grade": "pass", "evidence": "No comments at all; no maintainer has flagged it"},
    {"name": "Not already claimed", "grade": "pass", "evidence": "No claim comments, no linked PRs"},
    {"name": "Has a response from maintainer", "grade": "fail", "evidence": "No comments in thread"},
    {"name": "Has a good-first-issue or help-wanted label", "grade": "pass", "evidence": "Labels: bug, docs, good first issue, tier-1"},
    {"name": "Issue body is clear and specific", "grade": "pass", "evidence": "Title names exact conflict; body identifies files and expected effort"}
  ],
  "verdict": "accept"
}
```

---

## Eval iterations

**Run history**

Run 1: agreement 10/20 — initial rubric, scope check too strict, no zombie or saturation checks.
Run 2: agreement 16/20 — added "No blocking comment" and "Not already claimed" checks, loosened scope.
Run 3: agreement 16/20 — loosened scope further, tightened claimed threshold; issue-05 started slipping through.
Run 4: agreement 17/20 — added megaissue rejection to scope, added "Not a zombie issue" check; issue-19 still failing scope.
Run 5 (partial --only): agreement 18/20 — scope check updated to explicitly pass documentation tasks and bugs with identified causes; zombie check catches issue-15; megaissue check catches issue-10.
Run 6 (full --save-run): agreement 17/20 — model variance caused issue-19 to flip back; eval-run.txt written at this score.

**Issue analysis**

issue-15: my rubric graded reject; gold label is reject; agreement: yes.

My rubric rejected issue-15 (zulip/zulip#19589) on the "Not a zombie issue" check. The issue was opened in 2021 and by the capture date had accumulated over 97 comments, at least 6 separate claim-and-unassign cycles via zulipbot, and 2 closed PRs with no resolution. The check's pass condition requires the issue to be either less than 2 years old, or have fewer than 3 failed claim attempts and fewer than 2 closed PRs. issue-15 failed all three thresholds simultaneously: it is over 4 years old, has more than 3 failed claims, and has 2 closed PRs. The rubric correctly identified it as a zombie issue that has defeated multiple contributors and should not be recommended to a newcomer.

**Check rationale**

Quoted from rubric.md as currently uploaded:

"Not a zombie issue | The issue body and comment thread: look at the issue's age, number of failed claim attempts (claimed then auto-unassigned), and number of closed PRs without resolution | The issue is either less than 2 years old, or has fewer than 3 failed claim attempts and fewer than 2 closed PRs without resolution | required"

This check exists because a long-stalled issue with multiple failed attempts is a trap for a newcomer even if it technically passes every other check — it is unassigned, open, has context, and is not blocked by a maintainer comment, yet it has defeated contributor after contributor. The age-or-attempts-or-closed-PRs condition was chosen because any one of those signals alone can have an innocent explanation, but when two or more combine it reliably indicates a zombie. The threshold of 3 failed claims and 2 closed PRs was set by looking at issue-15 specifically: it had 6 claims and 2 closed PRs, which is unambiguously stale, and the thresholds were placed below that to catch it without being so tight they reject legitimate long-running issues.

**Trade-offs**

The "Not a zombie issue" check will miss a zombie issue that is less than 2 years old but has already cycled through 2 failed claims and 1 closed PR — it would pass because it is under the age threshold. I accept this because a 1-year-old issue with 2 failed attempts is borderline; the check is optimized to catch the clearest cases like issue-15 rather than every possible zombie. I confirmed nothing else changed by running --only on the issues that had been passing before adding the check; none flipped.

---

## Selection rationale

**Selection rationale**

1. Issue #73 fits well because it is a documentation-only fix touching exactly two files with no code changes required and an estimated effort of 1–2 hours. That matches the time available for a first contribution and does not require understanding the full PathReview codebase.

2. The verdict correctly identified that the issue is unassigned, open, has clear scope, and is labeled good first issue and tier-1. What the rubric could not weigh is that the fix is genuinely self-contained — README.md and .env.example are independent config files, and reconciling them requires only reading core/config.py to confirm which keys are actually used, then updating the two files to match. There is no risk of breaking anything else.

3. The main difficulty in claiming it is that it is a visible, well-labeled tier-1 issue and may be claimed quickly by another student in the same course. The fix itself presents no technical difficulty.
