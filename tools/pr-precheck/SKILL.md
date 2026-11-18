---
name: pr-precheck
description: Grade a PR package against its plan, issue, repository rules, and test evidence, then decide whether it is ready to submit.
---

# pr-precheck: rubric-driven PR grading

## The question

Answer one question: is this candidate pull request ready to submit? Treat a
PR package as the plan and deviation notes, committed branch diff and history,
draft title and description, test evidence, issue, and repository rules. Read
the package against the plan and issue, not against style or enthusiasm.

## Inputs and modes

In live mode, read `scope.md`, the student's `plan.md` including `## Deviations`,
the committed `git diff main...HEAD` and commit list, `pr_draft.md`,
`test_evidence.md`, and the issue thread, PR template, and `docs/CONTRIBUTING.md`.
For a house-chain submission, use the house plan and repro pack instead of a
student's posted plan/repro while keeping the same checks.

In eval mode, the supplied bundle is the whole world. Read only its issue,
repo-facts, plan-context, candidate PR, diff, commits, description, and test
evidence. Fetch nothing and ignore `scope.md` and `voice-guide.md`.

## The scope seam (live mode only)

Read `scope.md` before grading. Refuse a PR for any repository other than
`codepath/pathreview-ai301-fa26-s1`, and stop if the Repo line is a placeholder.
Apply its fork-branch, one-issue, template, and disclosure rules. Eval mode
ignores `scope.md`.

## The voice seam (live mode only)

Read `voice-guide.md` and compare it with the PR title and description. Report
each broken voice rule separately; voice findings change the verdict only when
a rubric check covers the same communication problem. Eval mode ignores it.

## Component reads

Read `rubric.md` for checks, evidence sources, pass conditions, and the verdict
rule. Read `references/evidence-guide.md` to locate each evidence family, then
execute `procedure.md` in its stated order. If the procedure is silent, report
the gap instead of inventing a step. If the rubric has no filled checks or the
procedure has no filled steps, refuse to grade.

## Verdict and output

The verdict is binary: `accept` means ready to submit and `reject` means hold.
Execute every check and cite the fact or quote that decided each grade. End
with this fenced JSON block, valid and last, with nothing after it.

```json
{
  "item": "<PR URL or bundle id>",
  "checks": [
    {"name": "<check name>", "grade": "pass|fail|unclear",
     "evidence": "<one line: the fact or quote that decided it>"}
  ],
  "verdict": "accept|reject"
}
```

## Grading discipline

Use evidence first: no grade without a deciding fact or quote. Grade the diff,
evidence, and communication rather than formatting. The rubric decides what
passes; the procedure decides how evidence is gathered. Treat `unclear` as a
failing grade under the rubric's verdict rule, and never fetch outside the eval
bundle.
