# Structure: Homepage Refresh
Date: 2026-03-03
Decisions: [decisions.md](decisions.md)
Research: [research.md](research.md)

## Phase 1: Site metadata
**Goal:** Update site-level metadata to the builder identity and drop dead config.
**Files touched:** `_config.yml`
**Depends on:** nothing
**Verification:** `description` reads "Building stuff that matters"; no `bio` key remains; `bundle exec jekyll build` succeeds.

## Phase 2: Homepage identity and content
**Goal:** Rewrite the homepage header, section headers, career narrative, and open source intro, and add the "What I'm thinking about" section — all content-only edits to the existing layout.
**Files touched:** `index.html`
**Depends on:** nothing (independent of Phase 1, but grouped after it)
**Verification:** Header shows "CTO who still writes code."; headers read "How I work" / "Where I've been" / "What I'm shipping"; career narrative names BetterUp, Fortune 5 incubator, Socialcast/VMware; new "What I'm thinking about" section has three linked posts plus a "Read more..." archive link; open source intro reads "shipping open source since 2005" with no duplicate GitHub paragraph.

## Phase 3: Visual verification
**Goal:** Confirm the rendered homepage matches intent with no layout or styling regressions.
**Files touched:** none (manual check)
**Depends on:** Phase 1, Phase 2
**Verification:** `bundle exec jekyll serve`, open `http://localhost:4000`, and walk the checklist in plan.md Phase 3 (all sections present, all three post links resolve, avatar and social icons still render).

## Out of Scope
- Making the "What I'm thinking about" list dynamic (D7) — hardcoded links ship first; dynamic approach deferred pending the D7 call in research.md.
- Making the open source project list configurable (D8) — stays hardcoded HTML; deferred pending the D8 call in research.md.
