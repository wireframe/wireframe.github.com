# Plan: blog-voice-evolution
Date: 2026-07-21
Decisions: [decisions.md](decisions.md)
Research: [research.md](research.md)
Structure: [structure.md](structure.md)

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Produce a private, fully-candid written report on how Ryan's tone, identity, beliefs, and world-view changed across four blog eras (2003→2026), plus an optional self-contained visual companion.

**Architecture:** Three sequential artifacts in the plan folder, never in `_posts/`. `evidence.md` (verified quote/citation bank) → `report.md` (the deliverable prose) → `evolution.html` (optional at-a-glance visual). Each quote is verified against its source post before it enters the report; every analyst inference (tone, per-era Primals) is labeled as inference, not data.

**Tech Stack:** Markdown (report/evidence), a single self-contained HTML file with inlined CSS/JS (visual). No build step, no external assets. Verification is `grep`/`rg` against `_posts/*.md` and manual read-through.

---

## Phase 1: Evidence pack (verified quotes & citations)

- [x] Task 1.1: Create the evidence scaffold
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evidence.md` (new)
  - Change: Add H1 title and a section per era (Ranter 2003–06, Evangelist 2007–09, Team Lead 2010–14, Leader 2015–26). Under each era, four subheads: Tone & voice, Identity, Beliefs & values, World-view. Add two cross-era sections at the end: "Primals anchor (Feb 2023)" and "Fixed→growth reversal pairs."
  - Test: `test -f docs/plans/2026-07-21-blog-voice-evolution/evidence.md && grep -c '^##' docs/plans/2026-07-21-blog-voice-evolution/evidence.md` returns ≥ 6.

- [x] Task 1.2: Populate & verify Era 1 (2003–06) quotes
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evidence.md`
  - Change: Add the Era-1 quotes from research with source paths: "clean _slow_ code any day" (`_posts/2006-04-13-performance-is-overrated.md`), "tossing yourself from a balcony" (`_posts/2006-06-14-when-will-hurting-stop.md`), "mindless drones" / "don't 'get it'" (`_posts/2005-10-10-real-world.md`), programmer-as-artist / Michelangelo (`_posts/2004-03-20-why-opensource-exists.md`), "curse of passion" / "strongest fibers" (`_posts/2006-03-20-curse-of-passion.md`), "change the world, right here, right now" (`_posts/2005-09-27-words-of-wisdom.md`), "Untested code is broken code" (`_posts/2005-10-05-untested-equals-broken.md`).
  - Test: For each quoted phrase, run `rg -F "<distinctive fragment>" _posts/<file>.md` and confirm a hit. Drop or correct any quote that does not match its source verbatim.

- [x] Task 1.3: Populate & verify Era 2 (2007–09) quotes
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evidence.md`
  - Change: Add Era-2 quotes with paths: startup/Java→Ruby pivot (`_posts/2008-04-21-open-wide.md`), "Prove it" / "I don't believe you" (`_posts/2008-04-30-say-it-do-it-prove-it.md`), "HTML5 is the light on the horizon" + AIR recant (`_posts/2009-08-03-end-of-adobe-air.md`), DI-as-testability-crutch (`_posts/2008-08-09-end-of-dependency-injection_09.md`), faith / "strongest strength" (`_posts/2008-11-28-my-strongest-strength.md`), "outcome is in God's hands" (`_posts/2009-01-28-3-keys-to-decision-making.md`), announces personal content (`_posts/2009-07-12-adios-jroller.md`).
  - Test: `rg -F` each fragment against its file; confirm hits; fix mismatches.

- [x] Task 1.4: Populate & verify Era 3 (2010–14) quotes
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evidence.md`
  - Change: Add Era-3 quotes with paths: "greatest crimes against humanity" (`_posts/2010-01-10-airfail-for-html-developers.md`), "unwilling to change…guaranteed to atrophy" + "Stay hungry. Stay foolish." (`_posts/2013-07-16-a-new-day.md`), "team of 25 developers" + "and my teams" (`_posts/2014-09-10-optimized-development-workflow.md`), "better to be wrong than undecided" / "Perfect is the enemy of good" (`_posts/2014-09-08-startup-words-of-wisdom.md`), "pragmatism vs dogma" (`_posts/2014-11-17-rspec-controllers-best-practices.md`), "mentor developers of the future" (`_posts/2011-01-14-3-es-of-engineering.md`), org move to `thegarage` / "We built" (`_posts/2014-01-20-replace-rake-with-thor.md`).
  - Test: `rg -F` each fragment against its file; confirm hits; fix mismatches.

- [x] Task 1.5: Populate & verify Era 4 (2015–26) quotes
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evidence.md`
  - Change: Add Era-4 quotes with paths: "It's about helping *them* achieve their full potential" (`_posts/2022-07-09-performance-review-mindset-shift.md`), PEBCAK / "oh shit realization" (`_posts/2023-11-23-my-no-shame-november-story.md`), "Talent is equally distributed. Opportunity is not." + "team is the atomic unit" + "engineer a culture" (`_posts/2026-05-30-engineering-your-remote-engineering-team.md`), "It all starts with ownership" (`_posts/2024-03-22-scaling-platform-quality.md`), "today is the worst these agents will ever be" (`_posts/2025-05-28-agentic-engineering.md`), "What a time to be alive" / "Programming is fun again" (`_posts/2025-08-25-hacker-renaissance.md`), "Every mental model is wrong…some are useful" (`_posts/2025-02-04-v2ooo.md`), "craftsmanship has no upper bound" (`_posts/2024-04-13-the-commit-cycle.md`), "best org design…is the clear one" (`_posts/2026-04-10-team-topology-ownership.md`).
  - Test: `rg -F` each fragment against its file; confirm hits; fix mismatches.

- [x] Task 1.6: Add Primals anchor + fixed→growth reversal pairs
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evidence.md`
  - Change: Record the Primals figures from Roam `((NKUuTwhnE))` — Good 3.52, Safe 3.28, Enticing 3.82, Alive 3.79 (Feb 2023, BetterUp ELT intensive) with the plain-English gloss of each dimension. Add the two headline reversal pairs as explicit before→after rows: (a) "mindless drones" 2005 (`_posts/2005-10-10-real-world.md`) → "Talent is equally distributed. Opportunity is not." 2026 (`_posts/2026-05-30-engineering-your-remote-engineering-team.md`); (b) PEBCAK/"User Error" → customer empathy (`_posts/2023-11-23-my-no-shame-november-story.md`).
  - Test: `grep -E '3\.52|3\.28|3\.82|3\.79' docs/plans/2026-07-21-blog-voice-evolution/evidence.md` returns all four; both reversal pairs present with both source files cited.

- [x] Task 1.7: Full citation sweep
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evidence.md`
  - Change: Confirm every quote line carries a `_posts/*.md` reference; remove any quote that failed verbatim verification in 1.2–1.5 (note removals inline).
  - Test: No quote bullet lacks a `_posts/` path; every cited file exists (`for f in $(grep -oE '_posts/[a-z0-9./-]+\.(md|markdown)' evidence.md | sort -u); do test -f "$f" || echo "MISSING $f"; done` prints nothing).

- [~] Commit Phase 1 — "add verified evidence pack for blog voice-evolution analysis"  (skipped: leave uncommitted per user)

## Phase 2: Write the report

- [x] Task 2.1: Report scaffold, framing, era table
  - File: `docs/plans/2026-07-21-blog-voice-evolution/report.md` (new)
  - Change: H1 + a 2–3 sentence purpose/audience line (private reflection for Ryan). Add an era-overview table: era name, years, post count (Ranter 2003–06 ~144, Evangelist 2007–09 ~83, Team Lead 2010–14 ~46, Leader 2015–26 ~15), one-line identity per era. Post counts come from `research.md` inventory.
  - Test: `grep -c '2003\|2007\|2010\|2015' report.md` confirms all four era boundaries present; table renders as valid markdown.

- [x] Task 2.2: Section — Tone & voice over time
  - File: `docs/plans/2026-07-21-blog-voice-evolution/report.md`
  - Change: Trace the arc: combative/profane/ALL-CAPS/typo-ridden (Eras 1–3) → punchy-but-civilized, cited-authority, humble-disclaimer (Era 4). Use 2–3 verified quotes from `evidence.md`. Name the constant DNA (rhetorical questions, anecdote openers, closing exhortations).
  - Test: Section cites ≥3 quotes, each present in `evidence.md`; both the "peak vitriol" and "civilized-but-still-punchy" ends are shown.

- [x] Task 2.3: Section — Identity shift (engineer → leader)
  - File: `docs/plans/2026-07-21-blog-voice-evolution/report.md`
  - Change: IC Java coder → startup Ruby evangelist → tech lead (2013 hinge) → senior eng/product leader at BetterUp. Anchor the 2013 pivot (`_posts/2013-07-16-a-new-day.md`) and the "unit of concern scales with role" pattern (method/gem → team lifecycle → org/culture).
  - Test: Section names all four role stages and the 2013 hinge; claims trace to evidence/research.

- [x] Task 2.4: Section — Beliefs & values (continuity vs. reversal)
  - File: `docs/plans/2026-07-21-blog-voice-evolution/report.md`
  - Change: Through-lines (testing, craft-over-cleverness, ship-fast, anti-bureaucracy, "make the right thing the easy thing") vs. documented reversals (dogma→pragmatism; developer-vs-user; self→others; AIR/DI recants). Reference [[reference-core-operating-constructs]] emergence.
  - Test: Section separates continuity from reversal; ≥3 through-lines and ≥3 reversals, each cited.

- [x] Task 2.5: Section — World-view (Primals + fixed→growth arc) [D3 Firm, user's focus]
  - File: `docs/plans/2026-07-21-blog-voice-evolution/report.md`
  - Change: Per-era world-view against the four Primals dimensions in plain English (translate "Primals/Enticing/Alive," per [[feedback-roam-jargon]]). State the fixed→growth arc with the key nuance: growth-minded about *skills* throughout, fixed-minded about *people/self* early. Lead with the headline reversal "mindless drones (2005) → talent is equally distributed (2026)" and the PEBCAK→empathy turn. Note the Primals row (Good 3.52 / Safe 3.28 / Enticing 3.82 / Alive 3.79) is the one measured datapoint (Feb 2023) and all earlier-era scores are inference.
  - Test: Section covers all four eras, both frameworks (Primals + fixed/growth), the two reversal pairs, and the skills-vs-self nuance; no untranslated Roam jargon (`grep -i 'primal\|enticing\|alive' report.md` — each occurrence has a plain-English gloss nearby).

- [x] Task 2.6: Section — Candid mirror (regressions, contradictions, blind spots) [D4 Firm]
  - File: `docs/plans/2026-07-21-blog-voice-evolution/report.md`
  - Change: Name, factually: early cruelty toward tools/people and its cost; dogmatism/absolutism; the explicit Christian-faith thread of Era 2 that later recedes from the public blog; the single-Feb-2023-datapoint limitation on Primals; unequal era sampling. Keep it grounded in cited text, not psychoanalysis.
  - Test: Section names ≥4 candid items, each tied to evidence or a research Constraint; tone is factual, not editorializing.

- [x] Task 2.7: Writing-style gate + read-through
  - File: `docs/plans/2026-07-21-blog-voice-evolution/report.md`
  - Change: Apply the `writing-style` skill and CLAUDE.md anti-patterns: remove any "it's not X, it's Y" constructions, inflated-significance words, superficial "-ing" closers; vary sentence/paragraph length; em dashes sparse. Read end-to-end confirming every claim matches its source post.
  - Test: `grep -niE "it'?s not .* it'?s|stands as a testament|watershed|profound impact|solidif|pivotal|transformative" report.md` returns nothing; manual read-through completed.

- [~] Commit Phase 2 — "write private blog voice-evolution report"  (skipped: leave uncommitted per user)

## Phase 3: Visual companion (Serves Preference decision D6 — confirm before expanding)

> Flagged: this whole phase serves a Preference ("would be cool"), not a Firm requirement. Keep it to the two tasks below; do not expand into a dashboard. Confirm with Ryan whether he wants it as a local file (default) or a private Artifact before publishing anywhere.

- [x] Task 3.1: Build the self-contained visual
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evolution.html` (new)
  - Change: One HTML file, all CSS/JS inlined, no external requests. Contents: (1) a post-count-per-year timeline (real data from `research.md`, the four eras shaded); (2) four era cards (identity / tone one-liner / world-view); (3) a fixed→growth track across eras; (4) the two before/after quote pairs. Label every tone/Primals element "analyst estimate — not measured"; label the post-count series as the only real data. Support light+dark via `prefers-color-scheme` and `:root[data-theme]`; wide elements scroll inside `overflow-x:auto`.
  - Test: Open in a browser; confirm it renders offline with no network/CDN/font requests (check devtools network tab is empty of external hosts).

- [x] Task 3.2: Verify visual accuracy & robustness
  - File: `docs/plans/2026-07-21-blog-voice-evolution/evolution.html`
  - Change: Fix any issue found in verification.
  - Test: Post counts in the timeline match `research.md` (2004:30, 2005:57, 2006:54, 2009:33, 2014:13, 2025:6, etc.); every inferred element is visibly labeled as inference; page body does not scroll horizontally at 375px width; both themes legible.

- [~] Commit Phase 3 — "add self-contained visual companion for voice-evolution analysis"  (skipped: leave uncommitted per user)

---

## Notes for the executor
- Nothing in this plan writes to `_posts/` or the published site (D1 Firm). All outputs stay in the plan folder.
- Commits follow the user's convention: no Claude attribution, do not squash.
- If a quote fails verbatim verification against its source post, correct it to the actual text or drop it — never keep an unverified quote in the report.
