# Research: social-posting-workflow
Date: 2026-09-09
Decisions: [decisions.md](decisions.md)

## Where a post-promote social step attaches in the blog skill
**Findings:**
- `.claude/skills/writing-a-blog-post/SKILL.md` is 278 lines, a single file. No `references/`, `scripts/`, or `assets/` subdirectory.
- Six phases: Phase 1 Align on the Bones (`:20`), Phase 2 Build the Skeleton in Roam (`:38`), Phase 3 Move to Jekyll and Draft Prose (`:177`), Phase 4 Revise Section by Section (`:198`), Phase 5 Flavor (`:221`), Phase 6 Full-Post Review (`:231`). Then a `## Common Mistakes` table (`:242`-`:278`).
- The workflow's terminal instruction is `SKILL.md:240`: "Run the `writing-style` skill as the final pass. When the user is happy: `bin/promote _drafts/<file>.md [--date YYYY-MM-DD]`." Nothing follows it but the mistakes table, so a post-promote step has no existing successor section — it would be a new Phase 7 inserted between `:240` and `:242`.
- `bin/promote` appears exactly twice: `:3` (frontmatter description) and `:240`.
- The skill does not mention social media, X, Twitter, LinkedIn, Bluesky, Mastodon, Hacker News, sharing, announcing, or distribution anywhere. Zero occurrences. Every "promot-" hit is `bin/promote` (`:3`, `:240`), Roam "promoted-idea wrappers" (`:168`), or "publishable" in the scrub-internal-data sense (`:238`, `:276`).
- Reference: `.claude/skills/writing-a-blog-post/SKILL.md:231-240`

**Standalone entry points:**
- One exists, thin: `SKILL.md:17` — "User has a partially-drafted post to review, revise, or restructure — start at Phase 4", inside `## When to Use`. That is the only "enter at phase N" instruction in the file. No phase declares its own entry preconditions or a "if resuming here, first do X" preamble.
- Ordering gates exist but are not entry points: `:222` ("Run it after the citation and deslop passes, never before"), `:199` (content, then claims, then style), `:27` (confirm title and outline before Phase 2).

**House pattern for presenting candidates (relevant to D7):**
- Exactly one instance, `SKILL.md:33`: "**When the user rejects a title or header, offer three or four options taking genuinely different angles.** If several rounds fail, ask what dimension is wrong rather than generating more." Restated in the mistakes table at `:274`.
- Documentary shape of that pattern: count is "three or four", selection criterion is "genuinely different angles", escalation on repeated failure is to ask which dimension is wrong rather than generate more. There is **no formatting template** — no numbered-list example, no table, no per-option rationale field.
- D7's "three candidates, genuinely different angles" matches the existing house pattern. What does not exist is a display format to copy.

**Cross-skill references:**
- `verifying-claims` at `:142`, `:212`, `:265`. `writing-style` at `:213` ("Then style, against `CLAUDE.md`'s anti-patterns and the `writing-style` skill") and `:240`.
- Front matter keys the skill instructs writing: only `title:` (`:34`, `:237`) and `tags:` (`:237`). No `date`, `layout`, `description`, `image`, `excerpt`, `permalink`, or any social/OG key.
- Note: `SKILL.md:278` refers to "the Phase 5 review", but Phase 5 is Flavor and Phase 6 is the review. Pre-existing off-by-one in the mistakes table.

## Live URL derivation from a post filename
**Findings:**
- `_config.yml:6` — `permalink: /:year/:month/:title.html`
- `_config.yml:11` — `url: https://www.codecrate.com`. No `baseurl:` key exists in `_config.yml`. `CNAME` is `www.codecrate.com`.
- The URL is fully derivable from the filename alone: `_posts/2026-09-09-my-slug.md` → `https://www.codecrate.com/2026/09/my-slug.html`.
- Confirmed against built output: `_site/2026/09/the-finish-decides-the-shot.html`, `_site/2026/08/from-pilot-to-air-traffic-controller.html`, `_site/2025/12/my-mcp-learnings.html`. Flat `YYYY/MM/slug.html` — no per-post directory, no trailing-slash form.
- **Length formula: 39 + slug length.** Fixed prefix `https://www.codecrate.com/2026/09/` is 34 chars, `.html` is 5.
- Measured real URLs: 46 chars (`/2026/09/my-slug.html`), 62 (`team-topology-ownership`), 66 (`the-finish-decides-the-shot`), 75 (`from-pilot-to-air-traffic-controller`).
- The checked-in `_site/` was built with the dev config and carries `og:url` / canonical of `http://localhost:4000/...` — `bin/server:3` passes `_config.yml,_config-dev.yml` and `_config-dev.yml:1` sets `url: http://localhost:4000`. `_config-dev.yml` has no `permalink` or `baseurl`, so the path portion is identical in both environments. Production builds run from `_config.yml` only, via `.github/workflows/jekyll.yml:45`.
- Consequence: a social step must derive the URL from `_config.yml` + filename. Scraping `og:url` out of the local `_site/` build would yield a localhost URL.

## Whether a `social:` front matter key leaks into the rendered site
**Findings:**
- `_plugins/` contains only `.gitkeep` (0 bytes). No custom plugins.
- Zero instances of `jsonify`, `| inspect`, `to_liquid`, `for key in page`, `page[...]`, `post[...]`, or any loop over front matter keys — searched across `_layouts/`, `_includes/`, `_plugins/`, `atom.xml`, `index.html`, `archive.html`, `search.json`, `404.md`, `resume.md`, `tags/index.html`, `_data/`. Every front matter access is an explicit named lookup.
- Complete set of front matter keys any template reads: `title`, `headline`, `link`, `author`, `date`, `modified`, `comments`, `ads`, `tags`, `category`, `featured_description`, `excerpt`, `image.feature`, `image.thumb`, `image.credit`, `image.creditlink`, plus Jekyll-generated `url`, `id`, `content`.
- `atom.xml:20-24` emits only `title`, `url`, `date`, `id`, `content`. `search.json:7-12` emits only `title`, `category`, `tags`, `url`, `date`. `tags/index.html:21-22` emits only `title`, `url`, `date`.
- No sitemap is generated. `_config.yml:45-46` declares `gems: - jekyll-sitemap`, but `gems:` is the deprecated Jekyll 2 key, `jekyll-sitemap` is absent from the `Gemfile` (which lists only `jekyll` and `html-proofer`), and `_site/sitemap.xml` does not exist. The `sitemap: false` keys in `404.md:5` and `search.json:2` are vestigial.
- **A `social:` key would render nowhere** — not in HTML, not in the Atom feed, not in `search.json`, not in the tag index. D2 is safe as specified.
- The only indirect exposure path is Jekyll's auto-`excerpt` (`_includes/head.html:9`), which derives from post *body* content; front matter sits above the fence and never enters it.
- Reference: `_layouts/post.html:16-47`, `_includes/head.html:2-26`, `_includes/open-graph.html:8-17`, `atom.xml:18-24`, `search.json:5-12`
- Dead file noted: `_includes/sidebar.html` is not referenced by any layout or include.

## Existing front matter keys and style conventions
**Findings:**
- 296 files in `_posts/`. `_drafts/` is currently **empty** (0 files).
- **Exactly three keys are in use across all 296 posts:** `title` (296), `tags` (296), `featured_description` (9). That is the complete set — no nested keys anywhere, and no `image:`, `layout:`, `author:`, `date:`, `category:`, or `permalink:` in any post file.
- `social:`, `tweet:`, `share:`, `summary:` — absent everywhere. `excerpt:` and `description:` appear as front matter only in `tags/index.html:4`, `404.md:4`, `resume.md:4`, never in a post.
- **`featured_description` is the direct house precedent for D2.** All 9 uses are a folded block scalar `>` with the value indented 2 spaces on the following line, unquoted. The literal `|` scalar appears nowhere in `_posts/`. Example, `_posts/2026-09-08-the-finish-decides-the-shot.md:1-10`:
  ```yaml
  ---
  title: "The Finish Decides the Shot"
  featured_description: >
    Why the work after the experiment decides what the experiment was worth
  tags:
  - engineering
  - product-development
  ---
  ```
- Dominant recent key order is `title` → `featured_description` → `tags` (`2026-09-08`, `2026-08-21`, `2026-08-07`, `2026-02-05`). `_posts/2026-04-10-team-topology-ownership.md` inverts to `title` → `tags` → `featured_description`. `title` is always first and always double-quoted, including when it contains a colon.
- Tag list style varies: mostly flush-left `- tag`, but `_posts/2026-05-30-engineering-your-remote-engineering-team.md:3` uses `tags: ` with trailing whitespace and 2-space-indented `  - tag`.
- 251 of 296 posts have a blank line immediately after the opening `---`, which is what `bin/draft:23-30` emits. None of the 2026 posts have it.
- `featured_description` is documented inline at `_includes/head.html:3-7` ("A hand written featured_description beats Jekyll's auto excerpt") and is **not** mentioned in `CLAUDE.md`, whose front matter template (`CLAUDE.md:81-88`) shows only `title` and `tags`.
- Consequence for D2: any tooling that inserts a `social:` key must tolerate both tag-list indentation styles and the presence or absence of the leading blank line.

## `bin/promote` — what it outputs today
**Findings:**
- 63 lines. On success it prints **exactly one line**, `bin/promote:63`: `Promoted draft to post: _posts/YYYY-MM-DD-slug.md`. `git mv` at `:61` is silent.
- It prints the repo-relative `_posts/` path. It does **not** construct or print a live URL, and never reads `_config.yml`.
- After the move it does nothing: no `git add`/`commit`/`push`, no `$EDITOR`, no build, no clipboard, no next-steps text. The `echo` at `:63` is the last statement in the file.
- `--date` accepts both `--date YYYY-MM-DD` (`:19-22`) and `--date=YYYY-MM-DD` (`:23-26`); defaults to today (`:15`); validated by the format-only regex `^[0-9]{4}-[0-9]{2}-[0-9]{2}$` (`:43`). No calendar-validity check.
- Slug handling: `:53` strips the date prefix with `sed -E 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}-//'`, `:54` re-prefixes with `$PUBLISH_DATE`, so the draft's original date is replaced rather than preserved.
- Preconditions checked: draft exists (`:48`), destination absent (`:56`). No `mkdir -p _posts`, no git-repo check, no `mv` fallback.
- Rough edges, pre-existing: the arg loop's `*)` branch (`:31-34`) overwrites `DRAFT` on every non-flag argument, so with multiple positionals the last wins; `--date` with no following value sets `PUBLISH_DATE` empty and fails the regex.
- **D6 confirmed: nothing in `bin/promote` needs to change.** Its single output line already names the exact `_posts/` path a social step takes as input.

## `bin/check-social-preview` — reusable or not
**Findings:**
- 123 lines, read-only validator over already-built HTML under `_site`. Header comment `:3`: "Verify built pages carry the metadata LinkedIn and X need to render a preview."
- Checks seven tags per page (`:88-94`): presence only for `og:title`, `og:description`, `og:type`, `twitter:card`; presence + absolute-URL for `og:url`; presence + absolute-URL + file-exists-in-build for `og:image` and `twitter:image`.
- **It never constructs a URL.** It only reads `og:url` out of built HTML and asserts a scheme prefix. It does not read `_config.yml` and does not hardcode a domain.
- Its one URL helper runs the opposite direction: `local_path_for()` (`:27-29`) *strips* scheme+host (`sed -E 's#^https?://[^/]+##'`) so the remainder can be joined to `_site` to find the file on disk (`:55`). **Nothing here is reusable for filename → URL.**
- Filename→URL knowledge lives outside `bin/` entirely: `_config.yml:6` + `_config.yml:11`, and the Liquid capture at `_includes/open-graph.html:9` — `{% capture social_url %}{{ page.url | replace:'index.html','' | prepend: site.url }}{% endcapture %}`.
- Its `meta_content()` grep (`:20-25`) requires the literal form `<meta property="og:image" content="..."`, so it is coupled to the exact output shape of `_includes/open-graph.html`.
- It is **not run in CI.** `.github/workflows/link-check.yml:18` runs `bin/check-links` only; `.github/workflows/jekyll.yml` is the stock Pages build/deploy with no post-deploy notification step.
- Also present and render-time only: `_includes/open-graph.html` (emits the og:/twitter: tags, `:15-31`, image fallback chain `page.image.feature` → `page.image.thumb` → `site.image.default` at `:10-12`) and `_includes/social.html` (a static list of the author's own LinkedIn/GitHub/X profile links from `site.owner.*` — no per-post share buttons).

## `bin/` conventions a new script would follow
**Findings:**
- Six scripts, all mode 0755, all invoked as `bin/<name>`: `check-links`, `check-social-preview`, `draft`, `jekyll`, `promote`, `server`. `bin` is listed under `exclude` at `_config.yml:41`, so it is not copied into the build.
- Five are `#!/usr/bin/env bash`; `bin/jekyll` is a Bundler-generated Ruby binstub.
- `set -e` — bare, never `set -euo pipefail` — in four scripts (`check-links:13`, `check-social-preview:15`, `draft:3`, `promote:3`). `bin/server` has no `set` at all.
- **No script locates the repo root.** No `git rev-parse --show-toplevel`, no `cd "$(dirname "$0")/.."`, no `BASH_SOURCE`. All paths are hardcoded repo-relative, so every script assumes invocation from the repo root.
- Errors go to **stdout via plain `echo`, never stderr** — there is no `>&2` anywhere in `bin/`. Two message conventions: `Error: <detail>` (`draft:19`, `promote:44`, `:49`, `:57`) and `FAIL <detail>` (`check-social-preview:32`). Exit 1 on error; `promote:29` exits 0 for `--help`.
- Two usage styles: a `usage()` function reachable via `-h|--help` and via a missing argument (`promote:5-12`, `:27-30`, `:38-41`), or usage as header comments that are never printed (`check-links:5-7`, `check-social-preview:5-7`).
- **No color or ANSI anywhere.** No `tput`, no escape sequences, no `--color` flags.
- **No clipboard use anywhere.** No `pbcopy`, `pbpaste`, or `osascript` in any script.
- **No script parses `_config.yml`.** `bin/server:3` only passes `_config.yml,_config-dev.yml` to `jekyll serve --config`. Nothing extracts `site.url` or `permalink`.
- **No shared helper file and no `source` statement.** Helper functions live inside `check-social-preview` (`:20-107`) and the single `usage()` in `promote`. Duplication is copied, not shared: `draft:12-14` builds the `YYYY-MM-DD-` prefix while `promote:53` strips it with an independently written regex.
- Naming: all lowercase, no extension, multi-word hyphenated; the two validators share a `check-` prefix.
- `bin/draft` slug pipeline, `:13`: `tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-'`. No hyphen-run collapsing, no trimming, no truncation. Date is always today (`:12`); no override flag.
- No `_social/` directory. No Makefile, Rakefile, or `package.json` anywhere. The only other executable in the repo is `_blogger_archive/import.rb`, a legacy Blogger importer.
- **No script, task, or CI step anywhere in the repo performs social posting, sharing, or announcements.** `CLAUDE.md:68-69` documents only `bin/draft` and `bin/promote` as the authoring workflow.

## URL character accounting against the 280-char budget
**Findings:**
- Real post URLs on this site run **46 to 75 characters** (39 + slug length), measured above. `from-pilot-to-air-traffic-controller` is the longest recent case at 75.
- X wraps every link in `t.co` and charges a **fixed 23 characters** against the 280 limit regardless of the URL's real length. A 75-char URL costs 23 on X.
- LinkedIn does not shorten links and has no 280-character limit (its post ceiling is far higher, and its feed collapses behind "see more" well before 280).
- So the two platforms disagree by 23 to 52 characters on the same text, and **X is the only platform where the limit binds at all.**
- Two viable accountings, both consistent with D4/D5:
  - **Count the URL as 23** (X's real cost): the prose gets up to 257 characters. Nothing breaks on LinkedIn, which has no limit. Displayed count matches what X's composer will show.
  - **Count the URL's literal length** (46-75): the prose gets 205-234 characters, and the count is wrong on X by 23-52 characters — conservative, never over, but silently spends budget that X does not charge.
- The distinction only matters for what number the candidate display shows and how much prose room the drafting step believes it has.

## Patterns Observed
- **Explicit named lookups everywhere in Liquid.** No template in the repo iterates over front matter or dumps page data, which is why a new front matter key is inert by default. This is a property worth not breaking.
- **Skills terminate at a shell command.** `writing-a-blog-post` hands off to `bin/promote`; `writing-style` and `verifying-claims` are invoked by name from inside phases. The house split is: skill owns judgment, `bin/` script owns mechanics.
- **`bin/` scripts are deliberately small and dumb.** One job each, no shared library, no config parsing, no repo-root detection, hardcoded relative paths, plain `echo`, bare `set -e`. Duplication between scripts is tolerated over abstraction — `draft` and `promote` each own their date-prefix regex.
- **Front matter is minimal by convention.** Three keys across 296 posts. `featured_description` was added for a specific rendering need and documented at the point of use (`_includes/head.html:3-7`), not in `CLAUDE.md`.
- **Multi-line front matter values use the folded `>` scalar, indented 2 spaces, unquoted.** Nine for nine.
- **Candidate presentation is "three or four, genuinely different angles."** Already the rule for titles and headers (`SKILL.md:33`); D7 restates it for social copy.
- `writing-style`'s H1 is `# Deslop`; it is 327 lines, 47 blocklist rows across three tiers, 20 named structural patterns, and a 19-item self-editing checklist.

## Constraints Discovered
- **`SKILL.md:18` currently scopes the skill out of exactly the file the new step operates on.** It reads: "Not for a post already in `_posts/` — fix those directly." D3 and D6 place the social step *after* `bin/promote`, when the post is in `_posts/`. That `When to Use` line has to be amended, or the new phase contradicts the skill's own entry conditions.
- **`writing-style` has no short-form mode and no sentence-length rule at all.** The "vary sentence and paragraph length" anti-pattern is `CLAUDE.md`'s (item 4), not the skill's — the strings "burstiness", "vary sentence", "first person", "active voice", and "passive voice" appear nowhere in `SKILL.md`. Correcting the premise of D8's research question.
- **About half the `writing-style` gate cannot fire on 280 characters.** Ten of its 19 checklist items need multi-sentence or multi-paragraph text: em-dash counting (`:305`, `:160`), tic counting (`:250`, `:252`, `:307`), the "more than 2-3 Not-X-but-Y" cap (`:134`), adjacent-sentence restatement (`:300`, `:182`), adjacent-sentence self-contradiction (`:245`, `:309`), bolded-takeaway-vs-section-header (`:299`, `:268`), paragraph-closer rules (`:301`, `:172`), the one-colon-per-paragraph cap (`:306`), citation-first openings (`:304`), and the before/after specific-noun count (`:236`, `:308`, `:325`).
- **The cleanly applicable subset is large and lexical:** all 18 Tier 1 rows (`:56-73`, including `shape`/`shaped` figurative at `:73`), the Tier 2 single-word rows (`:80-95`), all 10 Tier 3 rows (`:103-112`), plus the single-instance structural patterns — significance puff (`:116`), superficial `-ing` (`:122`), negative parallelism (`:128`), "despite challenges" (`:136`), rule-of-three inflation (`:142`), false ranges (`:148`), defensive scare quotes (`:210`), run-on conjunctions (`:222`), abstraction creep (`:228`), universal claim no one would disagree with (`:281`) — and checklist items `:291`, `:293`-`:298`, `:302`, `:303`.
- **`writing-style`'s frontmatter nominally claims the social copy anyway.** `:3` exempts only "code, commit messages, or single-sentence responses" and scopes to "any multi-sentence text", so a two-sentence 280-character post is in scope by the letter of the skill, with every length-dependent rule still nominally in force.
- **`pbcopy` would be the first clipboard use in the repo**, and a URL-constructing script would be the first `bin/` script to need `_config.yml` values. There is no YAML-parsing precedent and no `yq` dependency; the permalink shape would either be duplicated in the script or grepped out of `_config.yml`.
- **The local `_site/` build carries localhost URLs**, so the live URL must be computed from `_config.yml` + filename rather than read from the build.
- **`featured_description` overlaps conceptually with `social:`** — a hand-written one-line summary already exists on the 9 most recent substantial posts, including `2026-09-08`. Whether social copy is drafted fresh or seeded from it is unaddressed by the decisions.
- **Front matter shapes vary**, so an automated `social:` insertion must handle flush-left and 2-space-indented tag lists, `tags:` with trailing whitespace, and the presence or absence of a blank line after the opening fence.
- `_drafts/` is empty right now, and the most recent post (`_posts/2026-09-08-the-finish-decides-the-shot.md`) is already promoted and merged — so the first real exercise of this workflow would be a post that is already live.
