# Compiled wiki (Lab 5)

After loading public notes, I ran the wiki compiler (`oracle/agent/wiki.py`). It proposed topics, synthesized pages, and stored citations back to my posts.

**Result:** **10** topic pages over **5** public notes.

## Topics

- Developer Tooling & Automation
- ForgeQA
- Live Event Operations & Incident Response
- Live Event War Room
- Project Documentation & READMEs
- Quality Assurance & Testing
- Ramona Bonitatis — Creator Profile
- Release Gate Lab
- Release Management & Deployment Gates
- TestMCP

## Sample: Quality Assurance & Testing (excerpt)

> Quality Assurance & Testing, in this creator's work, centers on making testing *meaningful* rather than ceremonial. As they put it, "Large test suites that nobody reviews become theater" — and their portfolio labs aim to show the opposite.
>
> Themes: predict, don't just execute · tests must be reviewed to matter · QA is part of the release pipeline.

**Cited:** GitHub Profile · ForgeQA · Release Gate Lab · TestMCP

## Sample: Release Management & Deployment Gates (excerpt)

> This creator's approach to release management centers on gating deployments behind automated quality signals combined with human sign-off. The flagship expression is Release Gate Lab — a Release Gate dashboard paired with a lean Azure Pipeline that only deploys to Vercel when a small Playwright smoke suite passes.
>
> Release gate outcomes flow into Live Event War Room as a live board signal.

**Cited:** Release Gate Lab · Live Event War Room

## Small fix upstream-friendly

Topic proposal originally sampled only `youtube` / `notion` titles. My notes used the markdown loader (`obsidian` platform), so I widened proposal to all `visibility=content` posts except `kind=reference` — same rule the refresh path already uses for what can reshape the wiki.

## How to re-check locally

```bash
# list topics via MCP (Cursor) or:
cd oracle/agent && ../../.venv/bin/python demo_wiki.py
```
