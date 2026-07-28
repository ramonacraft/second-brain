# Delivery-loop brain

Once my public READMEs were loaded, I asked the research agent (and later MCP search) questions only *my* portfolio should answer.

## Example questions

1. How do TestMCP, ForgeQA, Release Gate Lab, and Live Event War Room connect?
2. What is my philosophy of QA and delivery, grounded in my profile + READMEs?
3. How would I pitch Release Gate Lab to a hiring manager in two minutes?

## What came back (public-safe summary)

### One delivery loop

- **TestMCP** — what to test (PR risk → P0–P3 plan)
- **ForgeQA** — how to test it (plain-English goal → reviewable Playwright)
- **Release Gate Lab** — lean gate + human go/no-go dashboard ([live demo](https://release-gate-lab.vercel.app/))
- **Live Event War Room** — live window ops; consumes Release Gate status as a real signal

The Gate → War Room link is wired in code; TestMCP → ForgeQA → Gate is the designed architecture across sibling repos.

### Philosophy (from my own words)

> Automate the rinse-and-repeat. Keep humans on judgment.

Also: lean trusted suites over “test theater,” human go/no-go beside automation, local-first / reviewable AI where it matters, and delivery that extends into the live window — not just the merge.

### MCP live check

From Cursor, `search` for “Release Gate” returned Release Gate Lab, War Room, profile, ForgeQA, and TestMCP — hybrid retrieval (semantic + keyword), private data excluded.

## Why this matters for the fork

Sample YouTube proves the pipeline. **My portfolio proves the point:** the same brain can hold a delivery system and answer like a teammate who read the READMEs.
