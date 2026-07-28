---
name: writing-a-blog-post
description: Use when starting a new post for this blog (wireframe.github.com) — from a raw idea through outline, research, drafting, and a final read before running bin/promote.
---

# Writing a Blog Post

## Overview
Four-phase workflow for turning an idea into a published post: align on the outline and intent, research each section (Roam + public), draft section by section, then review the whole piece for consistency and voice.

## When to Use
- User wants to start a new post, or has a raw idea/quote/experience to turn into one
- User has a `_drafts/*.md` file that's just a title and front matter, not yet written
- Not for small edits to an already-published post — just fix those directly

## Phase 1: Align on the Bones
Before any writing, nail down with the user:
- **The idea** — what's the one thing this post is about?
- **The goal** — what should the reader believe, do, or feel differently after reading?
- **Theme/tone** — war story, framework post, contrarian take, personal reflection? Calibrate against the reference posts named in `CLAUDE.md`.
- **Outline** — a short list of sections, each with a one-line purpose, not full sentences yet

Ask directly if any of these are unclear. Don't guess and start drafting on an assumption. Confirm the outline with the user before moving to Phase 2.

If the draft file doesn't exist yet, create it: `bin/draft "Post Title"`.

## Phase 2: Research Each Section
Work one section at a time so research stays scoped — don't research the whole outline in one pass.

For each section:
1. **Roam search** — `mcp__roam__search` / `semantic_search` / `roam_query` for prior notes, quotes, and statements the user has already made on this topic. Call `get_graph_guidelines` once per graph before the first Roam read this session.
2. **Public research** — WebSearch/WebFetch for supporting data, examples, prior art, or counter-arguments. Only use what's independently verifiable — no invented stats or attributions.
3. Compile a short scratch list per section (quotes, links, data points). Don't write prose yet.

If research surfaces a stronger spine for a section, or a section with no real material, flag it and adjust the outline before continuing — cheaper now than after drafting.

## Phase 3: Draft Section by Section
Walk the outline in order. For each section:
1. Write the prose from that section's research, in the voice described in `CLAUDE.md` (opinionated, direct, conversational).
2. Show it to the user and get a read before starting the next section — voice drift compounds if it's only caught at the end.

## Phase 4: Full-Post Review
Read the whole post start to finish, not section by section:
- Does it deliver on the goal from Phase 1?
- Is the tone consistent across sections — nothing feels bolted on?
- Does the ending land as actionable or provocative, not a generic summary?
- Front matter: title and tags set correctly?

Run the `writing-style` skill as the final pass for AI-writing anti-patterns — this skill doesn't duplicate that check.

When the user is happy: `bin/promote _drafts/<file>.md [--date YYYY-MM-DD]`.

## Common Mistakes
| Mistake | Fix |
|---|---|
| Drafting prose before the outline is confirmed | Lock goal/theme/outline first — rewriting prose is expensive, changing an outline isn't |
| Researching the whole outline before drafting anything | Research one section at a time so drafting starts while research is still fresh |
| Going straight to public search | Check Roam first — it holds the user's own prior thinking and quotes, the most original material available |
| Running the review in Phase 4 before the post is fully drafted | Phase 4 is whole-post only — partial reviews miss cross-section consistency issues |
