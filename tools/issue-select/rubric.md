# Rubric: is this a good first issue?

## Checks

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| Maintainer is alive | The repo-facts block: look at the last 5 default-branch commit dates | At least one commit within the last 90 days | required |
| Repo is active | The repo-facts block: count of open issues and PRs, and the last merged PR date | At least 1 PR merged within the last 60 days | required |
| Issue is unassigned | The issue's "Assignees" field in the issue metadata | Assignees field is empty — no one is listed | required |
| Issue is open | The issue's "State" field in the issue metadata | State is open | required |
| Scope fits a newcomer | The issue body: read the description and any linked files or code | The issue describes a single concrete task — not a megaissue that is just a list of sub-issues or a coordination thread; documentation tasks, bug fixes with identified causes, and clearly scoped feature additions all pass | required |
| Sufficient context | The issue body and comment thread | The issue body has at least 1 sentence describing the problem or desired change; a vague title alone is not enough | required |
| Not a duplicate | The issue body and comment thread: look for any comment linking to another issue, or a "duplicate of #X" label | No maintainer comment or label marking this as a duplicate | required |
| No blocking comment | The comment thread: look for any maintainer comment saying the issue is blocked, being redesigned, deprioritized, or is a wont-fix | No maintainer comment marking the issue as blocked, wont-fix, under redesign, or deprioritized | required |
| Not already claimed | The comment thread: look for a contributor explicitly saying "I'll work on this" or "I'm working on this", or a linked open PR that directly addresses this issue; a living coordination issue with 5 or more linked PRs already merged counts as saturated and should be rejected | No contributor has explicitly claimed the issue, no open PR directly addresses it, and the issue has fewer than 5 merged linked PRs | required |
| Not a zombie issue | The issue body and comment thread: look at the issue's age, number of failed claim attempts (claimed then auto-unassigned), and number of closed PRs without resolution | The issue is either less than 2 years old, or has fewer than 3 failed claim attempts and fewer than 2 closed PRs without resolution | required |
| Has a response from maintainer | The comment thread: look for any comment from a repo owner or collaborator | At least one maintainer comment anywhere in the thread | preferred |
| Has a good-first-issue or help-wanted label | The issue's labels field in the issue metadata | At least one of the labels: `good first issue`, `help wanted`, `beginner`, `starter` | preferred |
| Issue body is clear and specific | The issue body: read the title and description | Title is not vague (e.g. not just "bug" or "fix"), and the description has at least 2 sentences explaining the problem | preferred |

## Verdict rule

Accept if every required check passes. Preferred checks never change the verdict — they are used only to rank accepted issues against each other (more preferred checks passing = better fit). If any required check result is unclear, treat it as fail and reject the issue.