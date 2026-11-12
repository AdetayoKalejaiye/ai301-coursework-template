# Unit 3 — Plan and Build

## Posted upstream

**GitHub username**

AdetayoKalejaiye

**Plan comment**


I’m planning a focused change for #73 based on the reproduction at `f89c06f`.

**Diagnosis:** `README.md:24` and `docs/SETUP.md:47` tell a new setup to provide `OPENROUTER_API_KEY`, but the complete `.env.example` copied by that setup has no occurrence of the key and lists only `mock` and `openai`. `core/config.py` declares the corresponding OpenRouter field. This establishes a documentation/template mismatch, not a runtime provider-selection failure.

**Scope:** I will add one `OPENROUTER_API_KEY=sk-or-your-key-here` placeholder under the existing `OPENAI_API_KEY` line in `.env.example`. I will not change the README, setup guide, `LLM_PROVIDER` options comment, `core/config.py`, provider selection, or unrelated files.

**Approach:** I’ll make the one-file edit on `fix/73-env-example-openrouter-key`, review the diff, and keep the plan files out of the branch commit.

**Test:** I’ll rerun the documented `cp .env.example .env` step, verify the copy with `cmp`, count the key in the copied file, and inspect the LLM block. Before the edit the count is expected to be `0`; after it should be `1`, with `git diff --check` clean and only `.env.example` changed.

**Unknown:** The evidence does not show that `llm_provider` is used for runtime selection, so I am not adding `openrouter` to the options comment or claiming end-to-end provider support. If maintainers prefer aligning the docs instead, I can retarget the plan before expanding the change.

AI disclosure: ChatGPT helped draft this plan and ran the listed inspection in a hosted Linux workspace; I reviewed the evidence and will review the branch diff.

## Your branch

**Branch**

fix/73-env-example-openrouter-key

**Evidence**

Before the edit, from the base commit:

```text
$ git show HEAD:.env.example | grep -n -E 'LLM_PROVIDER|OPENAI_API_KEY|OPENROUTER_API_KEY'
18:LLM_PROVIDER=mock
19:OPENAI_API_KEY=sk-your-key-here
$ cp .env.example .env
$ cmp .env.example .env
$ python3 -c "from pathlib import Path; print('OPENROUTER_API_KEY occurrences in copied .env:', Path('.env').read_text().count('OPENROUTER_API_KEY'))"
OPENROUTER_API_KEY occurrences in copied .env: 0
```

After the edit on `fix/73-env-example-openrouter-key`:

```text
$ grep -n -E 'LLM_PROVIDER|OPENAI_API_KEY|OPENROUTER_API_KEY' .env.example
18:LLM_PROVIDER=mock
19:OPENAI_API_KEY=sk-your-key-here
20:OPENROUTER_API_KEY=sk-or-your-key-here
$ cp .env.example .env
$ cmp .env.example .env
$ python3 -c "from pathlib import Path; print('OPENROUTER_API_KEY occurrences in copied .env:', Path('.env').read_text().count('OPENROUTER_API_KEY'))"
OPENROUTER_API_KEY occurrences in copied .env: 1
$ git diff --check
$ git diff --stat
 .env.example | 1 +
 1 file changed, 1 insertion(+)
```

## Eval iterations

**Run history**



**Package analysis**



**Check rationale**

> The test plan reruns the relevant pre-fix observation and names a concrete post-change command or artifact whose output distinguishes success from failure. It does not rely only on "tests pass" or a future review.

I chose this wording to reject vague test plans while allowing a concise plan whose direct reproduction has a clear before-and-after signal.

**Trade-offs**

The `test-decisive` check may hold a valid documentation-only plan when it names no observable verification; that is intentional because a maintainer still needs a concrete way to tell whether the reported inconsistency was removed. The `scope-bounded` check also rejects broad refactors even when they could solve the issue, because the course asks for a change another contributor can review against the reproduction.
