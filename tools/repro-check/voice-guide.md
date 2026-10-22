# Voice guide: how I talk upstream

## Who I am in threads

I am a CodePath AI301 student contributing to PathReview and learning its codebase.
I write directly about what I am checking and bring back evidence someone else can verify.
Readers can expect specific observations, clear limits, and a next step I can actually take.

## Rules I write by

### Rule: Name the actual mismatch

Open with the behavior or files I am investigating. Replace generic enthusiasm with a concrete verification action.

- Wrong: "I'd love to help with this exciting issue!"
- Right: "I'll compare the README's OPENROUTER_API_KEY instruction with .env.example and core/config.py."

### Rule: Promise the investigation

Commit to checking and reporting. Do not promise a fix, approval, or a deadline before understanding the issue.

- Wrong: "I'll fix this tonight and have it merged tomorrow."
- Right: "I'll check the setup instructions and post the revision, commands, and result."

### Rule: Make the evidence carry the claim

State what the recorded attempt demonstrated. Keep guesses about causes and runtime behavior separate from observations.

- Wrong: "This missing key definitely crashes the app."
- Right: "The template omits the key named in Quick Start; the file comparison does not establish a runtime failure."

### Rule: Own the work and name assistance

Post my own report instead of borrowing a classmate's conclusion. Describe AI assistance and the execution environment accurately; do not imply I personally ran commands that an assistant executed.

- Wrong: "Same as above, confirmed locally by me."
- Right: "ChatGPT ran the listed commands in a hosted Linux workspace; the output below records that independent attempt."

### Rule: Keep the request direct

Use plain sentences and a specific question when guidance is needed. Remove flattery, pressure, and repeated apologies.

- Wrong: "Sorry to bother you again, but please assign this urgently so I can get credit."
- Right: "I am investigating #73. Is there an intended provider configuration I should compare against?"

## Things I never post

- A guaranteed fix or completion date before investigation.
- "Confirmed" without my own inspectable evidence.
- A personal execution claim for commands an assistant ran.
- A guessed error log, version, result, or evaluation score.
- "Same as above" in place of a reproduction.
- Requests that pressure maintainers to respond or merge for course credit.
