# Decisions: social-posting-workflow
Date: 2026-09-09

Goal: make drafting and posting social content a step in the blog writing workflow, targeting X and LinkedIn, with short reusable copy.

Prior art: none. A search of all local Claude transcripts found no previous conversation about a social posting workflow — the LinkedIn matches are all in the `tao` project's people-research graph, where LinkedIn is a citation source attribute. This is greenfield.

## D1: Posting mechanism
**Question:** How should the actual posting to X and LinkedIn happen?
**Firmness:** Preference
**Options considered:**
- Copy-paste handoff — zero auth, zero tokens, zero maintenance; costs two paste actions per post
- Direct API posting (X API v2 + LinkedIn UGC Posts) — fully automated; needs OAuth apps, stored tokens, refresh handling, and an approved LinkedIn app for personal posting
- Third-party scheduler (Buffer/Typefully) — one integration instead of two, gives a queue; adds a paid dependency and an outbound destination
- Browser automation to pre-fill compose windows — no tokens, but brittle
**Chosen:** Copy-paste handoff. The workflow drafts the text, prints it, and copies it to the clipboard. Ryan pastes into X and LinkedIn himself.
**Rationale:** Two posts per publish is a trivial manual cost, and the automated paths all buy that back with credential storage and refresh-token maintenance. Would change if publishing frequency rose enough that manual pasting became the bottleneck, or if a maintained LinkedIn/X MCP became available in-session.

## D2: Where the social copy lives
**Question:** Where should the drafted social copy be stored?
**Firmness:** Preference
**Options considered:**
- `social:` front matter field on the post — travels with the post, versioned in git, editable in the file already being revised, re-printable any time; some risk of leaking into templates
- Ephemeral terminal output — nothing to maintain; no record of what was posted, no cross-session revision
- Sidecar file (`_social/YYYY-MM-DD-slug.md`) — keeps the post clean, room for variants; second file to keep in sync, new directory
**Chosen:** A `social:` key in the post's YAML front matter.
**Rationale:** Keeps one file as the unit of work and gives a git record of what was actually posted. Depends on confirming no layout or feed template renders unknown front matter keys (see Research).

## D3: Where the social step sits in the writing flow
**Question:** At which point in the writing-a-blog-post flow should the social copy get drafted?
**Firmness:** Preference
**Options considered:**
- During the final read pass, then printed by `bin/promote` with the live URL
- Only after promote, as a separate step
- Early at draft creation, as a thesis test
**Chosen:** Only after promote. The post is live before any social copy is written.
**Rationale:** Ryan chose separation over integration here, against the recommended option — the writing flow stays untouched and social is its own concern. Accepted tradeoff: social is a step that can be skipped or forgotten.

## D4: One reusable text across both platforms
**Question:** Should the copy be one shared text or per-platform variants?
**Firmness:** Firm
**Options considered:** single shared text; base text plus a LinkedIn expansion; separate per-platform drafts
**Chosen:** One single block of text that pastes identically into X and LinkedIn. No per-platform variants, no hashtags, no @-mentions.
**Rationale:** Ryan's own framing of the requirement in the original ask — "simple + short posting that is reusable across multiple platforms." Treat as a fixed constraint; do not build variant handling.

## D5: Length ceiling and structure
**Question:** What shape and length should the generated post take?
**Firmness:** Preference
**Options considered:**
- <=280 chars with the link at the end — fits X, therefore fits everywhere
- Pull-quote lifted verbatim from the post plus the URL — guaranteed on-voice, less freedom
- Hook plus 2-3 line body (~500 chars) — reads better on LinkedIn but breaks D4
**Chosen:** One text of <=280 characters, URL on its own line at the end. The URL counts at its **literal length** (46-75 chars on this site, per research), not X's 23-char t.co cost. Effective prose budget: 205-234 characters depending on slug length.
**Rationale:** X's limit is the binding constraint, so satisfying it satisfies both platforms. The 280 number itself is a sensible default rather than a requirement; the reusability behind it (D4) is the firm part.
**Follow-up (resolved 2026-09-09, post-research):** Research established that X charges a flat 23 chars for any link via t.co while LinkedIn has no 280 limit, so counting literally is conservative by 23-52 characters. Ryan chose the literal count anyway. Firmness: Preference. Effect: the drafting step measures the real assembled string, no platform-specific arithmetic, and the candidate display shows one honest number. Costs some prose room X would not have charged for.

## D6: Trigger
**Question:** How does the social step get invoked after promote?
**Firmness:** Preference
**Options considered:**
- `bin/promote` prints a one-line nudge pointing at the social step
- A step in the writing-a-blog-post skill plus a standalone entry point, invoked manually
- Automatic — promote drafts and copies without asking
**Chosen:** A step in the writing-a-blog-post skill, run when Ryan wants it. `bin/promote` is not modified.
**Rationale:** Ryan chose this over the recommended nudge, consistent with D3's separation. He wants no coupling and no prompting from the publish path. Resolves the original ask's tentative "this may need to go in my writing blog post skill" — it does.

## D7: Draft review loop
**Question:** When drafting, how much should there be to choose from?
**Firmness:** Preference
**Options considered:**
- Three candidates from distinct angles (a claim, a concrete scene, a question) with char counts, pick or edit one
- One draft, revise in conversation
- One draft, no review
**Chosen:** Three candidates with character counts. Ryan picks one or edits it; the chosen text is written to `social:` and copied to the clipboard.
**Rationale:** Picking from options is faster than critiquing a single draft, and three angles surface a better hook than one attempt. Candidate count is adjustable.

## D8: Voice guardrails apply to social copy
**Question:** Does social copy go through the same voice and anti-pattern gates as post prose?
**Firmness:** Preference (my default — Ryan did not weigh in on this)
**Options considered:** run the existing `writing-style` gate on candidates; skip it for short copy; add a short-form-specific checklist
**Chosen:** Candidates are held to the same voice rules as the blog — first person active, concrete scene over thesis, no "it's not X it's Y", no inflated significance, no promotional adjectives.
**Rationale:** The copy posts under Ryan's name and is the first thing readers see, so off-key social copy is worse than off-key body prose. Recorded as my default, not a stated requirement; whether that means literally invoking the `writing-style` skill or inlining a short checklist is a research question.

## D9: Own skill, not a phase in the blog skill
**Question:** Should the social step be a new phase inside `writing-a-blog-post`, or its own skill kicked off at the end of that workflow?
**Firmness:** Preference
**Decided:** 2026-09-09, after research
**Options considered:**
- A new Phase 7 inside `.claude/skills/writing-a-blog-post/SKILL.md` — the candidate-presentation pattern and voice context are already there; one less file. Requires amending `SKILL.md:18` ("Not for a post already in `_posts/`") to carve out an exception, and grows a 278-line, 6-phase skill to span two lifecycle stages.
- A separate skill invoked from the end of the blog workflow — `SKILL.md:18` stays intact, the new skill carries its own trigger description, and only what social drafting needs gets loaded. Duplicates a few lines of candidate-presentation and voice context.
**Chosen:** A new skill, `.claude/skills/sharing-on-social/`. One line at `SKILL.md:240` points to it, the way `writing-style` is already invoked there.
**Naming:** Named for the job to be done — sharing a post on social — not for the drafting step. Drafting is one part of that job, and manual pasting (D1) is an implementation detail of it, not its definition. Follows the gerund convention of `writing-a-blog-post`. Ryan's call: "even if I manually post on the platforms, that's an implementation detail vs the actual job to be done."
**Rationale:** Four grounded reasons from research: (1) `SKILL.md:18` currently does real work by keeping the skill off published posts, and an exception weakens an entry condition that is otherwise trusted; (2) the house pattern is already separate-skill-invoked-by-name — `writing-style` and `verifying-claims` at `:142`, `:212`, `:213`, `:240`, `:265`; (3) the blog skill's description ends at "a final read before running `bin/promote`", so extending it to cover published posts would load all 278 lines (Roam skeleton-building, claim budgets, citation policy) for a 280-character task; (4) consistent with D3 and D6, where Ryan twice chose separation over coupling. Would change if the two skills turned out to need so much shared voice context that the duplication exceeded the cost of one larger skill.

## Research Focus Areas
- How is `.claude/skills/writing-a-blog-post/SKILL.md` structured (phases, final read, promote step)? Where does a post-promote social step attach, and does it already have a standalone-entry-point pattern to follow?
- What is the site's permalink format in `_config.yml`, and can the live post URL be derived from a `_posts/YYYY-MM-DD-slug.md` filename alone?
- Do any layouts, includes, `atom.xml`, `index.html`, or `_plugins` iterate over arbitrary front matter keys such that an unknown `social:` key would render on the page or leak into the feed? Do any existing posts already carry a `social:` or similar key?
- What does `bin/check-social-preview` do, and does it already compute the canonical URL or og: metadata that the social step could reuse instead of recomputing?
- What does `bin/promote` output today, and does it already print the published path or URL? (D6 says don't modify it — confirm nothing needs to change.)
- What are the shared conventions across `bin/` scripts (shell, arg handling, error handling, whether any already use `pbcopy`)? Is a `bin/` script warranted for the mechanical print-and-copy half, with the skill owning the LLM drafting half?
- How should the URL be counted against the 280-char budget? X shortens all links to a fixed 23 chars via t.co; LinkedIn does not shorten. Determine which count the candidate display should show.
- Does the `writing-style` skill have rules that misfire on 280-char copy (e.g. "vary sentence and paragraph length"), and does it need a short-form mode or an inlined subset instead?
