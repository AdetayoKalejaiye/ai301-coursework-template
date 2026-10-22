# Evidence guide: where proof lives in a reproduction package

## Environment

**Where it lives:** In eval mode, read the issue context and thread highlights for the affected configuration, then the candidate repro report's environment record and commands. In live mode, compare the draft with the issue's clarifications and the repository's setup and version documentation. The environment must appear in the comment itself; a local terminal log outside the draft cannot silently complete it.

**What good looks like:** Identify the tested revision or release and the platform/runtime details that affect this particular trigger. Include relevant dependencies, backend, browser, device, or options when the behavior depends on them. A reported version range can be sufficient; do not invent a missing patch-version requirement. For a documentation mismatch, a pinned revision and the inspection tools can establish the target without starting the application. Call out meaningful differences from the reporter's setup rather than silently substituting another platform or backend.

## Steps

**Where it lives:** Read the candidate repro report's starting state, setup reference, command sequence, configuration, fixture/input, and final trigger. In eval mode those are all inside the bundle. In live mode check named setup instructions in the repository, but require issue-specific inputs and deviations to be present or publicly accessible from the posted report.

**What good looks like:** Someone else can execute the attempt without inventing a file's contents, a command option, a setting, or the action that causes the observation. A small code example may be the entire reproduction. A precise reference to standard setup can suffice; "set it up and run it" cannot replace the missing trigger. A named local fixture or promised attachment is unavailable evidence unless its contents or an accessible artifact are provided. Evaluate whether the steps work, not their count or formatting.

## Behavior shown

**Where it lives:** Compare the issue description and any thread clarification with the candidate's command output, error text, logs, screenshots, relevant source/document excerpts, or explicit observed before/after values. In live mode use the excerpts and attachments actually included in or linked from the draft, rather than files the author has not shared. In eval mode a concrete artifact supplied in the bundle is inspectable evidence; do not browse a live version of its source issue.

**What good looks like:** The artifact shows what the stated trigger did, and its distinguishing details match the issue: operation, backend, platform, input shape, error location, or affected setting. The same generic exception text from a different operation does not establish the target. A crash before reaching the feature is a setup observation. For a documentation omission, quote the conflicting instruction and show the complete relevant template or a reproducible absence check; a truncated excerpt alone cannot prove the key is absent everywhere. For cannot-reproduce, show the successful or different output obtained from attempting the actual target operation. A credible attempt may fail to establish every triggering condition; explicit uncertainty about that condition narrows the conclusion rather than invalidating the attempt. Require the experiment and its output, not proof that the missing trigger was reached.

## Honesty

**Where it lives:** Read the repro report's expected result, actual result, qualifications, and final conclusion alongside the artifacts, tested environment, and issue's target. Check the claim's promises against the investigation it describes. In live mode record execution facts from the run, then include the deciding facts in the report; do not treat the author's intention as execution evidence.

**What good looks like:** The conclusion accurately says reproduced, cannot reproduce under the recorded conditions, or reached a stated limit. An evidenced cannot-reproduce attempt is useful proof and can pass. Reporting a setup limit honestly does not turn it into reproduction of an unexercised feature. A static file comparison proves a documentation disagreement, not an application crash or runtime provider support. Distinguish observations from hypotheses; never supply plausible output that was not observed.

## Comms

**Where it lives:** In eval mode, compare both candidate comments with the frozen issue context, thread highlights, and repo-facts block, including bug-report asks and AI policy. Ignore scope and personal voice files in eval mode. In live mode, first confirm the issue against scope.md, then read the issue thread, linked contribution guidance, applicable report template, any explicit AI policy, and voice-guide.md before checking the drafts.

**What good looks like:** The claim names the issue's specific symptom and the next verification action, and promises a report rather than a fix or date. The repro distinguishes expectation, observed result, and evidence without requiring a prescribed layout. Follow explicit policy asks, including required AI-assistance disclosure; check both comments where the policy applies to both. For an explicit AI-disclosure policy, look for a tool-and-extent statement or an explicit no-AI statement; do not fill missing provenance with an assumption that makes disclosure unnecessary. A human-own-words policy without a disclosure ask is different: issue-specific engagement and understanding in the candidate text can satisfy it, without a separate authorship declaration. Contrary provenance supplied in the package must still be respected. An absent AI policy does not create a disclosure requirement. Apply new-issue template instructions to new issues, and substantive relevant asks to repro comments; do not require irrelevant template sections or headings unless the repository explicitly insists on them.

In Path Review, classmates' claims and existing reproductions do not block an independent claim or report. Evaluate the author's own proof and words. Do not accept "same as above" as evidence. In live mode quote any broken personal voice rule separately; only rubric checks determine the verdict.
