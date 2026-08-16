---
name: writing-a-blog-post
description: Use when starting a new post for this blog (wireframe.github.com), or when revising a draft in progress — from a raw idea through outline, research, skeleton-building in Roam, drafting, section-by-section revision, and a final read before running bin/promote.
---

# Writing a Blog Post

## Overview
Five-phase workflow: align on the outline and intent, build a claims-and-evidence skeleton **on the Roam project page**, move to a Jekyll draft and write prose, revise section by section, then review the whole piece.

The skeleton lives in Roam, not in `_drafts/`. Roam is where the research already is, where block references keep sources live, and where restructuring is cheap. The Jekyll file gets created only when the skeleton is settled and prose starts.

## When to Use
- User wants to start a new post, or has a raw idea/quote/experience to turn into one
- User has a Roam page tagged `Type:: #Project #Blog` that needs a skeleton built
- User has a `_drafts/*.md` file that's just a title and front matter, not yet written
- User has a partially-drafted post to review, revise, or restructure — start at Phase 4
- Not for a post already in `_posts/` — fix those directly

## Phase 1: Align on the Bones
Before any writing, nail down with the user:
- **The idea** — what's the one thing this post is about? State it as the actual claim/topic, not as the anecdote that will open the post. A vivid story is a hook for the idea, not the idea itself. Confirm the title as its own explicit decision, separate from picking the opening story.
- **The goal** — what should the reader believe, do, or feel differently after reading? If the post has a job beyond the blog (thought leadership, job search, a talk), record it as `Objective::` on the Roam page — it changes which sections carry weight.
- **Theme/tone** — war story, framework post, contrarian take, personal reflection? Calibrate against the reference posts named in `CLAUDE.md`.
- **Outline** — a short list of sections, each with a one-line purpose and a proposed header in house style.

Confirm the title and the full outline with the user before Phase 2.

### Titles and headers
- **Check the candidate title against the anti-patterns in `CLAUDE.md` before proposing it.** Titles fall into "X, Not Y" constantly, and that's anti-pattern #1. Make the claim positively.
- **Calibrate against what's on the blog:** `for f in _posts/2025-* _posts/2026-*; do grep -m1 '^title:' "$f"; done`. House style is a declarative claim ("Recognition Is Infrastructure"), a named thing ("The Greenhouse Innovation Incubator"), or "Topic: Angle."
- **Metaphors have to map cleanly.** "From Pilot to Control Tower" died because a pilot is a person and a tower is a building. Check that both halves are the same kind of thing — role→role, place→place, activity→activity.
- **When the user rejects a title or header, offer three or four options taking genuinely different angles.** If several rounds fail, ask what dimension is wrong rather than generating more. When the post has a controlling metaphor, **play the theme** — the winning header usually comes from inside the metaphor's own vocabulary, not from plain description.
- **The title lives in three places that must agree:** front matter `title:`, the filename slug, and the section headers (no header should restate the title). The Roam page title should be renamed to match once confirmed.
- **Headers frame, they don't echo.** Don't force the header phrase into the prose.
- Drop trailing purpose clauses from headers once the skeleton is built ("— the spine of the post," "the biggest section"). Those are notes to yourself, not part of the post.

## Phase 2: Build the Skeleton in Roam

Work one section at a time. The skeleton is the artifact the user revises — not the chat transcript, and not the Jekyll file yet.

### Page structure
```
<Post Title>              (Type:: #Project #Blog)
  Objective::             why this post exists beyond the blog
  TLDR::                  the thesis, 3-4 sentences max
  Frame and decisions     (heading 2)
    the controlling metaphor, confirmed title + why, vocabulary decisions
  Skeleton                (heading 2)
    <Section header>      (heading 3)
      claim
        evidence
        evidence
      claim
      📝 Drafting notes for this section — not claims
  Appendix::              (heading 2)
    Research — <topic>    verification trails, rejected sources, caveats
    v1 prose salvage      superseded drafts kept for their sentences
```

### Bones are claims, not commentary
**Every top-level bullet under a section header must be a statement you want to land in the post.** If a reader would never see that sentence, it is not a bone.

Failures to catch, all of which look reasonable in isolation:
- **Meta-commentary posing as a claim** — "The premise correction, and the best available hook," "The organizing claim of the section." These describe the post's construction.
- **A claim buried behind its framing** — "Carried forward from section 2: the outer loop is the landing." Lead with the assertion.
- **Process notes at bone level** — attribution decisions, contradiction warnings, research flags.

Notes are not forbidden, they're just subordinate. Prefix inline ones `📝 Note, not a claim:` and give each section a `📝 Drafting notes` block at the end.

### Claim budget per section
**Maximum 5 claims per section. No exceptions — a sixth claim is a signal, not a special case.**

Going over almost always means one of two things, and it's worth diagnosing which:
- **Two claims are the same claim** wearing different words. In practice this is the common case — a section that reached eight had "time-to-land is set by planning" and "planning and landing trade against each other" as separate bullets.
- **The section is actually two sections**, or one section plus a catalog.

This is a budget on *distinct assertions*, not on paragraphs — five claims often land in three or four paragraphs, because adjacent claims share one.

**Run a consolidation pass before drafting**, not after. Go section by section and ask of each pair of claims: could these be one sentence with a semicolon? If yes, merge. Merging in the skeleton costs one edit; merging in prose costs a rewrite.

### Evidence nests under the claim it supports
Do not keep parallel **Claims** and **Evidence** lists. Separating them means holding a claim in your head while scrolling to find what backs it, and it hides two problems the nested form makes obvious at a glance:
- **A claim with no evidence** — fine if definitional, a gap if not.
- **A section where evidence outweighs claims** — usually means claims are missing, not that evidence is surplus.

### Research, per section
1. **Roam first** — `mcp__roam__search` / `semantic_search` / `roam_query` for the user's own prior notes and quotes. Call `get_graph_guidelines` once per graph before the first read. For any book, talk, or article the user has read, search Roam before the web; the graph holds verbatim highlights that public search often cannot surface at all.
2. **Check for the user's own model of any framework you're about to invoke.** Before using a term like "inner loop," search Roam for it. The user may have a defined model that conflicts with the industry one — in this graph, inner loop is the SDLC (Plan, Build, Verify, Operate) and outer loop is the PDP (Align, Execute, Learn), which puts code review *inside* the inner loop where most sources put it outside. Building on the wrong definition costs several claims and a TLDR.
3. **Public research** — WebSearch/WebFetch for third-party data, prior art, counter-arguments.
4. **Verify every claim with `verifying-claims` before it goes in.** Aggregator link-farms, vendor blogs citing unlinked studies, links that resolve to pages not containing the claim, and real findings stated more strongly than published are all more common than invented numbers.
5. For any anecdote from Roam, dig for the user's *own* stated reason it mattered — sibling blocks, the surrounding daily note. If the source states the reasoning, use that framing rather than a more generic one.
6. Write the section's claims into the Roam page, with evidence as children. Quotes go in blockquote form with attribution. Link web sources inline as `[Publisher](url)` next to the claim they back.

### Handling secondary sources and infographics
Treat any shared graphic, deck, or summary as a source of **pointers, not facts**. Verify each citation independently, then file the whole verification trail under `Appendix:: → Research — <topic>` and carry only the verified findings into the skeleton. Record what was wrong, not just what was right — misdated reports and numbers that conflict with figures already in the graph are common, and the note is what stops the bad version coming back.

When the user says to file research rather than incorporate it, keep the accuracy caveats with the filed copy. Those are citation hygiene, not counter-argument.

### When material gets superseded
Restructuring is normal and the old version usually contains good sentences. **Move superseded drafts to the Appendix labeled as salvage rather than deleting them.** Redistribute their citations into the new skeleton first, so the salvage block holds writing and the skeleton holds research.

**Flag rejected premises in place rather than quietly cutting them.** If a claim turns out to be wrong — especially one that contradicts the post's own evidence — mark it with what's wrong, what survives, and what has to go. A silent deletion gets re-derived three sessions later.

### Vocabulary decisions
When the user has a model they think in but won't write in, record it explicitly in **Frame and decisions**: the model, the plain-language substitutes, and any citation that uses the same words differently. Jargon the author won't say out loud should never appear in a claim.

If research surfaces a stronger spine for a section, or a section with no real material, flag it and adjust the outline before continuing.

## Phase 3: Move to Jekyll and Draft Prose

Once the skeleton is settled: `bin/draft "Post Title"` — the title becomes the filename slug, so confirm it first. Renaming later uses `git mv`.

Walk the outline in order. For each section:
1. Write prose from that section's claims, in the voice described in `CLAUDE.md` (opinionated, direct, conversational), under its header. **A claim does not have to be a paragraph — it just has to land its intent inside the section.** A claim can be a clause, a sentence, or share a paragraph with the claim next to it. Giving each one its own paragraph is what produces bloat: the paragraph needs a topic sentence and a closing sentence, and both are filler. Evidence becomes the sentences that back the claim; a blockquote stays a blockquote if the wording is worth showing verbatim.
2. **Link to the blog's own prior posts wherever the prose supports it.** Always prefer an existing post over an external source or no link at all — a claim the user already argued somewhere on this blog is a dated, public, first-hand citation, and it's the cheapest credibility the post has. Build the inventory before drafting: `for f in _posts/*.md; do printf "%s :: " "$f"; grep -m1 '^title:' "$f"; done`, then grep for the concepts the section touches. Use Jekyll's `{% post_url YYYY-MM-DD-slug %}` form — it's the convention across this blog and it breaks the build instead of silently 404ing if the target moves. Sequels link the post they follow in the opening line. **When the prose points at the prior post directly ("a year ago I wrote…", "I've argued…"), the anchor text is the post's title.** Hanging the link on a noun from the sentence reads as a term definition and hides the fact that it's the author's own prior work — the whole reason the link is there.
3. **Read the section's paragraph openers as a list before showing it.** Damage claims and correction claims naturally start on a negation ("It reads like a demotion," "We're already bad at this," "Nobody trained you for it"), and stacking two or three in a row makes the post read as a complaint no matter how good the evidence is. Lead each paragraph with the positive assertion and let the negative land inside it — "What happened to the other 86% is already visible in the codebase" carries the same claim as "we're already bad at this" without the slump.
4. **Images: reuse, never generate.** An image that already exists with verified attribution (a diagram from a cited source, a screenshot, a prior post's asset) earns its place. Never propose creating or generating a new one to illustrate a point — write the point instead.
5. Show it to the user and get a read before starting the next section — voice drift compounds if it's only caught at the end.

The Roam skeleton stays as the reference. Don't delete it when the prose lands.

## Phase 4: Revise Section by Section
Revision is its own phase. One section per turn, and within a section go in this order: content, then claims, then style — polishing a sentence a failed citation is about to delete is wasted work.

**First, scan the whole file for drafting artifacts:**
- The same section drafted twice, often separated by a stray `---`
- Scaffolding notes that leaked into the prose ("Section 2 ended on…")
- Sentences orphaned by an earlier cut
- Inline `(note: …)` / `(todo: …)` markers

**Then, per section:**
- **Does it advance the argument, or only show receipts?** A section that adds no new idea and only demonstrates what the others argued is a catalog. Distribute its transferable parts and delete it — or merge it with the section that gives it a punchline. The format tell: a run of bolded items in a post that is otherwise prose.
- **Is any evidence doing better work somewhere else?** Evidence sitting in a catalog is often the missing proof for an earlier claim that's currently pure assertion.
- **Does every anecdote pay off?** If the post introduces a thing, it has to say whether the thing worked. "It didn't stick" is often the strongest material available.
- **Verify the claims** with `verifying-claims`.
- **Then style**, against `CLAUDE.md`'s anti-patterns and the `writing-style` skill.

**Two things to watch in the user's own edits:**
- **Abstraction creep.** A concrete scene replaced by a description of the category it belongs to. If a rewrite is shorter but names fewer specific things, it lost more than it saved.
- **Self-contradiction.** Check that no sentence concedes what a neighboring sentence denies.

**After any restructuring, re-check the headers and the section numbering.** Killing or moving a section leaves headers describing content that isn't there, headers restating the title, and stale numbers.

## Phase 5: Full-Post Review
Read the whole post start to finish:
- Does it deliver on the goal from Phase 1?
- Is the tone consistent — nothing feels bolted on?
- Does the ending land as actionable or provocative, not a generic summary?
- Does the title pay off somewhere in the body, at least once?
- Front matter: title correct, tags drawn from ones in use — `grep -rh -A6 '^tags:' _posts/*.md | grep '^- ' | sort | uniq -c | sort -rn`.
- Colleague names, internal data, and company shorthand scrubbed. Roam is full of all three and they travel into drafts unnoticed. Internal metrics need an explicit call on what's publishable — usually the mechanism and a directional claim, never repo names, headcounts, dollar figures, ticket IDs, or customer names.

Run the `writing-style` skill as the final pass. When the user is happy: `bin/promote _drafts/<file>.md [--date YYYY-MM-DD]`.

## Common Mistakes
| Mistake | Fix |
|---|---|
| Building the skeleton in the Jekyll draft file | Skeleton goes on the Roam project page; `bin/draft` runs at Phase 3 when prose starts |
| Revising a Roam block by passing nested markdown to `update_block` | It stores the string **literally** — nesting becomes escaped `\n - ` text and the old children survive underneath, contradicting the new text. Update the parent's one line, delete stale children, then `create_block` the new ones |
| Drafting prose before the outline is confirmed | Lock goal/theme/outline first — rewriting prose is expensive, changing an outline isn't |
| A bone that describes the post instead of asserting something | Every top-level bullet is a sentence a reader would see. Notes get `📝 Note, not a claim:` |
| Leading a claim with its framing ("Carried forward from section 2…") | Lead with the assertion; the connection is a child note |
| More than 5 claims in a section | Hard cap. Two claims are the same claim, or it's two sections. Consolidate in the skeleton, not in prose |
| Parallel Claims and Evidence lists | Nest evidence under the claim it backs — it exposes unsupported claims and evidence-heavy sections at a glance |
| Using a framework term without checking the user's own definition | Search Roam for the term first; a conflicting personal model invalidates every claim built on it |
| Writing jargon the author would never say out loud | Record the model as a vocabulary decision, write the plain-language concepts |
| Going straight to public search | Check Roam first — the user's own prior thinking is the most original material available |
| Citing an external source for a point the user already made on this blog | Link the prior post. Grep `_posts/` for the concept before reaching outward; use `{% post_url YYYY-MM-DD-slug %}` |
| Treating a citation as verified because the link resolves | Run `verifying-claims` |
| Trusting an infographic's citations | Verify each one; file the trail in the Appendix with the corrections. Misdated reports are the norm |
| Deleting a superseded draft | Move it to the Appendix as salvage after redistributing its citations |
| Silently cutting a claim that turned out wrong | Flag the rejected premise with what survives and what has to go |
| Treating revision as a pass inside drafting | Phase 4 is its own phase: content, then claims, then style |
| Keeping a section that only demonstrates what earlier sections argued | Merge it with the section that gives it a punchline, or distribute and kill it |
| Leaving strong evidence in a catalog section | Move it under the claim that currently has none |
| Leaving an opening anecdote unresolved | Say whether the thing worked |
| Letting a tightening edit swap a specific scene for a generic description | Shorter is only better if it still names the same specific things |
| Offering one more title after the user rejects one | Three or four options, different angles. If the post has a metaphor, play the theme |
| A metaphor whose halves are different kinds of thing | Role→role, place→place. "Pilot to Control Tower" mixes a person with a building |
| Publishing colleague names, internal metrics, or company shorthand from Roam | Scrub all three; decide explicitly what's publishable from internal data |
| Renaming a draft by creating a new file | `git mv`, then update front matter, filename, Roam page title, and any header that restated the title |
| Running the Phase 5 review before the post is fully drafted | Phase 5 is whole-post only |
