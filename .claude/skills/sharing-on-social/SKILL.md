---
name: sharing-on-social
description: Use after a post is published to _posts/ — drafts one short reusable text for X and LinkedIn, writes it to the post's `social:` front matter key, and hands off to bin/social to copy it to the clipboard. Also for rewriting the social copy on a post that already has some.
---

# Sharing on Social

## Overview
The job is getting a published post shared on X and LinkedIn. One short text, reusable on both platforms, stored with the post so there's a record of what went out. Drafting is one step of that job; pasting into the platforms is another, and it happens by hand.

## When to Use
- A post was just published with `bin/promote` and has no `social:` key yet
- A published post's social copy needs rewriting
- The copy already exists and just needs reprinting — that's `bin/social` alone, no skill needed

**Input is a path under `_posts/`.** A draft is not valid input: the live URL doesn't exist until the post is published, which is the same boundary `bin/social` enforces. If the user points at a `_drafts/` file, publish it first with `bin/promote`, or ask whether they meant a published post.

## Phase 1: Read the Post
Read the whole post before drafting. The hook has to come from what the post actually argues, not from its title.

Note as you read:
- The opening scene — often the strongest social hook already written
- The one claim the post would be quoted for
- The closing question or challenge
- Any named construct (The Commit Cycle, The Not Doing List, V2OOO). A named idea travels.

## Phase 2: Draft Three Candidates
Offer **three candidates taking genuinely different angles**:

1. **A claim** — the post's most contested assertion, stated flat
2. **A concrete scene** — the opening image, compressed
3. **A question** — the thing the post leaves the reader arguing with

One text per candidate, pasted identically into both platforms. No per-platform variants, no hashtags, no @-mentions, no "new post 👇".

**Budget: 280 characters for the whole assembled block**, counting the URL at its literal length plus the two newlines before it. On this site a URL is 39 + slug length — 43 to 86 characters across the existing posts — so the prose gets `280 - 2 - URL`: about 235 characters behind a short slug and under 200 behind a long one. Measure against the actual post's URL rather than the midpoint. `bin/social` enforces the ceiling and refuses to copy anything over it.

If the user rejects all three, ask what dimension is wrong — angle, length, which part of the post it's pulling from — rather than generating three more.

### Display format
```
1. claim (165)
   I've never hired a programmer for how fast they type. I've hired
   plenty for how well they finish.

2. scene (159)
   Four agent sessions running at once, six pull requests open, and
   nothing shipped that week.

3. question (148)
   What does "done" mean on your team? Merged, or working in
   production for a week?

Pick 1-3, or edit one.
```
The number in parentheses is the total assembled count including the URL and the two newlines before it — the number `bin/social` will report. The counts above assume a 66-character URL; recompute them against the post at hand.

## Voice check
Run this on the candidates before showing them. At 280 characters most of the `writing-style` skill can't fire, so check the part that can.

**Catch these:**
- Every Tier 1 slop word (`writing-style` `:56-73`): delve, tapestry, figurative landscape, leverage, foster, garner, showcase, underscore, pivotal, testament, vibrant, empower, seamlessly, groundbreaking, cutting-edge, revolutionize, transformative, and figurative **shape** ("has the same shape", "shaped by") — say what happened instead: decided, built, made, set, hit.
- Tier 2 lexical padding (`:80-95`): crucial, vital, essential, enhance, innovative, comprehensive, robust, ensures, adjectival "key", intricate, interplay, enduring, valuable insights, best-in-class, world-class, commitment to.
- Tier 3 verbs (`:103-112`): serves as, stands as, represents, boasts, "features" as a verb, "offers a solution", cultivate, navigate, resonate, align — the plain word is almost always "is" or "has".
- The significance puff (`:116`) — no sentence about how important the post is.
- Superficial `-ing` tails (`:122`) — nothing ending "...highlighting the importance" or "...reflecting broader trends".
- Negative parallelism (`:128`) — no "it's not X, it's Y". Make the positive claim.
- Rule-of-three inflation (`:142`) and false ranges (`:148`).
- Defensive scare quotes (`:210`).
- A universal claim nobody would argue with (`:281`) — "Quality matters" lands flat. State the contested version.

Plus the blog's own voice: first person and active ("I've watched", not "organizations have found"), a concrete scene over a thesis, and no empty "X is the work" closer.

**Don't apply these** — they need multiple sentences or paragraphs and will misfire here: em-dash and tic counting (`:305`, `:250`, `:307`), adjacent-sentence restatement and self-contradiction (`:300`, `:309`), bolded-takeaway rules (`:299`), paragraph-closer rules (`:301`), the one-colon-per-paragraph cap (`:306`), citation-first openings (`:304`), and the before/after specific-noun count (`:308`).

For the record: `writing-style` has no sentence-length rule and no short-form mode. "Vary sentence and paragraph length" is `CLAUDE.md` item 4, not the skill's, and it doesn't apply to a single short block either. That's why the applicable subset is spelled out here rather than invoking the skill wholesale.

## Phase 3: Write It to Front Matter
Read the post's existing front matter first, then edit. Front matter shapes vary across this blog (flush-left and indented tag lists, `tags:` with trailing whitespace, some posts with a blank line after the opening fence), so match what's already in the file rather than assuming a shape.

Write `social:` as a folded `>` scalar directly after `title:`, value indented two spaces, unquoted — the same shape `featured_description` uses:

```yaml
---
title: "The Finish Decides the Shot"
social: >
  I've never hired a programmer for how fast they type. I've hired
  plenty for how well they finish.
featured_description: >
  Why the work after the experiment decides what the experiment was worth
tags:
- engineering
---
```

**The prose is a single paragraph.** `bin/social` folds the scalar's lines with single spaces, so line breaks in the file are wrapping, not formatting. A blank line inside the value is an error, not a paragraph break — `bin/social` refuses to run rather than dropping everything after it.

The key renders nowhere — no layout, include, feed, or `search.json` reads it.

## Phase 4: Hand Off
```
bin/social _posts/YYYY-MM-DD-slug.md
```
It prints the copy with the live URL and character count and puts it on the clipboard. Paste it into X and LinkedIn.

Re-running it on any post reprints and re-copies that post's stored copy, any time.
