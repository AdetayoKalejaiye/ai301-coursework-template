# Rubric: is this plan ready to post and build from?

<!--
THIS IS THE PART YOU WRITE. The skill in SKILL.md executes whatever
checks you define here (via your procedure.md). It ships empty on
purpose: the judgment is your work.

A filled rubric must contain:

1. At least one row in the checks table. Each row needs all four
   columns:
   - Check: a short name (used in the output JSON).
   - Evidence: exactly what to look at, and where in the package. Name
     the part (the plan's scope statement, the test plan read against
     the repro evidence's steps, the plan comment read against the
     thread highlights, the repo-facts block) or a location from your
     references/evidence-guide.md. "The plan" is not a source; "the
     plan's stated cause read against what the repro evidence shows"
     is.
   - Pass condition: a decision rule about the OUTCOME that someone
     else could apply and get your answer. Judge the thing itself (is
     this one bounded change? could a stranger start executing it?),
     never the write-up's shape (how many sections it has, how long it
     is, whether it uses headings). Structure-shaped checks are what
     make graders disagree with themselves.
   - Weight: `required` (a fail here holds the package) or `preferred`
     (never changes the verdict).

2. A verdict rule below the table: how the check grades combine into
   accept (ready) or reject (hold), including how `unclear` is
   treated. The verdict space is binary. If you write no rule for
   `unclear`, the skill treats it as fail.

Cover what actually gets bad plans posted. The lecture named the
failure families: the diagnosis ignores or contradicts the reproduced
evidence, the change is unbounded (scope creep), the plan targets the
symptom while the evidence points at the cause, a stranger could not
start executing it, the test plan proves nothing observable, the
unknowns are dressed up as certainty, and the comment ignores what the
thread or the repo's stated conventions ask. A rubric that ignores a
family will fail eval packages designed around that family.
-->

## Checks

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| diagnosis-grounded | The plan's stated diagnosis and proposed change read against the reproduction evidence's observed behavior and the issue's distinguishing conditions; Diagnosis and grounding in the evidence guide | The diagnosis explains the reproduced behavior without contradicting it, and the proposed change addresses the diagnosed cause or explicitly records why the evidence does not establish a cause. A symptom-only change fails when the evidence points to a different cause. | required |
| scope-bounded | The plan's in-scope, out-of-scope, files, and approach statements; Scope in the evidence guide | The planned work is one bounded change that names the areas it will touch and excludes unrelated cleanup, speculative redesign, or unbounded follow-on work. | required |
| executable | The plan's files, ordered approach, inputs, and starting state; Executability in the evidence guide | A stranger can begin the planned work from the stated repository and revision without guessing a material file, command, option, input, or decision. | required |
| test-decisive | The plan's test plan read against the reproduction evidence's steps, expected behavior, and artifacts; Test plan in the evidence guide | The test plan reruns the relevant pre-fix observation and names a concrete post-change command or artifact whose output distinguishes success from failure. It does not rely only on "tests pass" or a future review. | required |
| uncertainty-honest | The plan's risks, unknowns, and Deviations section; Honesty in the evidence guide | Unverified causes, maintainer choices, environment limits, and expected deviations are labeled as uncertainty. The plan does not promise a fix, compatibility, approval, or outcome that its evidence cannot support. | required |
| thread-and-convention | The plan comment against issue context and thread highlights, plus the repo-facts block or live contribution guidance; Comms in the evidence guide | The comment is specific to the issue, does not piggyback on another student's plan, follows the repository's requested contribution/AI-disclosure rules, and acknowledges relevant maintainer guidance or open questions. | required |
| communication-usable | The plan comment's diagnosis, scope, approach, test, and unknowns against the issue and repro evidence; Comms in the evidence guide | A maintainer can understand what will change, what will not, and how success will be checked without misleading certainty, pressure, filler, or an unexplained reference to another plan. | required |
| deviation-recorded | The plan's Deviations section and, when present, the change/evidence record; Honesty in the evidence guide | The package records either a concrete difference between the posted plan and the built change with a reason, or explicitly states in the author's own words that nothing changed and why. | preferred |

## Verdict rule

Accept only when every applicable required check passes. Reject when any
required check fails or is unclear. Preferred checks never change the
verdict. In eval mode, grade every check from the frozen package and do
not invent live evidence; in live mode, use the issue thread, repository
rules, and the student's own reproduction evidence named by the evidence
guide.
