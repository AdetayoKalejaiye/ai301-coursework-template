# Procedure: how this tool grades a PR package

## Read order

1. In live mode read `scope.md` first and stop for an unfilled placeholder or
an out-of-scope repository. In eval mode treat the bundle as the whole world.
2. Read issue and repo-facts sections, recording requested behavior, thread
direction, PR-template asks, contribution rules, and AI policy.
3. Read plan-context and record its scope pair, named files, test plan, and
deviations before reading the candidate diff.
4. Read the candidate diff and commit list, then the title/description and test
evidence. This makes each later artifact comparable to the plan.

## Evidence gathering

1. For plan-fidelity, list every changed file and behavior from the diff, then
match each to the plan's scope or a deviation note. Compare description claims
with the actual diff.
2. For test-evidence, pair every before/after command and repository check with
the plan's test plan and record the exact observable result, including an
honest “no tests ran” result.
3. For diff-quality, inspect the complete unified diff and commit list for
debug lines, dead/commented-out code, formatting churn, or unrelated hunks.
4. For standards-and-comms, compare title, description, issue number, filled
template sections, disclosure, and thread response with repo-facts rules.
5. In live mode use the files and live repository pages named in the evidence
guide; in eval mode use only the bundle text.

## Check execution

1. Grade plan-fidelity, test-evidence, diff-quality, and standards-and-comms in
that order.
2. Use `pass` only when the condition is supported by an observed fact or
quote; use `fail` for a contradiction and `unclear` when deciding evidence is
absent. Never infer a favorable result from polish or a missing section.
3. A truthful, bounded shortfall can pass when the description states it; an
unreported shortfall fails the check it affects.

## Verdict assembly

1. Emit all four check results with one deciding fact or quote each.
2. Apply the verdict rule literally: any required `fail` or `unclear` means
`reject`; otherwise return `accept`.
3. If several checks fail, identify the first failing required check in rubric
order as the decisive gap. End with the exact fenced JSON schema from
`SKILL.md` and nothing after it.
