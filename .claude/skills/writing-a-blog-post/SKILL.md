---
name: writing-a-blog-post
description: Use when starting a new post for this blog (wireframe.github.com), or when revising a draft in progress — from a raw idea through outline, research, drafting, section-by-section revision, and a final read before running bin/promote.
---

# Writing a Blog Post

## Overview
Five-phase workflow for turning an idea into a published post: align on the outline and intent, research each section and write it into the draft file as a skeleton (Roam + public sourcing), turn each section's skeleton into prose, revise section by section, then review the whole piece for consistency and voice.

## When to Use
- User wants to start a new post, or has a raw idea/quote/experience to turn into one
- User has a `_drafts/*.md` file that's just a title and front matter, not yet written
- User has a partially-drafted post to review, revise, or restructure — start at Phase 4
- Not for a post already in `_posts/` — fix those directly

## Phase 1: Align on the Bones
Before any writing, nail down with the user:
- **The idea** — what's the one thing this post is about? State it as the actual claim/topic, not as the anecdote that will open the post. A vivid story is a hook for the idea, not the idea itself — titling the post after the hook (e.g. naming it after one illustrative example) buries the thesis the post is actually arguing. Confirm the title as its own explicit decision, separate from picking the opening story.
- **The goal** — what should the reader believe, do, or feel differently after reading?
- **Theme/tone** — war story, framework post, contrarian take, personal reflection? Calibrate against the reference posts named in `CLAUDE.md`.
- **Outline** — a short list of sections. Each needs a one-line purpose *and* a proposed punchy header in this blog's house style (bold, declarative, often "Topic — Angle" like "People — Talent Lives Everywhere" in `_posts/2026-05-30-engineering-your-remote-engineering-team.md") — not a generic label like "Section 2." Confirm both the purpose and the header text with the user per section.

Ask directly if any of these are unclear. Don't guess and start drafting on an assumption. Confirm the title and the full outline (purpose + header per section) with the user before moving to Phase 2.

### Titles and headers
- **Check the candidate title against the anti-patterns in `CLAUDE.md` before proposing it.** Titles fall into "X, Not Y" / "It's not X, it's Y" constantly, and that's anti-pattern #1. Make the claim positively instead.
- **Calibrate against what's actually on the blog:** `for f in _posts/2025-* _posts/2026-*; do grep -m1 '^title:' "$f"; done`. House style is a declarative claim ("Recognition Is Infrastructure"), a named thing ("The Greenhouse Innovation Incubator"), or "Topic: Angle" ("Outgrowing the Org Chart: Team Topology for Scaling Teams").
- **The title lives in three places that must agree:** front matter `title:`, the filename slug, and the section headers (no header should restate the title). Re-check all three whenever the title changes.
- **Headers frame, they don't echo.** This blog's headers work as framing the body pays off, not as phrases repeated in the text — "The High-Five Economy" and "Petty Cash Depreciates, Memories Compound" never appear verbatim in their sections. Don't force the phrase into the prose.
- **When the user rejects a proposed title or header, offer three options taking different angles** rather than one more attempt at the same idea.
- `featured_description` is an optional front-matter field (see `_posts/2026-02-05-the-greenhouse-innovation-incubator.md`) — a one-line subtitle for the post card.

If the draft file doesn't exist yet, create it once the title is confirmed: `bin/draft "Post Title"` — the title becomes the filename slug, so getting it right before creating the file avoids a rename. Renaming an existing draft uses `git mv`.

## Phase 2: Research Each Section, Write the Skeleton to the File
Work one section at a time so research stays scoped — don't research the whole outline in one pass. The output of this phase lives in the draft file itself, not in conversation — that skeleton is what the user revises before any prose gets written.

For each section:
1. **Roam search** — `mcp__roam__search` / `semantic_search` / `roam_query` for prior notes, quotes, and statements the user has already made on this topic. Call `get_graph_guidelines` once per graph before the first Roam read this session. **For any book, talk, or article the user has read, search Roam before the web.** The graph holds verbatim highlights with chapter context, and public search frequently cannot surface them at all — three separate web searches for one book's award anecdote returned nothing while the graph had both quotes exactly, with the chapter.
2. **Public research** — WebSearch/WebFetch for third-party data, examples, prior art, or counter-arguments.
3. **Verify every claim with the `verifying-claims` skill before it goes into the file.** A citation that looks solid usually isn't: aggregator link-farms, vendor blogs citing unlinked studies, links that resolve to pages not containing the claim, and real findings stated more strongly than published are all more common than invented numbers.
4. For any real anecdote pulled from Roam, dig for the user's *own* stated reason it mattered — sibling/child blocks, the surrounding daily note, an adjacent comment — not just the bare fact of what happened. A migration finishing quietly isn't the insight; "teams almost never get celebrated when nothing goes wrong, so the quiet win goes unmarked" is. If the source material already states the reasoning, use that framing directly rather than substituting a more generic one (e.g. reframing a story about *invisible wins going unrecognized* as a story about *cost savings*) — the specific angle is usually the reason the user remembered the story at all.
5. Write the section's skeleton directly into the draft file, under its confirmed header: plain bullets for structure, claims, and reasoning; verbatim quotes as markdown blockquotes with an attribution line, matching this blog's existing quote convention (see `_posts/2026-05-30-engineering-your-remote-engineering-team.md`):
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

## Phase 4: Revise Section by Section
Revision is its own phase, not a pass inside drafting. Work one section per turn and get a read before moving on. Within a section, go in this order: content, then claims, then style — polishing a sentence that a failed citation is about to delete is wasted work.

**First, scan the whole file for drafting artifacts.** These waste a review pass if you hit them mid-prose:
- The same section drafted twice, often separated by a stray `---`, with a quote or argument appearing in both
- Scaffolding notes that leaked into the prose ("Section 2 ended on…", "the two rungs already covered") — notes-to-self written as if they were text
- Sentences orphaned by an earlier cut, depending on data or setup that no longer exists in the file
- Inline `(note: …)` / `(todo: …)` markers — resolve each one or surface it to the user

**Then, per section:**
- **Does it advance the argument, or only show receipts?** Each section should give the reader something the previous ones didn't. A section that adds no new idea and only demonstrates what the others argued is a catalog. Distribute its transferable parts into the argument sections and delete it. The format tell: a run of bolded items in a post that is otherwise prose.
- **Does every anecdote pay off?** An opening story that never resolves is the most common structural gap in a draft. If the post introduces a thing, it has to say whether the thing worked. The honest answer is often the strongest material available — including, especially, when the answer is "it didn't."
- **Verify the claims** with `verifying-claims`.
- **Then style**, against `CLAUDE.md`'s anti-patterns and the `writing-style` skill.

**Two things to watch in the user's own edits**, both of which show up during tightening rather than drafting:
- **Abstraction creep.** A concrete scene gets replaced by a description of the category it belongs to — an actual nomination prompt becomes "a low-friction system for peer recognition funneling into a quarterly award." If a rewrite is shorter but names fewer specific things, it lost more than it saved.
- **Self-contradiction.** Check that no sentence concedes what a neighboring sentence denies.

**After any restructuring, re-check the headers.** Killing or moving a section leaves headers describing content that isn't there, headers restating the title, and headers competing for the same construction.

## Phase 5: Full-Post Review
Read the whole post start to finish, not section by section:
- Does it deliver on the goal from Phase 1?
- Is the tone consistent across sections — nothing feels bolted on?
- Does the ending land as actionable or provocative, not a generic summary?
- Does the title pay off somewhere in the body, at least once, explicitly?
- Front matter: title correct, and tags drawn from ones actually in use — `grep -rh -A6 '^tags:' _posts/*.md | grep '^- ' | sort | uniq -c | sort -rn` — rather than invented.
- Colleague names and company-internal shorthand scrubbed. Roam is full of both, and they travel into drafts unnoticed.

Run the `writing-style` skill as the final pass for AI-writing anti-patterns — this skill doesn't duplicate that check.

When the user is happy: `bin/promote _drafts/<file>.md [--date YYYY-MM-DD]`.

## Common Mistakes
| Mistake | Fix |
|---|---|
| Drafting prose before the outline is confirmed | Lock goal/theme/outline first — rewriting prose is expensive, changing an outline isn't |
| Researching the whole outline before drafting anything | Research one section at a time so drafting starts while research is still fresh |
| Going straight to public search | Check Roam first — it holds the user's own prior thinking and quotes, the most original material available, and often the only findable copy of a book passage |
| Treating a citation as verified because the link resolves | Run `verifying-claims` — most bad citations are real links that don't support the sentence |
| Treating revision as a pass inside drafting | Phase 4 is its own phase: one section per turn, content then claims then style |
| Reviewing prose before scanning for drafting artifacts | Duplicated sections and leaked scaffolding notes waste a whole review pass — find them first |
| Leaving an opening anecdote unresolved | Say whether the thing worked. "It didn't stick" is often the best material in the post |
| Keeping a section that only demonstrates what earlier sections argued | Distribute its transferable parts into the argument sections and kill it |
| Letting a tightening edit swap a specific scene for a generic description | Shorter is only better if it still names the same specific things |
| Offering one more title after the user rejects one | Offer three options taking different angles |
| Publishing colleague names or internal shorthand pulled from Roam | Scrub both — Roam records are internal, the blog is not |
| Renaming a draft by creating a new file | `git mv`, then update front matter, filename, and any section header that restated the title |
| Running the review in Phase 5 before the post is fully drafted | Phase 5 is whole-post only — partial reviews miss cross-section consistency issues |
| Titling the post after the opening anecdote instead of the actual thesis | Confirm the title as the claim/topic, separate from whichever story opens it — a great hook story is rarely a great title |
| Drafting sections with generic labels ("Section 2") instead of house-style headers | Propose and confirm a punchy header per section in Phase 1, alongside its one-line purpose |
| Generalizing a sourced anecdote's insight instead of using the reasoning already in the source | Read the surrounding Roam blocks for *why* the user flagged it, and keep that specific framing rather than swapping in a more generic one |
| Keeping research as a scratch list in conversation instead of in the draft file | Write the skeleton (bullets + blockquoted, attributed quotes) directly into the draft file — that's the artifact the user reviews and revises, not the chat transcript |
| Writing quotes as inline `Quote: "..."` text | Use markdown blockquote style with an attribution line (`> text` / `> — Source`), matching this blog's existing quote convention |
