# Structure: social-posting-workflow
Date: 2026-09-09
Decisions: [decisions.md](decisions.md)
Research: [research.md](research.md)

Four phases. Phase 1 is the mechanical half (a `bin/` script), Phase 2 the judgment half (a new standalone skill, per D9), Phase 3 the voice guardrail, Phase 4 the docs. Phase 1 ships and is usable on its own with a hand-written `social:` key.

## Phase 1: `bin/social` — assemble, print, copy
**Goal:** Given a `_posts/` path, read its `social:` front matter value, derive the live URL from the filename, print the assembled post with its character count, and copy it to the clipboard. No LLM involved — this is the part that has to be right every time.

Follows house conventions from research: `#!/usr/bin/env bash`, bare `set -e`, `usage()` reachable via `-h|--help` and a missing argument, `Error: <detail>` to stdout, exit 1, no color, repo-relative paths assuming invocation from the repo root, no shared helper.

URL derivation duplicates the permalink shape rather than parsing YAML — consistent with `bin/draft` and `bin/promote` each owning their own date regex, and there is no YAML-parsing or `yq` precedent in `bin/`. Prefix comes from `_config.yml:11` (`https://www.codecrate.com`), shape from `_config.yml:6` (`/:year/:month/:title.html`).

Character count is the literal assembled string per D5 — real URL length, no t.co arithmetic.

**Files touched:** `bin/social` (new, mode 0755)
**Depends on:** nothing
**Verification:**
- `bin/social` → prints usage, exit 1. `bin/social -h` → usage, exit 0.
- `bin/social _posts/nope.md` → `Error: post not found: _posts/nope.md`, exit 1.
- `bin/social _posts/2026-09-08-the-finish-decides-the-shot.md` on a post with no `social:` key → a clear error naming the missing key, exit 1.
- Hand-add a `social:` value to that post, re-run: printed URL must be exactly `https://www.codecrate.com/2026/09/the-finish-decides-the-shot.html`; reported count must equal prose + separator + 66. Confirm `pbpaste` matches the printed block byte for byte. Then `git checkout` the post to revert.
- Confirm the count math against a second post with a different slug length (`_posts/2026-04-10-team-topology-ownership.md`, URL 62 chars).

## Phase 2: New `sharing-on-social` skill
**Goal:** A standalone skill that owns the whole job of getting a published post shared: read the post, offer three candidates from genuinely different angles with character counts, write the chosen one into the post's front matter as a `social:` key, and hand off to `bin/social` for the paste. Drafting is one step inside it, and the manual paste (D1) is an implementation detail of the job, not its boundary. Invoked on demand, not triggered by `bin/promote` (D6), and living outside `writing-a-blog-post` (D9).

The new skill's own file needs:
- A frontmatter `description` whose trigger surface is social copy for a published post — distinct enough from `writing-a-blog-post`'s ("...a final read before running `bin/promote`") that neither steals the other's invocations.
- A candidate display format. The house pattern exists at `writing-a-blog-post/SKILL.md:33` — "three or four options taking genuinely different angles", escalating by asking what dimension is wrong rather than generating more — but research found no display template anywhere in the repo, so this skill establishes one.
- The `social:` write: a folded `>` scalar, value indented 2 spaces, unquoted, placed after `title:`, matching all 9 `featured_description` uses. Because the skill edits the file directly rather than through a script, the front-matter shape variance research flagged (indented vs. flush-left tags, blank line after the fence) resolves itself by reading before editing.
- A closing handoff to `bin/social`, mirroring how `writing-a-blog-post:240` hands off to `bin/promote`.

The one change to the existing skill is a pointer line at `writing-a-blog-post/SKILL.md:240`, alongside the existing `bin/promote` handoff, in the same form as the `writing-style` invocation on that line. **`SKILL.md:18` is left intact** — that is the point of D9.

**Files touched:** `.claude/skills/sharing-on-social/SKILL.md` (new); `.claude/skills/writing-a-blog-post/SKILL.md` (one line at `:240`)
**Depends on:** Phase 1 (the skill's payoff is `bin/social` printing the result)
**Verification:**
- Invoke the new skill by name against `_posts/2026-09-08-the-finish-decides-the-shot.md`. Confirm three candidates, distinct angles, character counts shown.
- Confirm the chosen text lands in front matter in house style, and that `bin/social` on that post then prints it with the right URL.
- Confirm the two skills' descriptions don't collide: a draft-revision request should still route to `writing-a-blog-post`, and a "draft a social post for X" request to the new skill.
- `git diff .claude/skills/writing-a-blog-post/SKILL.md` shows exactly one changed line, and `:18` is not it.
- `bundle exec jekyll build` then `grep -ri 'social' _site/2026/09/the-finish-decides-the-shot.html` — the `social:` value must appear nowhere in the built page, the Atom feed, or `search.json`. (Research predicts inert; verify rather than assume.)
- `bin/check-social-preview _site/2026/09/the-finish-decides-the-shot.html` still passes.

## Phase 3: Short-form voice guardrail
**Goal:** Give the drafting phase the subset of voice rules that can actually fire on 280 characters, so candidates are held to the blog's voice without spurious failures.

*Serves Preference decision D8 — confirm it's worth building.* D8 was my default, not Ryan's stated requirement, and research narrowed what it can mean: `writing-style` has **no** short-form mode and **no** sentence-length rule at all (that one is `CLAUDE.md` item 4). Ten of its 19 checklist items cannot be evaluated on a single short block — em-dash and tic counting (`:305`, `:250`, `:307`), adjacent-sentence restatement and self-contradiction (`:300`, `:309`), bolded-takeaway rules (`:299`), paragraph-closer rules (`:301`), the colon cap (`:306`), citation-first openings (`:304`), the before/after specific-noun count (`:308`).

The cheap version of this phase is a short inline checklist in the new skill pointing at the applicable subset: Tier 1 in full (`:56-73`, including figurative `shape` at `:73`), Tier 2 lexical rows (`:80-95`), Tier 3 in full (`:103-112`), and the single-instance structural patterns — significance puff, superficial `-ing`, negative parallelism, rule-of-three, false ranges, scare quotes, universal claim. Plus the `CLAUDE.md` voice habits that survive at this length: first person and active, concrete over thesis, no "it's not X, it's Y".

The expensive version amends the `writing-style` skill itself with a short-form scope. That is a larger blast radius (the skill is global, used by every project) for a benefit confined to this workflow.

**Files touched:** `.claude/skills/sharing-on-social/SKILL.md` (inline checklist). Not `~/.claude/skills/writing-style/SKILL.md`, and not `writing-a-blog-post`.
**Depends on:** Phase 2
**Verification:** Feed the skill a deliberately slopped 280-char candidate containing Tier 1 words ("leverage", "showcase", figurative "shape") and confirm each is caught. Then confirm a clean two-sentence candidate passes without any length-dependent rule firing spuriously.

## Phase 4: Document the workflow
**Goal:** `CLAUDE.md`'s Workflow section documents `bin/draft` and `bin/promote` but would not mention the social step. Add it, and note the `social:` front matter key alongside the template.

`featured_description` is precedent for the gap being real: it exists on 9 posts and is documented only at its point of use (`_includes/head.html:3-7`), never in `CLAUDE.md`. Don't repeat that.

**Files touched:** `CLAUDE.md`
**Depends on:** Phases 1-3
**Verification:** `grep -n 'bin/social' /Users/ryansonnek/Projects/wireframe.github.com/CLAUDE.md` returns the workflow line. Read the Workflow and Front Matter Template sections to confirm they describe what was actually built.

## Out of Scope
- **API posting, schedulers, browser automation** — D1 chose copy-paste. No OAuth apps, no stored tokens, no Buffer/Typefully integration.
- **Per-platform variants, hashtags, @-mentions** — D4 is Firm on one reusable text. Do not build variant handling.
- **Changing `bin/promote`** — D6 is explicit. Research confirms its single output line already names the path the social step takes as input.
- **Amending the global `writing-style` skill** — Phase 3 keeps the guardrail local to the new skill. Revisit only if short-form copy becomes a need in other projects.
- **Restructuring `writing-a-blog-post`** — D9 limits the change there to one pointer line at `:240`. Its six phases, its `:18` entry conditions, and its `## Common Mistakes` table are untouched.
- **Retro-filling `social:` on the 296 existing posts** — the key is written when a post is published going forward.
- **Threads, multi-post sequences, resharing evergreen posts, scheduling or a queue** — none of these were raised.
- **Images, og: overrides, or per-post social preview cards** — `_includes/open-graph.html` and `bin/check-social-preview` already cover preview metadata; this workflow only produces text.
- **Fixing the pre-existing rough edges research turned up** — `bin/promote`'s last-positional-wins arg loop, the `SKILL.md:278` Phase 5/6 off-by-one, the dead `_includes/sidebar.html`, and the vestigial `jekyll-sitemap` declaration in `_config.yml:45-46`. Real but unrelated.
