---
name: writing-a-blog-post
description: Use when starting a new post for this blog (wireframe.github.com), or when revising a draft in progress — from a raw idea through outline, research, skeleton-building in Roam, drafting, section-by-section revision, and a final read before running bin/promote.
---

# Writing a Blog Post

## Overview
Six-phase workflow: align on the outline and intent, build a skeleton of the post's statements **on the Roam project page**, move to a Jekyll draft and write prose, revise section by section, add the flavor back, then review the whole piece.

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
- **Keep both halves of a metaphor in the same frame.** Role→role ("From Pilot to Air Traffic Controller") or place→place ("From the Cockpit to the Tower"). Mixing frames ("From Pilot to Control Tower") reads as a category error, but the fix is to pick a frame, not to abandon the metaphor — the underlying move is the same one either way.
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
      statement           (usually the author's own; most have no children)
        evidence          (only for empirical claims, instances, prior art)
      statement
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

### Most statements are the author's own, and citations are not the quality bar

**The default statement is an original assertion from the author's own experience. It needs no source, and asking for one is a category error.** This blog is a practitioner writing what he has watched happen. The spine of every post is his judgment; research is a supporting cast that appears in four specific jobs and nowhere else.

Sort every statement into one of these before evaluating it, because each is judged differently:

| Type | Example | What it needs | What it does NOT need |
|---|---|---|---|
| **Original assertion** | "Teams stop taking on short-term debt when nobody believes the job will get finished." | To be true to what the author has seen, specific, and sharply worded | A citation. Ever. |
| **Framing / definitional** | "Done is when the system's complexity is back in line with what the business needs." | Internal consistency with the rest of the post | External support |
| **Empirical claim** | "Only one third of ideas tested at Microsoft improved their target metric." | A verified primary source | — |
| **Prior art / counter-argument** | Roger Martin on the strategy-execution gap | Accurate attribution, fair statement of the opposing view | — |
| **Concrete instance** | Uber built a robot to delete stale feature flags | Verification that it happened as described | — |

**Research does exactly four jobs.** Backing an empirical claim. Supplying the strongest counter-argument so the post can concede it. Providing a vivid concrete instance. Finding prior art so the post can stand on it instead of accidentally reinventing it. If a research task doesn't fit one of those four, it is procrastination dressed as rigor.

**Never write these about an original assertion:** "unsourced," "still assertion," "has no source at all," "that's an argument not evidence," "underdeveloped," "needs a citation before use." Every one of those judges a first-person claim by a standard that does not apply to it. The author's own experience *is* the source, and it is the most original material the post has — an outside citation for it would be strictly weaker, because it would replace something only he can say with something anyone could quote.

**The right critiques of an original assertion** are different questions entirely:
- Is it specific, or has it drifted into a category label?
- Does it contradict another statement in the post? (This is the highest-value check — see below.)
- Is it the author's actual view, or a generic version of it?
- Would a reader who disagrees have a fair chance to?
- Is it doing work the neighboring statement already does?

**When prior art turns up for an original assertion, that is good news, not a demotion.** Finding that Drucker made the argument in 1967 lets the post stand on him and state a narrower, more defensible extension. Report it that way. Never frame a statement as provisional until an outsider has validated it.

### Check statements against each other before checking them against the world

The most valuable review pass is internal, not external. **Read each statement against its siblings and ask whether the post contradicts itself.** In practice this catches more real problems than citation-checking does, and nothing outside the post can find it for you.

A worked instance: one post asserted in section 1 that "success means paying for a migration, failure means removing what you built," then asserted three sections later that "a failed experiment needs more follow-through than a successful one." Migration is the bigger job. The post refuted itself across four sections and no amount of external sourcing would have surfaced it.

**Research can overturn a statement rather than support it, and that outcome is a success.** When it does, rewrite the statement to what survives and record the reversal in place — what was claimed, what the evidence actually showed, and what the corrected version is. Do not quietly delete; a silent cut gets re-derived three sessions later.

### Group by job when the inventory gets big

Past roughly fifteen statements, stable identifiers stop being navigation and start being noise. When the author says they're lost in their own outline, **stop presenting the numbered inventory and group the statements by the job each does in the argument** — setup, diagnosis, cost, objection, design, implication. Six groups over thirty numbers.

This also surfaces a structural problem nothing else does: **evidence distributed inversely to originality.** The familiar parts of an argument are always the best-sourced, because that is what the literature covers, and the original parts are always the thinnest. A post shaped by evidence density will lead with its least interesting material. Say so directly when the grouping shows it.

### Order for flow first, then apply the budget

**Sequence matters: get the argument flowing in the right order before trimming it to size.** The budget is a late tightening pass, not an early constraint. Using it early produces the worst possible outcome — a statement gets shoved into the wrong section because its home section was "full," and the argument bends around an arbitrary cap.

So when a section is over budget, ask in this order:
1. Does every statement sit in the section where it does its work? A remedy sitting in the consequences section is a flow problem, not a budget problem — move it and the count often fixes itself.
2. Is the reading order inside the section right? Assertion, then mechanism, then consequence. A vivid concrete instance is usually the closer.
3. *Then* consolidate duplicates against the cap below.

Never justify a placement with "it would put that section over budget." If the author says they aren't worried about the budget yet, they are telling you to solve flow first — do that and stop mentioning counts.

### Claim budget per section
**Maximum 5 claims per section, applied as a trimming pass once the order is settled.**

Going over almost always means one of two things, and it's worth diagnosing which:
- **Two claims are the same claim** wearing different words. In practice this is the common case — a section that reached eight had "time-to-land is set by planning" and "planning and landing trade against each other" as separate bullets.
- **The section is actually two sections**, or one section plus a catalog.

This is a budget on *distinct assertions*, not on paragraphs — five claims often land in three or four paragraphs, because adjacent claims share one.

**Run a consolidation pass before drafting**, not after. Go section by section and ask of each pair of claims: could these be one sentence with a semicolon? If yes, merge. Merging in the skeleton costs one edit; merging in prose costs a rewrite.

### Evidence nests under the statement it supports
Do not keep parallel **Claims** and **Evidence** lists. Separating them means holding a statement in your head while scrolling to find what backs it, and it hides a real problem the nested form makes obvious at a glance: **a section where evidence outweighs statements** usually means statements are missing, not that evidence is surplus.

A statement with nothing nested under it is not thereby a gap. Check its type first — most of them are not supposed to have anything under them.

### Research, per section
1. **Roam first** — `mcp__roam__search` / `semantic_search` / `roam_query` for the user's own prior notes and quotes. Call `get_graph_guidelines` once per graph before the first read. For any book, talk, or article the user has read, search Roam before the web; the graph holds verbatim highlights that public search often cannot surface at all.
2. **Check for the user's own model of any framework you're about to invoke.** Before using a term like "inner loop," search Roam for it. The user may have a defined model that conflicts with the industry one — in this graph, inner loop is the SDLC (Plan, Build, Verify, Operate) and outer loop is the PDP (Align, Execute, Learn), which puts code review *inside* the inner loop where most sources put it outside. Building on the wrong definition costs several claims and a TLDR.
3. **Public research** — WebSearch/WebFetch for third-party data, prior art, counter-arguments.
4. **Verify every empirical claim with `verifying-claims` before it goes in.** Aggregator link-farms, vendor blogs citing unlinked studies, links that resolve to pages not containing the claim, and real findings stated more strongly than published are all more common than invented numbers. This applies to the empirical/instance/prior-art rows of the table above, not to the author's own assertions.
5. **Check whose voice a graph block is in before attributing it.** Roam holds meeting notes, interview transcripts and talk summaries alongside the user's own thinking, and they look identical as bullets. A line under a `Questions` heading in a hiring interview is the *candidate's* answer, not the user's view. Read the ancestors before putting words in the author's mouth — and if the idea is good but the voice is someone else's, say so rather than dropping it.
6. **When two secondary sources disagree on a detail, the detail is wrong until a primary source settles it.** Summaries reliably corrupt the illustrative specifics — dates, names, which of two similar events it was — while getting the headline finding right. Verify the specific independently or cut it and keep the finding.
7. For any anecdote from Roam, dig for the user's *own* stated reason it mattered — sibling blocks, the surrounding daily note. If the source states the reasoning, use that framing rather than a more generic one.
8. Write the section's statements into the Roam page, with any evidence as children. Quotes go in blockquote form with attribution. Link web sources inline as `[Publisher](url)` next to the claim they back.

### Handling secondary sources and infographics
Treat any shared graphic, deck, or summary as a source of **pointers, not facts**. Verify each citation independently, then file the whole verification trail under `Appendix:: → Research — <topic>` and carry only the verified findings into the skeleton. Record what was wrong, not just what was right — misdated reports and numbers that conflict with figures already in the graph are common, and the note is what stops the bad version coming back.

When the user says to file research rather than incorporate it, keep the accuracy caveats with the filed copy. Those are citation hygiene, not counter-argument.

### When material gets superseded
Restructuring is normal and the old version usually contains good sentences. **Move superseded drafts to the Appendix labeled as salvage rather than deleting them.** Redistribute their citations into the new skeleton first, so the salvage block holds writing and the skeleton holds research.

**Flag rejected premises in place rather than quietly cutting them.** If a claim turns out to be wrong — especially one that contradicts the post's own evidence — mark it with what's wrong, what survives, and what has to go. A silent deletion gets re-derived three sessions later.

### When the central noun fights the thesis
If the author says a core word "makes no sense" or "throws me off," take it as a structural report, not a style preference. **Check whether the metaphor can actually perform the argument's motion.** One post was built on "every bet has a second half" — but a bet is passive after placement, the outcome happens *to* you, so the noun contradicted a thesis about what you do afterward. No amount of rewording around it would have worked.

When replacing a controlling metaphor:
- Test candidates by whether the argument's key move is *native* to them, not by which sounds better.
- Check whether the old title conceded something the post refutes. "The other half of X" asserts two halves; if a later section argues it's one motion, the title was arguing against the post.
- **Record an intensity budget, not just the choice.** Name where the metaphor appears — title, one plant, the section where it does argumentative work, one concession — and state that the prose says plain language everywhere else. A metaphor with no stated budget saturates the draft.
- Log the comparison that lost and *why*, including anything the rejected option would have given up. That record stops the same debate reopening, and sometimes the lost advantage turns up later from another direction.

### Deleting in Roam: check refs before clearing a section
Superseded scaffolding (parking lots, promoted-idea wrappers) accumulates and clearing it is normal. **Before deleting any subtree, check every block in it for `refs="N"`.** Deleting a referenced block does not remove the reference — it replaces it with static text, so a claim that pointed at a live source silently becomes a copy of it.

The fix is to move the referenced source block to sit under the statement it supports, delete the now-redundant transclusion wrapper, then delete the scaffolding. Preserve any commentary children by re-parenting them first.

### Vocabulary decisions
When the user has a model they think in but won't write in, record it explicitly in **Frame and decisions**: the model, the plain-language substitutes, and any citation that uses the same words differently. Jargon the author won't say out loud should never appear in a claim.

If research surfaces a stronger spine for a section, or a section with no real material, flag it and adjust the outline before continuing.

## Phase 3: Move to Jekyll and Draft Prose

Once the skeleton is settled: `bin/draft "Post Title"` — the title becomes the filename slug, so confirm it first. Renaming later uses `git mv`.

Walk the outline in order. For each section:
1. Write prose from that section's claims, in the voice described in `CLAUDE.md` (opinionated, direct, conversational), under its header. **A claim does not have to be a paragraph — it just has to land its intent inside the section.** A claim can be a clause, a sentence, or share a paragraph with the claim next to it. Giving each one its own paragraph is what produces bloat: the paragraph needs a topic sentence and a closing sentence, and both are filler. Evidence becomes the sentences that back the claim; a blockquote stays a blockquote if the wording is worth showing verbatim.
2. **Link to the blog's own prior posts wherever the prose supports it.** Always prefer an existing post over an external source or no link at all — a claim the user already argued somewhere on this blog is a dated, public, first-hand citation, and it's the cheapest credibility the post has. Build the inventory before drafting: `for f in _posts/*.md; do printf "%s :: " "$f"; grep -m1 '^title:' "$f"; done`, then grep for the concepts the section touches. Use Jekyll's `{% post_url YYYY-MM-DD-slug %}` form — it's the convention across this blog and it breaks the build instead of silently 404ing if the target moves. Sequels link the post they follow in the opening line. **Anchor the link on the claim the prior post established, not on the post's title.** A reader following that link wants the source of truth for the assertion they just read; the title tells them nothing they need. Wrapping the whole assertion is right — "[Last year, I wrote that working with coding agents needed pilots: …](…)" — because the link then reads as the receipt for the claim. Hanging it on a single noun from the sentence is wrong for the opposite reason: it reads as a term definition instead of a pointer to prior work.
3. **Read the section's paragraph openers as a list before showing it.** Damage claims and correction claims naturally start on a negation ("It reads like a demotion," "We're already bad at this," "Nobody trained you for it"), and stacking two or three in a row makes the post read as a complaint no matter how good the evidence is. Lead each paragraph with the positive assertion and let the negative land inside it — "What happened to the other 86% is already visible in the codebase" carries the same claim as "we're already bad at this" without the slump.
4. **Images: reuse, never generate.** An image that already exists with verified attribution (a diagram from a cited source, a screenshot, a prior post's asset) earns its place. Never propose creating or generating a new one to illustrate a point — write the point instead.
5. **Run a deslop pass before the user sees a single word.** This is not optional and it is not the Phase 4 style pass — it is the last thing you do before pasting a section into the chat. Slop is any sentence that comments on the argument instead of advancing it. Delete on sight:
   - **Evaluative filler** — "and that is the whole argument," "the critique lands," "which is the point," "worth saying out loud." If cutting the clause loses no information, it was slop.
   - **Abstract nouns standing in for the concrete thing** — "the shape of the failure," "a capacity constraint on a different vector," "parallelism made them structural." Say what actually happened.
   - **Metaphor as filler** — "buys down the landing," "the bill lands," "load-bearing." The controlling metaphor earns its keep in the headers and the closing image; everywhere else it is decoration.
   - **Aphoristic closers** — "somebody services a debt, nobody services a mess," "the typing stopped mattering." They sound like a conclusion and contain no new claim.
   - **Transition noise** — "then the steps," "all of which means," "which brings us to."
   - **Explaining your own material** — why a joke is funny, what an image depicts, what the previous sentence meant. Trust the reader.
   - **Detail that doesn't earn its keep** — study sample sizes, author names and publication years when the finding is the point. Cite the claim, link the source, move on.
6. Show it to the user and get a read before starting the next section — voice drift compounds if it's only caught at the end.

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
- **Is any evidence doing better work somewhere else?** Evidence sitting in a catalog is often the proof an earlier empirical claim needed.
- **Does any statement contradict another?** Run this before the citation pass. It is the highest-yield check in the phase and the only one no external source can do for you.
- **Does every anecdote pay off?** If the post introduces a thing, it has to say whether the thing worked. "It didn't stick" is often the strongest material available.
- **Verify the claims** with `verifying-claims`.
- **Then style**, against `CLAUDE.md`'s anti-patterns and the `writing-style` skill.

**Two things to watch in the user's own edits:**
- **Abstraction creep.** A concrete scene replaced by a description of the category it belongs to. If a rewrite is shorter but names fewer specific things, it lost more than it saved.
- **Self-contradiction.** Check that no sentence concedes what a neighboring sentence denies.

**After any restructuring, re-check the headers and the section numbering.** Killing or moving a section leaves headers describing content that isn't there, headers restating the title, and stale numbers.

## Phase 5: Flavor
Revision strips prose flat, which is what it is for. This phase puts the personality back on purpose, on the parts that earned it. **Run it after the citation and deslop passes, never before** — flavor added early is the first thing a reviewer calls slop, because emphasis on an unearned claim reads as puffery.

- **Emphasis is optional per section, and generally worth having.** There is no quota, and a section with none is fine when nothing in it is contested. Two things earn it: a claim a reader could argue with, or a structural signpost that helps them navigate a long paragraph (`First,` … `Next,` …). Three things don't: topic sentences, transitions, and sentences that only summarize. The failure mode is volume rather than absence, so when a section is carrying several, the ones left standing should be the ones that would start an argument.
- **Italics for the single word carrying the turn** (deliver impact *without* writing a line of code); **bold for a claim that stands on its own** (**I've never hired a programmer.**). Alternating them at random reads as shouting.
- **Puns are in-voice** — the user's own style note says playful and punny. A pun in a header, a caption, or an aside is welcome. A pun that needs explaining is not; see the deslop rule about explaining your own material.
- **An image earns its place when it lands a joke or shows what prose can't.** A pun image counts. Reuse an existing one with attribution — never generate one (Phase 3, step 4).
- **Name the constructs.** This blog names things: The Crickets Award, The Commit Cycle, The Not Doing List, V2OOO. A named idea gets quoted back at you; an unnamed one gets paraphrased away.
- **Check the last line of every section, not just the post.** Each should land a fact, an image, or a question — never a summary of what the reader just finished reading.

## Phase 6: Full-Post Review
Read the whole post start to finish:
- Does it deliver on the goal from Phase 1?
- Is the tone consistent — nothing feels bolted on?
- Does the ending land as actionable or provocative, not a generic summary?
- Does the title pay off somewhere in the body, at least once?
- Front matter: title correct, tags drawn from ones in use — `grep -rh -A6 '^tags:' _posts/*.md | grep '^- ' | sort | uniq -c | sort -rn`.
- Colleague names, internal data, and company shorthand scrubbed. Roam is full of all three and they travel into drafts unnoticed. Internal metrics need an explicit call on what's publishable — usually the mechanism and a directional claim, never repo names, headcounts, dollar figures, ticket IDs, or customer names.

Run the `writing-style` skill as the final pass. When the user is happy: `bin/promote _drafts/<file>.md [--date YYYY-MM-DD]`. Once it's published, the `sharing-on-social` skill drafts the social copy.

## Common Mistakes
| Mistake | Fix |
|---|---|
| Building the skeleton in the Jekyll draft file | Skeleton goes on the Roam project page; `bin/draft` runs at Phase 3 when prose starts |
| Revising a Roam block by passing nested markdown to `update_block` | It stores the string **literally** — nesting becomes escaped `\n - ` text and the old children survive underneath, contradicting the new text. Update the parent's one line, delete stale children, then `create_block` the new ones |
| Drafting prose before the outline is confirmed | Lock goal/theme/outline first — rewriting prose is expensive, changing an outline isn't |
| A bone that describes the post instead of asserting something | Every top-level bullet is a sentence a reader would see. Notes get `📝 Note, not a claim:` |
| Leading a claim with its framing ("Carried forward from section 2…") | Lead with the assertion; the connection is a child note |
| More than 5 claims in a section | Hard cap. Two claims are the same claim, or it's two sections. Consolidate in the skeleton, not in prose |
| Parallel Claims and Evidence lists | Nest evidence under the statement it backs — it exposes evidence-heavy sections at a glance |
| Calling an original assertion "unsourced," "still assertion," or "underdeveloped" | Sort it by type first. The author's own experience is the source; those words apply only to empirical claims |
| Hunting a citation for something the author observed himself | Research does four jobs only: back an empirical claim, supply a counter-argument, provide a concrete instance, find prior art. Nothing else |
| Treating found prior art as a demotion | It's a promotion — the post stands on the source and states a narrower extension. Say so that way |
| Checking statements against the world but never against each other | Read siblings for self-contradiction first; it catches more than citation-checking and nothing external can find it |
| Attributing a Roam block to the author without reading its ancestors | Meeting notes and interview answers look identical to his own thinking. A line under `Questions` in an interview is the candidate's |
| Trusting an illustrative detail two summaries disagree on | The headline finding survives; dates, names and which-event-it-was do not. Verify against a primary source or cut the detail |
| Invoking the claim budget to justify a placement | Flow first, budget as a late trimming pass. "It would put that section over budget" is never a reason to misplace a statement |
| Presenting a long numbered inventory to a user who says they're lost | Group by the job each statement does — setup, diagnosis, cost, objection, design, implication |
| Deleting a Roam subtree without checking `refs` | Deleting a referenced block turns live references into static text. Move the source under its statement first |
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
| A metaphor whose halves sit in different frames | Pick one and stay in it: role→role (pilot → controller) or place→place (cockpit → tower) |
| Publishing colleague names, internal metrics, or company shorthand from Roam | Scrub all three; decide explicitly what's publishable from internal data |
| Renaming a draft by creating a new file | `git mv`, then update front matter, filename, Roam page title, and any header that restated the title |
| Running the Phase 5 review before the post is fully drafted | Phase 5 is whole-post only |
