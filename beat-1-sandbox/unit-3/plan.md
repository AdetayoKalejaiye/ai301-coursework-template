# Plan for #73

## Diagnosis

The setup guidance and the environment template disagree about the key a new user is told to configure. At commit `f89c06fc3ff292df2a04a39ac51319d32a76b779`, `README.md` and `docs/SETUP.md` name `OPENROUTER_API_KEY`, while the complete `.env.example` has no occurrence of that variable and lists only `mock` and `openai` in its provider comment. `core/config.py` declares `openrouter_api_key`, `openrouter_base_url`, and `openrouter_model`. Copying `.env.example` to `.env` therefore leaves no template entry for the key named by the setup instructions. The reproduction establishes a documentation/template mismatch; it does not establish a runtime provider-selection failure.

## Scope

In scope:

- Add one `OPENROUTER_API_KEY=sk-or-your-key-here` placeholder to the LLM provider block in `.env.example`, next to the existing `OPENAI_API_KEY` placeholder.

Out of scope:

- `README.md` and `docs/SETUP.md` wording.
- The `LLM_PROVIDER` default or its `Options:` comment.
- `core/config.py`, provider selection, OpenRouter base URL/model behavior, Docker services, and unrelated cleanup.

The change is limited to `.env.example` because the missing template entry is the smallest change that makes the documented copy step provide a place for the named key.

## Files and approach

1. Start from `main` at `f89c06fc3ff292df2a04a39ac51319d32a76b779`.
2. Work on branch `fix/73-env-example-openrouter-key` in the PathReview fork.
3. Edit only `.env.example` and add the placeholder under `OPENAI_API_KEY`.
4. Review the diff and confirm no plan files are included in the branch commit.

## Test plan

Before the edit, rerun the Unit 2 observation from a clean checkout:

```bash
cp .env.example .env
cmp .env.example .env
python3 -c "from pathlib import Path; print(Path('.env').read_text().count('OPENROUTER_API_KEY'))"
```

Expected before: `cmp` is silent and the count is `0`.

After the edit, rerun the same commands and inspect the template:

```bash
grep -n -E 'LLM_PROVIDER|OPENAI_API_KEY|OPENROUTER_API_KEY' .env.example
git diff --check
git diff --stat
```

Expected after: the copied file is identical, the count is `1`, the new key appears in the LLM block, `git diff --check` is silent, and the diff reports only `.env.example`. I will not claim that OpenRouter runtime selection works because the reproduction found no code path that reads `llm_provider`.

## Risks and unknowns

The placeholder makes the key discoverable in the supplied template but does not decide whether `openrouter` should be an allowed `LLM_PROVIDER` value; the repository evidence does not establish that behavior. A maintainer may prefer retargeting the docs instead of changing the template, or may want additional OpenRouter fields documented. If that guidance changes, I will update the plan before expanding the scope.

## Deviations

Nothing changed between this plan and the built change; the plan held.
