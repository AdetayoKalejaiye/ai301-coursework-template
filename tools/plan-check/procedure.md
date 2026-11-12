# Procedure: how this skill grades a plan package

<!--
THIS IS THE PART YOU WRITE, and it is a new kind of part. Weeks 1 and
2, SKILL.md carried a numbered workflow and you only wrote judgment
files. This week the workflow is gone from the frame: SKILL.md says
"execute procedure.md", and these are the operating steps you author.
The machinery is in your hands now.

Your operator swap is the design brief. When your executor stalled
because your rubric said WHAT to decide but not HOW to find the
evidence, that was a procedure gap. This file is where those gaps get
closed: a complete procedure lets someone who has never seen a plan
package before (a groupmate, or the skill itself) grade one exactly the
way you would.

Under each stage heading below, write the concrete steps for that
stage. The one-line note under each heading says what a complete
procedure must decide there. Write steps, not intentions: "read the
repro evidence before the plan, and note what behavior it pins down"
is a step; "understand the context" is a wish.
-->

## Read order

1. Read the complete package or, in live mode, read `scope.md` first and
   refuse packages outside its repository or with an unfilled scope
   placeholder.
2. Read the issue context and thread highlights before the plan. Record the
   issue's target behavior, requested information, maintainer guidance, and
   any explicit AI-use or contribution rules.
3. Read the reproduction-evidence block next. Record the tested revision,
   trigger/input, observed artifacts, expected behavior, actual behavior,
   and limits of what the reproduction established.
4. Read the candidate plan, then its plan comment. Compare the comment to
   the plan rather than treating headings or length as evidence.
5. In live mode, read the repository contribution guide and the student's
   voice guide before grading communication. In eval mode, use only the
   frozen bundle and ignore `scope.md` and `voice-guide.md`.

<!-- What gets read, in what order, before any check is graded, and
what to note down from each part while reading. A complete procedure
decides the order (issue first? repro evidence first?) and says why
the order matters for the checks that come later. -->

## Evidence gathering

1. For diagnosis-grounded, pair every stated cause and proposed change with
   the reproduction artifact that supports it. Record a contradiction,
   missing causal link, or symptom-only proposal.
2. For scope-bounded, extract the in-scope work, excluded work, named files,
   and approach. Record any unrelated or open-ended work that would expand
   the change.
3. For executable, extract the starting revision, files, commands/inputs,
   order of operations, and decisions the author says will be made. Mark a
   material missing detail as absent rather than guessing it.
4. For test-decisive, pair each planned test with the reproduction step it
   exercises, its expected result, and the observable output or artifact that
   will decide pass or fail. "Run the tests" without a decisive observation
   is insufficient.
5. For uncertainty-honest, record every claim about cause, compatibility,
   maintainer intent, environment limits, risk, and the Deviations section.
   Separate observed facts from assumptions and promises.
6. For thread-and-convention and communication-usable, compare the plan
   comment with the issue title/body, thread highlights, repo-facts rules,
   and the plan/repro evidence. Check that the author writes an independent,
   issue-specific plan and discloses AI use when the repository requires it.
7. For deviation-recorded, compare the declared Deviations section with the
   change/evidence record. In a pre-build package, an explicit statement of
   the intended no-deviation state is still evidence for the preferred check;
   do not turn this preferred check into a verdict gate.

<!-- For each evidence family your rubric's checks name, the concrete
gathering move: which part of the package (or, live, which page or
thread location per your evidence guide) to pull the fact from, and
what to record. A complete procedure leaves no check whose evidence an
executor would have to hunt for. -->

## Check execution

1. Execute checks in this order: diagnosis-grounded, scope-bounded,
   executable, test-decisive, uncertainty-honest, thread-and-convention,
   communication-usable, and deviation-recorded.
2. Use only the evidence gathered in the previous stage. Do not reward a
   plan for a section, heading, word count, or polished formatting.
3. Grade `pass` only when the pass condition is satisfied by observable
   evidence. Grade `fail` when the package contradicts the condition.
   Grade `unclear` when the deciding evidence is absent or cannot be
   verified; do not infer a favorable answer.
4. A plan may pass diagnosis and honesty while openly preserving an
   unresolved maintainer decision, provided it bounds the decision and does
   not claim certainty. A plan may not pass executability when that decision
   prevents a stranger from starting the work.
5. In live mode, report voice-guide violations separately, but use them in
   the verdict only through the rubric checks that explicitly cover them.

<!-- How one check runs against gathered evidence: in what order the
checks execute, what an executor does when evidence for a check is
genuinely absent, and when a check may be graded without re-reading
the whole package. A complete procedure makes two executors grade the
same package the same way. -->

## Verdict assembly

1. Emit one result for every check, with the check name, `pass`, `fail`, or
   `unclear`, and one line naming the fact or quote that decided it.
2. Apply the rubric's rule literally: any required `fail` or `unclear`
   produces `reject`; preferred failures never change the verdict.
3. Before the final JSON, summarize only the decisive gaps and the strongest
   supporting evidence. The final fenced JSON block must be last and must
   contain the issue URL or package id, all check results, and the binary
   verdict.

<!-- How the per-check grades become the final accept or reject:
apply your rubric's verdict rule, state how unclear grades enter it,
and say what gets quoted in the output for the deciding check. A
complete procedure produces the same verdict from the same grades,
every time. -->
