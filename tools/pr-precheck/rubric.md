# Rubric: is this pull request ready to submit?

## Checks

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| plan-fidelity | Candidate diff and description read against the plan's in/out-of-scope files and `## Deviations`; plan-fidelity in the evidence guide. | Every changed behavior is inside the plan or tied to an explicit deviation, and the description does not claim files, behavior, or tests the diff does not deliver. An honestly disclosed bounded omission is not a failure by itself. | required |
| test-evidence | `test_evidence` read against the plan's test plan, reproduction steps, before/after results, and repo checks. | Evidence includes an observable before/after for the issue and reports repository checks with actual outcomes. A named check with no tests is reported honestly; generic “tests pass” with no deciding observation fails. | required |
| diff-quality | Unified diff and commit list read against the issue and plan; diff-quality in the evidence guide. | The committed diff contains the smallest reviewable change for the issue, with no debug output, dead code, commented-out debris, formatting churn, or unrelated hunks. | required |
| standards-and-comms | PR title/description read against the issue, PR template, thread direction, contribution guide, and AI policy; standards-and-comms in the evidence guide. | Required template sections contain issue-specific content, the issue is identified, test boxes match the evidence, maintainer direction is engaged, and any stated AI-disclosure rule is met. | required |

## Verdict rule

Accept only when every required check passes. Reject when any required check
fails or is unclear. A truthful, bounded shortfall or deferred behavior may
still pass when the description states it; hidden omissions and unsupported
claims fail the relevant check.
