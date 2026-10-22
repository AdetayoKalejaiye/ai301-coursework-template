# Unit 2 — Claim and Reproduce

## Your identity upstream

**GitHub username**

AdetayoKalejaiye

## Upstream comments

**Claim comment**

I'm investigating #73: Quick Start names `OPENROUTER_API_KEY`, while the issue describes an `.env.example` that omits it and lists only `mock` and `openai` for `LLM_PROVIDER`.

I'll compare `README.md`, `.env.example`, and `core/config.py` at a recorded revision, follow the environment-template copy step, and post the inspection commands, output, and result. The investigation will use ChatGPT assistance in a hosted Linux workspace.

**Reproduction comment**

## Result

Reproduced the documentation mismatch in #73 at `f89c06fc3ff292df2a04a39ac51319d32a76b779`: the setup instructions name `OPENROUTER_API_KEY`, but the template copied into `.env` contains no occurrence of that variable and lists only `mock` and `openai` in its provider comment.

## Environment

- Repository: `codepath/pathreview-ai301-fa26-s1`, pinned to commit `f89c06fc3ff292df2a04a39ac51319d32a76b779` from `main`.
- OS: Ubuntu 24.04.3 LTS, x86_64, Linux kernel 6.18.55.
- Tools: Git 2.51.1, Bash 5.2.21, Python 3.12.14.
- Method: static file inspection and the environment-template copy step from `README.md` and `docs/SETUP.md`. The working tree was clean before and after the inspection; `.env` is ignored.

ChatGPT executed the commands below in a hosted Linux workspace while preparing this report. This attempt used a fresh checkout of the Section 1 repository.

## Steps and observed output

1. Clone the repository and pin the inspected code state:

```bash
git clone https://github.com/codepath/pathreview-ai301-fa26-s1.git pathreview-repro
cd pathreview-repro
git checkout f89c06fc3ff292df2a04a39ac51319d32a76b779
git rev-parse HEAD
git status --short
```

The inspected checkout reported:

```text
f89c06fc3ff292df2a04a39ac51319d32a76b779
```

`git status --short` produced no output.

2. Locate the key required by the setup instructions:

```bash
git grep -n OPENROUTER_API_KEY HEAD -- README.md docs/SETUP.md
```

```text
HEAD:README.md:24:# Configure environment (add your OPENROUTER_API_KEY to .env)
HEAD:docs/SETUP.md:47:# Edit .env and set your OPENROUTER_API_KEY (required for AI features)
```

3. Follow the documented copy step, verify the copied file is identical, and count occurrences of the named key:

```bash
cp .env.example .env
cmp .env.example .env
python3 -c "from pathlib import Path; print('OPENROUTER_API_KEY occurrences in copied .env:', Path('.env').read_text().count('OPENROUTER_API_KEY'))"
```

`cmp` exited with status 0 and no output. The count command printed:

```text
OPENROUTER_API_KEY occurrences in copied .env: 0
```

4. Inspect the full tracked template:

```bash
git show HEAD:.env.example
```

Complete output, with no omitted lines:

```dotenv
# =============================================================================
# PathReview — Environment Variables
# =============================================================================
# Copy this file to .env and fill in the values.
#   cp .env.example .env

# Database
DATABASE_URL=postgresql+asyncpg://pathreview:pathreview@localhost:5433/pathreview_dev

# Redis
REDIS_URL=redis://localhost:6379/0

# Vector store (ChromaDB)
VECTOR_DB_URL=http://localhost:8001

# LLM provider
# Options: "mock" (default, no API key needed), "openai"
LLM_PROVIDER=mock
OPENAI_API_KEY=sk-your-key-here

# App settings
APP_ENV=development
SECRET_KEY=dev-secret-key-change-in-production
LOG_LEVEL=INFO

# GitHub API (optional — only needed for testing GitHub analysis tools with real repos)
GITHUB_TOKEN=ghp_your-token-here
```

These are the repository's example values.

5. Compare the configuration fields:

```bash
git grep -n -E 'llm_provider|openai_api_key|openrouter_' HEAD -- core/config.py
```

```text
HEAD:core/config.py:18:    llm_provider: str = Field(default="mock")
HEAD:core/config.py:19:    openai_api_key: str = Field(default="")
HEAD:core/config.py:20:    openrouter_api_key: str = Field(default="")
HEAD:core/config.py:21:    openrouter_base_url: str = Field(default="https://openrouter.ai/api/v1")
HEAD:core/config.py:22:    openrouter_model: str = Field(default="google/gemma-3-27b-it:free")
```

## Expected and actual behavior

Expected: the setup instructions and environment template give consistent guidance about the API key and provider configuration. A key the reader is told to set should be represented or explained in the supplied template.

Actual: the instructions name `OPENROUTER_API_KEY`, while the copied template omits that variable and its provider comment lists only `mock` and `openai`. `core/config.py` declares the corresponding OpenRouter settings.

The copy-and-inspection attempt establishes the documentation discrepancy. It does not establish runtime provider support, an application crash, or a need for an API key when using the default mock provider.

## Eval iterations

**Run history**

Independent rubric review with ChatGPT/Codex, in order:

1. The four unscored calibration packages matched all four instructor labels using the initial rubric.
2. A blind review of all 20 scored packages matched 17/20. All five categories had at least one match. The disagreements were pkg-03, pkg-05, and pkg-09.
3. The target and conventions checks were revised. A focused recheck of pkg-03, pkg-09, pkg-20, and pkg-08 matched 4/4. The disclosure canary pkg-20 remained reject, and the adjacent-error canary pkg-08 remained reject. This was a partial review, not another full 20-package run.

**Package analysis**

pkg-09: the initial rubric decided reject; the instructor gold label is accept. The revised target check decided accept in the focused recheck.

The original rule treated the unestablished unequal-flush condition as a wrong target. The package actually attempts the second scenario's command-size experiment, records marker output, states its 2 MiB ARG_MAX and uniform filename lengths, and explains that padding might not force the second command to flush first. It explicitly says it could not reproduce the ordering fault. That evidence supports a limited cannot-reproduce report; it does not claim that the bug is absent or that the required triggering condition was definitely reached.

**Check rationale**

> | issue-target-matched | Issue body and thread clarifications compared with the trigger, input, and artifacts in the repro report; Behavior shown in the evidence guide | The attempt exercises the behavior and distinguishing conditions described by the issue. Evidence claimed as reproduction shows that behavior, rather than an adjacent error or an earlier setup failure. A cannot-reproduce attempt passes when it attempts the described operation, shows its result, and discloses relevant unmet or uncertain trigger conditions. It need not prove that those conditions were achieved. An unrelated failure or setup failure before the target operation does not pass. | required |

The initial version required a cannot-reproduce attempt to establish the issue's distinguishing trigger. In the first independent review, that rejected pkg-09 even though it supplied an actual marker-order experiment, the observed output, and an explicit explanation that its padding might not create unequal command-size thresholds. I revised the check to distinguish an honest failed attempt at the target operation from a claimed reproduction of an adjacent error. The report still has to reach the relevant operation and show its result; a setup failure cannot stand in for that evidence.

**Trade-offs**

Allowing disclosed uncertainty in a cannot-reproduce attempt can admit a report that did not stress the trigger enough to expose the bug. That is useful when the report shows the actual attempt and states the limitation: another contributor can refine the experiment instead of being told the bug was disproved. The rule still rejects a claimed reproduction whose artifact shows a different failure. The conventions check separately distinguishes an explicit disclosure obligation from a human-own-words policy that never asks for an authorship declaration.

The focused recheck retained the required disclosure rejection for pkg-20 and the wrong-target rejection for pkg-08; both matched their instructor labels after the loosening.
