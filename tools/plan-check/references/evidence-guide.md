# Evidence guide: where evidence lives in a plan package

<!--
THIS IS THE PART YOU WRITE (second week running: the judgment files
stay in your hands). The skill uses this guide as its map: for every
kind of evidence a rubric check names, this file says WHERE to find it
in a plan package and WHAT GOOD LOOKS LIKE when you do.

Under each family heading below, write:

- Where it lives: the exact places to look. In an eval bundle (which
  section of the package: the issue context, the repro-evidence block,
  the candidate plan's scope statement or test plan, the plan comment,
  the repo-facts block). In live mode (where on GitHub or in the
  draft: the issue thread, the student's posted repro comment, the
  repo's docs, the draft plan and comment).
- What good looks like: one or two sentences someone else could apply.
  Prefer observable conditions ("the stated cause cites behavior the
  repro evidence actually shows") over adjectives ("diagnosis is
  solid").

A rubric check whose evidence this guide cannot locate is a check
nobody else can execute, and this week that cuts twice: your
procedure.md tells the skill WHEN to gather each family, and this
guide tells it WHERE. Write the map you wish your executor had.
-->

## Diagnosis and grounding

**Where it lives:** In an eval bundle, read the issue context and
repro-evidence block, then the candidate plan's diagnosis, diagnosis
evidence, and proposed change. In live mode, read the issue page and the
student's posted reproduction comment before reading `plan.md`.

**What good looks like:** The proposed change explains the observed
behavior in the reproduction evidence and targets the cause or clearly
labels the causal question as unresolved. A plan that changes a nearby
symptom while ignoring the decisive reproduced condition is not grounded.

<!-- Where the plan states its cause, and where the repro evidence
pins down the behavior that cause must explain. What it means for a
diagnosis to follow from the evidence rather than contradict or
ignore it. -->

## Scope

**Where it lives:** The plan's in-scope and out-of-scope statements, named
files/areas, and approach. In live mode also compare the plan comment with
the issue thread's requested scope and maintainer guidance.

**What good looks like:** The work can be described as a bounded change with
named files and explicit exclusions. Drive-by cleanup, speculative API
redesign, and "fix anything related" language are evidence of scope creep.

<!-- Where the plan bounds itself: the in-scope statement, the
not-in-scope line, the files or areas named. What one bounded change
looks like next to a drive-by rewrite. -->

## Executability

**Where it lives:** The plan's starting revision, files, ordered approach,
commands or inputs, and decisions that must be made before editing. In live
mode, verify paths and branch conventions against the repo facts and scope.

**What good looks like:** Another contributor can begin from the stated
checkout and follow the plan without asking for a missing file, command,
fixture, option, or prerequisite decision.

<!-- Where the plan says what will actually be done: files or areas,
approach, order of work. What it means for a stranger to be able to
start executing without asking the author anything. -->

## Test plan

**Where it lives:** The plan's test section read against the reproduction
evidence's commands, inputs, expected behavior, actual behavior, and
artifacts. Look for both the before observation and the post-change check.

**What good looks like:** Each test exercises the issue's distinguishing
condition and names observable output that separates success from failure.
Generic claims such as "run unit tests" do not establish the fix.

<!-- Where the plan says how success will be observed, and how that
maps onto the repro evidence's steps and artifacts. What a decisive
test plan names that a vague one does not. -->

## Honesty

**Where it lives:** The plan's risks, unknowns, assumptions, expected
outcomes, and `## Deviations` section; in live mode also compare them with
the reproduction comment and posted plan comment.

**What good looks like:** The author separates observed facts from guesses,
records limitations, and updates deviations after the build. A bounded
unknown is honest; an unsupported guarantee is not.

<!-- Where claims meet uncertainty: risks, unknowns, and deviations.
How to tell stated unknowns from false confidence, and where an
honest mid-build deviation gets recorded. -->

## Comms

**Where it lives:** The candidate plan comment, issue title/body and thread
highlights, the reproduction comment, and the repo-facts block's templates,
contribution guidance, and AI-use policy. In live mode use the actual issue
thread and repository docs; in eval mode use only the frozen bundle.

**What good looks like:** The comment is independently written for this
issue, states diagnosis/scope/approach/test/unknowns, responds to relevant
maintainer signals, and meets any explicit disclosure rule. It never says
"same as above" or pressures maintainers for course credit.

<!-- Where the words meet the thread and the repo: the plan comment
read against the issue's maintainer signals (thread highlights, or
the live thread) and against the repo-facts block's stated templates,
contributing asks, and contribution policy (including AI-use
disclosure requirements). What thread-aware looks like next to
boilerplate. -->
