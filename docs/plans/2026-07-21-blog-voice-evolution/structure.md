# Structure: blog-voice-evolution
Date: 2026-07-21
Decisions: [decisions.md](decisions.md)
Research: [research.md](research.md)

Deliverable is a **private analytical report** (D1, Firm) plus a **visual companion** (D6, Preference). Both stay out of `_posts/` so Jekyll never publishes them; they live in this plan folder. The report is the must-have; the visual is a flagged nice-to-have.

## Phase 1: Evidence pack (verified quotes & citations)
**Goal:** Assemble the raw material the report and visual both draw on: per-era, per-dimension quote list with exact source references, each quote confirmed against the actual post file. This isolates "are the facts right" from "does the prose read well," so citation accuracy is testable on its own.
**Files touched:** `docs/plans/2026-07-21-blog-voice-evolution/evidence.md` (new)
**Depends on:** nothing
**Verification:** Every quote in `evidence.md` is spot-checked against its cited `_posts/*.md` file (e.g. grep the quoted phrase in the named file and confirm a hit). The Roam Primals figures match `((NKUuTwhnE))` (Good 3.52 / Safe 3.28 / Enticing 3.82 / Alive 3.79). No quote lacks a file reference.

## Phase 2: Write the report
**Goal:** The full private report. Structure: (1) short framing + the four eras (Ranter → Evangelist → Team Lead → Leader) with dates/post-counts; (2) the four dimensions — Tone & voice, Identity shift, Beliefs & values, World-view (D3, Firm), the World-view section carrying the Primals read and the fixed→growth-mindset arc the user asked for, incl. the "mindless drones (2005) → talent is equally distributed (2026)" reversal and the social/self-vs-skills nuance; (3) a fully candid section (D4, Firm) naming regressions/contradictions/blind spots (dogmatism, cruelty toward tools/people, the faith thread that receded, single-datapoint caveat on Primals). Roam jargon translated to plain English ([[feedback-roam-jargon]]); voice stays factual, not blog-prose.
**Files touched:** `docs/plans/2026-07-21-blog-voice-evolution/report.md` (new)
**Depends on:** Phase 1
**Verification:** Report covers all four dimensions + the fixed→growth arc + a candid/negatives section. Every claim traces to an `evidence.md` entry or the research file. Writing-style gate applied (no "it's not X it's Y," no inflated-significance language, varied sentence length, em dashes sparse) per CLAUDE.md anti-patterns. Read end-to-end for accuracy against the source posts.

## Phase 3: Visual companion (Serves Preference decision D6 — confirm it's worth building)
**Goal:** A single self-contained HTML page to explore the arc at a glance: an era timeline (with real post-counts/year — the only hard data), era cards summarizing identity/tone/world-view, the fixed→growth trajectory, and 1–2 signature before/after quote pairs. Any "tone" or per-era Primals curve is explicitly labeled **analyst-rated, not measured** (research Constraints); post-count/year is the one series shown as real data.
**Files touched:** `docs/plans/2026-07-21-blog-voice-evolution/evolution.html` (new)
**Depends on:** Phase 2
**Verification:** Opens standalone in a browser with no external requests (no CDN/font/network calls); renders in both light and dark; body never scrolls horizontally on mobile width; every analyst-estimated element is visibly labeled as inference, not data; post-counts match the inventory in `research.md`. Decision to publish it as a private Artifact vs. keep it a local file is the user's — default to local file unless they ask to publish.

## Out of Scope
- Publishing anything to `_posts/` or the live blog (D1 Firm: private report, not for publication). Turning this into a blog post is a separate, later ask.
- Computed/NLP sentiment or readability scoring across the archive — not requested; research flagged tone as a qualitative read. (Revisitable: the user offered measurable metrics like exclamation/profanity counts and post length; only add if they opt in.)
- Reading every one of the 291 posts exhaustively — analysis rests on representative per-era sampling (144-post eras were sampled, not fully read).
- Any change to the Roam graph — the Primals block was read-only input.
- A full interactive dashboard with filtering/drill-down — D6 is a Preference for a light visual, not a data app.
