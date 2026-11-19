# Contribution: README and .env.example disagree about which LLM API key to set

**Contribution Number:** 1  
**Student:** Adetayo Kalejaiye  
**GitHub Username:** AdetayoKalejaiye  
**Issue:** https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73  
**Pull Request:** Not opened. The connected GitHub account has pull access to the upstream repository, but no writable fork is connected.

## Toolkit

**Unit 5: I built an issue scout that ranks concrete Path Review issues**

I configured the scout to search open, unassigned Path Review issues with newcomer labels and rank the fewest-comment results first. The intended result was a short list of small documentation, configuration, and Python fixes. The scan could not be verified because the GitHub CLI and Claude CLI were not authenticated, so I treated the issue selection run as unverified and relied on the earlier rubric-backed selection record instead.

**Unit 6: I added a voice guard and repository memory**

I moved my upstream writing rules into a shared voice guide and wrote repository memory for Path Review, including the issue files, setup commands, and the rule to report observations without promising a fix. The guard stopped when the Claude CLI was not logged in. I kept that failure in the log and changed my process to check authentication before running a tool.

**Unit 7: I used a ship gate to check the proposed change**

I used the PR precheck as a ship gate and recorded a 20-package benchmark with 20/20 agreement. For the real change, the gate manifest checked that only .env.example changed, the reproduction count moved from zero to one, and no runtime behavior was claimed without a runtime test. The missing writable fork prevented the gate from being attached to a live pull request.

**Unit 8: I prepared a PR monitoring playbook**

I prepared a manual PR-monitoring sequence for the next step: read the maintainer response, classify each comment as documentation, test, or scope feedback, make the smallest requested change, rerun the before and after checks, and update the story. There was no live PR for the monitor to read because the connected account could not push to a fork, so the playbook produced no fabricated status or review result.

## Why I Chose This Issue

I chose [issue #73](https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73) because the Unit 1 rubric marked it as an accepted newcomer issue. It is open, unassigned at selection time, labeled bug, docs, good first issue, and tier-1, and it names the two files that disagree. The issue is a small documentation and configuration task, which matches my fit profile better than a broad feature or an unfamiliar architectural change.

The scout's intended ranking favored recent open issues with few comments, no assignee, and a good-first-issue or tier-1 label. Because the authenticated scan never produced a verifiable readout, I did not claim that a live scan had independently accepted #73. My rubric-backed selection record accepted it because the issue body is specific and the affected files are clear. My claim comment is [issuecomment-6394260171](https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73#issuecomment-6394260171). The scout's main shortcoming was environment dependence. I would add an upfront `gh auth status` and Claude login check before any scan that costs credits.

**Toolkit**

- Tool: issue-scout with a fit profile, open-issue search filters, and the Unit 1 selection rubric.
- What it produced: a strategy for open Path Review issues using unassigned status, newcomer labels, recent activity, and fewest comments first; the rubric record for #73 was accepted.
- Difficulties: the GitHub and Claude authentication state was not verified, so the scan output was not reliable evidence.
- What changed: I kept the authenticated selection record separate from the unverified scan and added an authentication check to my future workflow.

## Understanding the Issue

**Problem Description**

The Quick Start tells a new contributor to add `OPENROUTER_API_KEY` to `.env`, but the supplied `.env.example` does not include that variable. Its provider comment lists only `mock` and `openai`, while the configuration model defines OpenRouter settings too.

**Expected Behavior**

The README, setup guide, and environment template should give consistent provider and API-key instructions. A reader who copies `.env.example` should see the key named by the setup instructions, or the documentation should clearly explain why it is not needed.

**Current Behavior**

At commit `f89c06fc3ff292df2a04a39ac51319d32a76b779`, copying `.env.example` to `.env` produced zero occurrences of `OPENROUTER_API_KEY`. The README and `docs/SETUP.md` named that key, but the template listed only `mock` and `openai` and provided only an `OPENAI_API_KEY` placeholder.

**Affected Components**

The directly affected files are `README.md`, `docs/SETUP.md`, and `.env.example`. I also inspected `core/config.py`, where `openrouter_api_key`, `openrouter_base_url`, and `openrouter_model` are defined.

**Toolkit**

- Tool: static source inspection with Git, `git grep`, and the repository issue thread.
- What it produced: a bounded explanation of the mismatch and the exact files and revision involved.
- Difficulties: the issue does not by itself establish which provider values the application accepts at runtime.
- What changed: I limited the proposed change to the environment template and did not claim a runtime crash or provider support that I had not tested.

## Reproduction Process

**Environment Setup**

I used a fresh checkout of `codepath/pathreview-ai301-fa26-s1` on Ubuntu 24.04.3 LTS, x86_64, with Linux kernel 6.18.55, Git 2.51.1, Bash 5.2.21, and Python 3.12.14. I checked out commit `f89c06fc3ff292df2a04a39ac51319d32a76b779` from `main`. No Docker services or API calls were needed because this is a documentation mismatch. The working tree stayed clean and `.env` is ignored.

**Steps to Reproduce**

1. Clone the repository and check out `f89c06fc3ff292df2a04a39ac51319d32a76b779`.
2. Run `git grep -n OPENROUTER_API_KEY HEAD -- README.md docs/SETUP.md` and record the setup instructions.
3. Run `cp .env.example .env`, then `cmp .env.example .env` and count the key with Python.
4. Run `git show HEAD:.env.example` and `git grep -n -E 'llm_provider|openai_api_key|openrouter_' HEAD -- core/config.py`.
5. Observed result: the copied file contains zero occurrences of `OPENROUTER_API_KEY`, while the setup files name it and the configuration source defines its fields.

**Reproduction Evidence**

- **Commit showing reproduction:** https://github.com/codepath/pathreview-ai301-fa26-s1/commit/f89c06fc3ff292df2a04a39ac51319d32a76b779
- **Screenshots/logs:** The complete commands and outputs are in [my reproduction comment](https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73#issuecomment-6394266531).
- **My findings:** `cmp` returned success because `.env` is an exact copy of the incomplete template. The count command printed `OPENROUTER_API_KEY occurrences in copied .env: 0`. This proves inconsistent setup guidance, not an application crash.

**Toolkit**

- Tool: Git, Bash, Python, and the repro-check rubric.
- What it produced: a pinned, repeatable file comparison with the key count and complete template excerpt.
- Difficulties: the application was not started, so runtime provider behavior was outside the evidence.
- What changed: I stated the limit directly in the report and kept the claim focused on documentation consistency.

## Solution Approach

**Analysis**

The issue is caused by the template lagging behind the setup instructions and configuration model. `README.md` and `docs/SETUP.md` name OpenRouter, and `core/config.py` has OpenRouter fields, but `.env.example` gives a new checkout no OpenRouter placeholder.

**Proposed Solution**

Add `OPENROUTER_API_KEY=sk-or-your-key-here` to `.env.example` beside the existing OpenAI placeholder. Keep the README, setup guide, configuration model, default mock provider, and unrelated application code unchanged. This keeps the change small and directly addresses the missing setup value.

**Implementation Plan**

1. Add the OpenRouter placeholder to `.env.example`.
2. Copy the updated template to `.env` and verify the key count changes from zero to one.
3. Confirm `git diff --stat` contains only `.env.example` and rerun the static comparison.
4. Open a pull request from a writable fork and attach the issue and reproduction links when GitHub access is available.

The implementation was made locally in commit `d34cf80`, but that commit is not published in a fork, so I am not presenting it as an upstream PR.

**Toolkit**

- Tool: local Git branch, the plan-check rubric, and the issue's file list.
- What it produced: a one-line `.env.example` patch and a scoped implementation plan.
- Difficulties: the connected GitHub account has pull access only, so I could not publish the branch.
- What changed: I kept the patch local and recorded the access limitation instead of inventing a PR URL.

## Testing Strategy

The before check was `OPENROUTER_API_KEY occurrences in copied .env: 0`. After adding the placeholder, the same check printed `1`. `cmp .env.example .env` returned success after copying the updated template, and `git diff --stat` showed only `.env.example | 1 +`. Because the change is documentation-only, I did not claim that the application or an external provider had been tested. A future PR should rerun these checks from a clean checkout and run the repository's documentation or configuration checks if the maintainer requests them.

**Toolkit**

- Tool: Bash, Python, `cmp`, and the PR precheck gate.
- What it produced: observable before and after counts, a clean copy comparison, and a one-file diff check.
- Difficulties: no live PR branch was available for CI or maintainer review.
- What changed: I made the static checks the minimum ship gate and left runtime testing out of scope.

## Implementation Notes

**2026-10-21**

Built the repro-check skill, recorded the issue claim and reproduction, and pinned the evidence to commit `f89c06f`.

**2026-11-11**

Created the local documentation patch in `.env.example`. The before count was zero, the after count was one, and the diff stayed to one file. I stopped before publishing because the upstream repository did not grant push access.

**2026-11-18**

Ran the PR precheck benchmark and recorded 20/20 agreement. The gate confirmed the intended scope, but it could not replace a real PR review.

**2026-11-19**

Filled the contribution story with the issue links, reproduction evidence, implementation limits, tool timeline, and the missing environment-authentication lesson.

**Toolkit**

- Tool: Git history, local test evidence, and the course's precheck benchmark.
- What it produced: dated decisions and a trace from reproduction to the local patch.
- Difficulties: the real branch and PR could not be connected to the upstream repository.
- What changed: I recorded the access block as a decision point instead of leaving an unexplained gap.

## Pull Request

**PR Link:** No PR opened. The upstream repository reports pull access and no push access for the connected account, and no user fork is available to use as the head repository.

**PR Description:** The intended PR would add `OPENROUTER_API_KEY=sk-or-your-key-here` to `.env.example`, link issue #73, and include the before and after key-count checks. It would not change application code, provider defaults, or the setup prose.

**Maintainer Feedback:**

- 2026-11-19: No maintainer feedback on a PR because no PR was opened.
- 2026-11-19: The issue thread already confirms the mismatch through multiple independent reproductions. I kept my own evidence separate and did not treat another contributor's report as my execution proof.

**Status:** Blocked before opening by repository write access. The local patch is ready to publish from a writable fork.

**Toolkit**

- Tool: GitHub connector, local Git branch, and the PR precheck.
- What it produced: issue comments, a local one-file patch, and a ready-to-use PR description.
- Difficulties: no fork or writable head branch was connected, so the monitor and PR workflow stopped before publication.
- What changed: I added repository authentication and fork availability to my preflight checklist.

## Learnings and Reflections

**Technical Skills Gained**

I learned to reproduce a documentation mismatch without overclaiming runtime behavior, pin evidence to a commit, compare a copied environment file, and use a one-file diff as a scope check. I also learned how a rubric can distinguish a real artifact from a confident assertion.

**Challenges Overcome**

The most important challenge was separating verified work from unavailable tool output. The scan and voice guard both depended on authentication, and the upstream repository was read-only through the connected account. I kept the failed checks visible, used the issue rubric and direct file evidence, and recorded exactly where the workflow stopped.

**What I'd Do Differently Next Time**

I would run `gh auth status` and a Claude login check before starting a scan or guard. I would also confirm that a writable fork exists before claiming an issue, so the reproduction, patch, and pull request can follow one continuous path. Finally, I would use one spelling consistently: Path Review.

## Resources Used

- [Path Review issue #73](https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73)
- [Path Review README](https://github.com/codepath/pathreview-ai301-fa26-s1/blob/main/README.md)
- [Path Review setup guide](https://github.com/codepath/pathreview-ai301-fa26-s1/blob/main/docs/SETUP.md)
- [Reproduction comment](https://github.com/codepath/pathreview-ai301-fa26-s1/issues/73#issuecomment-6394266531)
- [Course repository](https://github.com/AdetayoKalejaiye/ai301-coursework-template)
