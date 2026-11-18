# Evidence guide: where evidence lives in a PR package

## Plan fidelity (harness category: silent-drift)

**Where it lives:** In eval, use plan-context scope and deviations, candidate
diff/commits, and PR description. In live mode use `plan.md`, its `## Deviations`,
`git diff main...HEAD`, commits, and `pr_draft.md`.

**What good looks like:** Every changed file and behavior is planned or
explicitly explained by a deviation, and the description matches the diff.
Honest disclosure of a bounded omission is acceptable; silent extra work is not.

## Test evidence (harness category: not-tested)

**Where it lives:** In eval, use candidate test evidence, plan test plan, and
reproduction block. In live mode use `test_evidence.md`, `plan.md`, and the
reproduced issue steps.

**What good looks like:** Evidence names an observable before/after behavior
and expected result, then records repository checks and actual outputs. “No
tests ran” is useful when it is the real result, not a hidden failure.

## Diff quality (harness category: unreviewable)

**Where it lives:** In eval, inspect the complete unified diff and commit list.
In live mode inspect `git diff main...HEAD` and committed history.

**What good looks like:** The fix is visible in a small, issue-specific diff;
there are no debug prints, dead/commented-out code, unrelated files, or
formatting churn hiding the behavior under review.

## Standards and comms (harness category: standards-wall)

**Where it lives:** In eval, read repo-facts PR template, contribution guidance,
AI policy, thread highlights, and candidate title/description. In live mode
read `.github/PULL_REQUEST_TEMPLATE.md`, `docs/CONTRIBUTING.md`, the issue
thread, and `pr_draft.md`.

**What good looks like:** The issue is identified, each required template
section has issue-specific content, test boxes match evidence, maintainer
direction is engaged, and the stated AI-disclosure rule is satisfied.
