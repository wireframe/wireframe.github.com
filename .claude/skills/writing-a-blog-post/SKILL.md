---
name: writing-a-blog-post
description: Use when starting a new post for this blog (wireframe.github.com) — from a raw idea through outline, research, drafting, and a final read before running bin/promote.
---

# Writing a Blog Post

## Overview
Four-phase workflow for turning an idea into a published post: align on the outline and intent, research each section and write it into the draft file as a skeleton (Roam + public sourcing), turn each section's skeleton into prose, then review the whole piece for consistency and voice.

## When to Use
- User wants to start a new post, or has a raw idea/quote/experience to turn into one
- User has a `_drafts/*.md` file that's just a title and front matter, not yet written
- Not for small edits to an already-published post — just fix those directly

## Phase 1: Align on the Bones
Before any writing, nail down with the user:
- **The idea** — what's the one thing this post is about? State it as the actual claim/topic, not as the anecdote that will open the post. A vivid story is a hook for the idea, not the idea itself — titling the post after the hook (e.g. naming it after one illustrative example) buries the thesis the post is actually arguing. Confirm the title as its own explicit decision, separate from picking the opening story.
- **The goal** — what should the reader believe, do, or feel differently after reading?
- **Theme/tone** — war story, framework post, contrarian take, personal reflection? Calibrate against the reference posts named in `CLAUDE.md`.
- **Outline** — a short list of sections. Each needs a one-line purpose *and* a proposed punchy header in this blog's house style (bold, declarative, often "Topic — Angle" like "People — Talent Lives Everywhere" in `_posts/2026-05-30-engineering-your-remote-engineering-team.md") — not a generic label like "Section 2." Confirm both the purpose and the header text with the user per section.

Ask directly if any of these are unclear. Don't guess and start drafting on an assumption. Confirm the title and the full outline (purpose + header per section) with the user before moving to Phase 2.

If the draft file doesn't exist yet, create it once the title is confirmed: `bin/draft "Post Title"` — the title becomes the filename slug, so getting it right before creating the file avoids a rename.

## Phase 2: Research Each Section, Write the Skeleton to the File
Work one section at a time so research stays scoped — don't research the whole outline in one pass. The output of this phase lives in the draft file itself, not in conversation — that skeleton is what the user revises before any prose gets written.

For each section:
1. **Roam search** — `mcp__roam__search` / `semantic_search` / `roam_query` for prior notes, quotes, and statements the user has already made on this topic. Call `get_graph_guidelines` once per graph before the first Roam read this session.
2. **Public research** — WebSearch/WebFetch for supporting data, examples, prior art, or counter-arguments. Only use what's independently verifiable — no invented stats or attributions.
3. For any real anecdote pulled from Roam, dig for the user's *own* stated reason it mattered — sibling/child blocks, the surrounding daily note, an adjacent comment — not just the bare fact of what happened. A migration finishing quietly isn't the insight; "teams almost never get celebrated when nothing goes wrong, so the quiet win goes unmarked" is. If the source material already states the reasoning, use that framing directly rather than substituting a more generic one (e.g. reframing a story about *invisible wins going unrecognized* as a story about *cost savings*) — the specific angle is usually the reason the user remembered the story at all.
4. Write the section's skeleton directly into the draft file, under its confirmed header: plain bullets for structure, claims, and reasoning; verbatim quotes as markdown blockquotes with an attribution line, matching this blog's existing quote convention (see `_posts/2026-05-30-engineering-your-remote-engineering-team.md`):
   ```
   > Quote text goes here, verbatim.
   > — Attribution, *Source Title*
   ```
   Link any web source inline as `[Publisher/description](url)` next to the claim it backs. Don't paraphrase a quote into a bullet — if it's worth citing, quote it.

If research surfaces a stronger spine for a section, or a section with no real material, flag it and adjust the outline before continuing — cheaper now than after drafting.

## Phase 3: Turn Each Skeleton into Prose
Walk the outline in order. For each section, in the draft file:
1. Replace that section's bullets and blockquotes with prose in the voice described in `CLAUDE.md` (opinionated, direct, conversational), under its existing header. Fold the cited quotes and sources into the prose rather than deleting them — a skeleton bullet becomes a sentence, a blockquote becomes either a kept blockquote (if the wording is worth showing verbatim) or a paraphrase with attribution.
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
| Titling the post after the opening anecdote instead of the actual thesis | Confirm the title as the claim/topic, separate from whichever story opens it — a great hook story is rarely a great title |
| Drafting sections with generic labels ("Section 2") instead of house-style headers | Propose and confirm a punchy header per section in Phase 1, alongside its one-line purpose |
| Generalizing a sourced anecdote's insight instead of using the reasoning already in the source | Read the surrounding Roam blocks for *why* the user flagged it, and keep that specific framing rather than swapping in a more generic one |
| Keeping research as a scratch list in conversation instead of in the draft file | Write the skeleton (bullets + blockquoted, attributed quotes) directly into the draft file — that's the artifact the user reviews and revises, not the chat transcript |
| Writing quotes as inline `Quote: "..."` text | Use markdown blockquote style with an attribution line (`> text` / `> — Source`), matching this blog's existing quote convention |
