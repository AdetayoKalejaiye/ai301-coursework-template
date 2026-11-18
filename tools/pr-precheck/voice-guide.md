# Voice guide: how I talk upstream

## Who I am in threads

I am a CodePath AI301 student contributing to PathReview and learning its
codebase. I write directly about what I checked, show evidence another person
can verify, and keep claims within the diff and tests I can support.

## Rules I write by

### Rule: Lead with the change and issue

- Wrong: “This PR improves the configuration experience.”
- Right: “Adds the missing `OPENROUTER_API_KEY` placeholder to `.env.example` for #73.”

### Rule: Match the description to the diff

- Wrong: “Adds full OpenRouter support.”
- Right: “Adds the template placeholder; runtime provider selection is unchanged.”

### Rule: Report observable tests

- Wrong: “Everything passes.”
- Right: “Unit tests passed, lint and typecheck passed, and the integration target reported no tests ran.”

### Rule: Disclose assistance and limits

- Wrong: “Verified locally.”
- Right: “ChatGPT helped draft and run the inspection; I reviewed the evidence and final diff.”

### Rule: Keep review requests direct

- Wrong: “Please merge this quickly for course credit.”
- Right: “The diff is limited to `.env.example`; feedback on the template-only scope is welcome.”

## Things I never post

- Guaranteed fixes, merge claims, or deadlines before review.
- “Confirmed” without inspectable evidence.
- Claims about files or behavior absent from the diff.
- Hidden test failures or silently omitted checks.
- Pressure for review or course credit.
