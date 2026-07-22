# Decisions: Homepage Refresh
Date: 2026-03-03

Update the homepage to reflect a current CTO/builder identity while preserving the structured layout and opinionated voice of the existing design. Changes are content-only across `_config.yml` and `index.html` — no structural or layout changes.

## D1: Site description and metadata
**Question:** What should the site description say, and does the unused `bio` field stay?
**Firmness:** Firm
**Options considered:** Keep "Building better code"; new builder-focused tagline.
**Chosen:** Change `description` to "Building stuff that matters". Remove the `bio` field (not referenced in any template or layout).
**Rationale:** The old description reads as generic craft; the new one matches the builder identity. The `bio` field is dead metadata.

## D2: Header summary line
**Question:** What identity should the header lead with?
**Firmness:** Firm
**Options considered:** "Engineering leader. Building teams and platforms with impact." (current); a tighter builder-first line.
**Chosen:** "CTO who still writes code." Tagline, avatar, and social icons stay unchanged.
**Rationale:** Concrete and opinionated over generic leadership framing.

## D3: Conversational section headers
**Question:** How should section headers read?
**Firmness:** Firm
**Options considered:** Keep the existing labels; a cohesive first-person conversational set.
**Chosen:** TL;DR → "How I work"; The Path So Far → "Where I've been"; Open Source → "What I'm shipping".
**Rationale:** First-person headers match the blog's direct voice and read as one cohesive set.

## D4: Career narrative
**Question:** Should the "Where I've been" copy stay vague or name specifics?
**Firmness:** Firm
**Options considered:** Keep the vague career narrative; replace with specific, concise history.
**Chosen:** Specific copy — founding technology leader at BetterUp (first engineer to 140+ person org, pre-revenue to $250M+ ARR), Fortune 5 startup incubator, core engineer at Socialcast through the VMware acquisition. Keep the closing "learned a *lot*... *more* learning yet to do" line.
**Rationale:** Concrete detail earns credibility; the closing line keeps the humility of the original voice.

## D5: New "What I'm thinking about" section
**Question:** Should the homepage surface current thinking, and how?
**Firmness:** Firm
**Options considered:** No such section; a curated list of linked posts.
**Chosen:** Insert a new section between "Where I've been" and "What I'm shipping" with three hardcoded linked posts (greenhouse innovation incubator, agentic engineering, most powerful part of your roadmap) and a "Read more..." link to the archive.
**Rationale:** Gives the homepage a current point of view. Hardcoding is the starting point — see D7 for making it dynamic.

## D6: "What I'm shipping" intro
**Question:** How should the open source section introduce itself?
**Firmness:** Firm
**Options considered:** Keep the "shoulders of giants" intro; a direct "shipping since 2005" intro.
**Chosen:** "I've been shipping open source since 2005. The majority of my work is on GitHub. Some highlights:" Keep the existing three projects (multitenant, backgrounded, gitx). Remove the now-duplicate "Full inventory on GitHub" paragraph since GitHub is linked in the intro.
**Rationale:** Direct and specific; drops the cliché.

## D7: Dynamic "What I'm thinking about" list
**Question:** Should the featured-posts list be driven dynamically instead of hardcoded?
**Firmness:** Open
**Options considered:** See research.md — front matter `featured: true` flag, tag-based query, most-recent-N, or hybrid.
**Chosen:** unresolved — research owns laying out the tradeoffs.
**Rationale:** Editorial control vs. zero-maintenance is the core tension; needs a call before building.

## D8: Configurable open source project list
**Question:** Should the project list move out of hardcoded HTML into config/data?
**Firmness:** Open
**Options considered:** See research.md — `_config.yml` list, `_data/projects.yml`, or GitHub API at build time.
**Chosen:** unresolved — research owns laying out the tradeoffs.
**Rationale:** Content-vs-template separation vs. build dependencies; needs a call before building.

## Out of Scope (Not Changing)
- Avatar image and layout structure
- Social icons (`social.html` include)
- Nav structure (Home, Articles, Search)
- "How I work" values content (all five bullets stay)
- Project list content (same three projects)

## Research Focus Areas
- How to drive the "What I'm thinking about" list dynamically (front matter `featured` flag + Liquid loop, `site.tags` query, most-recent-N, or hybrid) — resolves D7.
- How to make the open source project list configurable (`_config.yml` list, `_data/projects.yml`, or GitHub API at build time) — resolves D8.
