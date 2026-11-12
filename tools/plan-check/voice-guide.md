# Voice guide: how I talk upstream

<!--
THIS IS A CARRY-OVER SLOT, not a new hole. You wrote this guide in
week 2; paste your filled week-2 voice-guide.md here, whole. It is not
re-authored and it is not graded as new work this week.

Then reread it with the plan comment in mind. Your claim and repro
comments promised and reported; a plan comment commits you to an
approach in front of the people who maintain the code. If your rules
do not cover that register (for example: how you state an approach you
are not certain of, or how you respond when a maintainer already
suggested a direction), extend the guide with what it needs. Extending
is allowed and encouraged; starting over is not required.

Live mode reads this file before your plan comment goes out and
reports any rule your draft breaks. Eval mode ignores it entirely,
because your voice is yours and carries no gold labels.
-->

## Who I am in threads

I am a CodePath AI301 student contributing to PathReview and learning its codebase.
I write directly about what I am checking and bring back evidence someone else can verify.
Readers can expect specific observations, clear limits, and a next step I can actually take.

## Rules I write by

### Rule: Name the actual mismatch

Open with the behavior or files I am investigating. Replace generic enthusiasm with a concrete verification action.

- Wrong: "I'd love to help with this exciting issue!"
- Right: "I'll compare the README's OPENROUTER_API_KEY instruction with .env.example and core/config.py."

### Rule: Promise the investigation, not the fix

Commit to checking and reporting. Do not promise a fix, approval, or deadline before understanding the issue.

- Wrong: "I'll fix this tonight and have it merged tomorrow."
- Right: "I'll test the smallest template change and report the before-and-after output."

### Rule: Make the evidence carry the diagnosis

State what the recorded attempt demonstrated. Keep guesses about causes and runtime behavior separate from observations.

- Wrong: "This missing key definitely crashes the app."
- Right: "The template omits the key named in Quick Start; the file comparison does not establish a runtime failure."

### Rule: State bounded scope and a decisive test

Name what will change, what will stay untouched, and how a maintainer can tell the change worked.

- Wrong: "I'll clean up the configuration and make providers consistent."
- Right: "I'll edit only the LLM block in .env.example, leave the provider-selection comment unchanged, and rerun the copy-and-grep check."

### Rule: Own the work and name assistance

Post my own plan instead of borrowing a classmate's conclusion. Describe AI assistance and the execution environment accurately; do not imply I personally ran commands an assistant executed.

- Wrong: "Same as above, confirmed locally by me."
- Right: "ChatGPT ran the listed inspection in a hosted Linux workspace; I reviewed the evidence and will rerun the check against the branch."

### Rule: Keep the request direct

Use plain sentences and a specific question when guidance is needed. Remove flattery, pressure, and repeated apologies.

- Wrong: "Sorry to bother you again, but please assign this urgently so I can get credit."
- Right: "The evidence points at the template. If maintainers prefer the docs to change instead, I can retarget the plan."

### Rule: Keep the plan comment aligned with the plan

The posted comment names the same files, scope, approach, and test as `plan.md`; if the build changes, I record the deviation before describing the new result.

## Things I never post

- A guaranteed fix, merge, or completion date before the build.
- "Confirmed" without inspectable evidence.
- A personal execution claim for commands an assistant ran.
- A guessed error log, version, result, or evaluation score.
- "Same as above" in place of an independent plan.
- Requests that pressure maintainers to respond or merge for course credit.
- A scope statement that quietly includes unrelated cleanup.
