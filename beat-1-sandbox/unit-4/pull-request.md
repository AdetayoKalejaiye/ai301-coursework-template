# Unit 4 — Test and Submit

## Your pull request

**Pull request**

Not opened: GitHub fork authentication is required before a PR can be created.

**Branch**

fix/73-env-example-openrouter-key

## Eval iterations

**Run history**

Full Unit 4 benchmark run completed by the sonnet-compatible benchmark
subagent: **20/20 agreement**, with the 18/20 bar and every category floor
passed.

**Package analysis**

`pkg-03`: the rubric decided `reject`, matching the gold `reject`. The
plan-fidelity check compares the candidate diff and description with the
plan's stated boundary and deviation notes; the package's changed behavior
silently exceeds the accepted plan, so the required check fails and the PR is
held.

**Check rationale**

> Every changed behavior is inside the plan or tied to an explicit deviation, and the description does not claim files, behavior, or tests the diff does not deliver.

This required check compares the committed diff and description with the plan
so silent scope drift is held before submission.

**Trade-offs**

The skill uses four required checks covering plan fidelity, decisive test
evidence, diff quality, and repository standards. It keeps truthful test
shortfalls reviewable while rejecting hidden omissions and unsupported claims.
