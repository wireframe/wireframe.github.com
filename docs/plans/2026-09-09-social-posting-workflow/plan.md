# Plan: social-posting-workflow
Date: 2026-09-09
Decisions: [decisions.md](decisions.md)
Research: [research.md](research.md)
Structure: [structure.md](structure.md)

> **For Claude:** Execute this plan task-by-task, phase by phase — see `/qrspi:implement`'s execution options.

**Goal:** Make sharing a published post part of the writing workflow — a `sharing-on-social` skill drafts three short candidates, writes the chosen one into the post's front matter, and `bin/social` assembles it with the live URL and copies it to the clipboard for pasting into X and LinkedIn.

**Architecture:** Two halves, split the way this repo already splits skills from scripts. `bin/social` owns the mechanics: read the `social:` front matter value, derive the live URL from the filename, count characters, print, copy. The `sharing-on-social` skill owns the judgment: read the post, offer candidates, write the chosen text. `writing-a-blog-post` gains one pointer line and nothing else.

**Tech Stack:** Bash (matching the five existing `bin/` scripts), `awk` for the folded-scalar read, `pbcopy` for the clipboard, Jekyll/Liquid untouched, Claude Code skills as Markdown.

**No test harness exists.** The `Gemfile` carries only `jekyll` and `html-proofer`; there is no bats, shellcheck, `test/`, Makefile, or `package.json` anywhere in the repo, and CI runs only `bin/check-links` (`.github/workflows/link-check.yml:18`). So TDD here is a red/green shell sequence: every task below names a command to run **before** the change (must fail with the stated symptom) and **after** (must produce the stated output). Run the red command first. Do not add a test framework — that is out of scope.

**Fixture note.** `_drafts/` is empty and the newest post is already published and merged, so `_posts/2026-09-08-the-finish-decides-the-shot.md` is the test subject throughout. Phase 1 hand-adds a throwaway `social:` value to it and reverts with `git checkout` at the end of the phase. Phase 2's end-to-end task writes a **real** `social:` value to that published post and keeps it — that is the workflow's first genuine use, and it gets committed deliberately.

**Design details settled while planning (no open questions):**
- Prose is a **single paragraph**. The `social:` value is a folded `>` scalar whose lines join with spaces, matching all 9 `featured_description` uses. No support for deliberate line breaks inside the prose — 280 characters rarely needs one, and adding blank-line handling to the awk buys complexity for a case that has not come up. Revisit if it does.
- The **domain comes from `_config.yml:11`** (one `sed` line, so the URL cannot drift from the site config), the **permalink shape is hardcoded** as `/YYYY/MM/slug.html`. Parsing `/:year/:month/:title.html` generically would be over-engineering for one site, and hardcoding the domain would make it the third copy after `_config.yml` and `CNAME`.
- Character count uses `wc -m`, not `wc -c` — the prose will contain em dashes and curly quotes, and bytes are not characters. The count covers the whole assembled string including the two newlines before the URL, per D5's literal-length choice.
- Over 280 characters: print the block, print the overage, **exit 1 without copying**. Crash early rather than hand over copy that X will reject.
- The clipboard receives the post text only — never the separator lines or the character count.

---

## Phase 1: `bin/social` — assemble, print, copy

- [x] Task 1.1: Create the script skeleton with usage and argument handling
  - File: `bin/social` (new)
  - Change: `#!/usr/bin/env bash`, blank line, `set -e`, then a `usage()` function modeled on `bin/promote:5-12` — `Usage: bin/social <path-to-post>`, an example line using `_posts/2026-09-08-the-finish-decides-the-shot.md`, a blank `echo`, and two lines explaining that it prints the post's social copy with its live URL and copies it to the clipboard. Then a `while`/`case` arg loop in the shape of `bin/promote:17-36` handling `-h|--help` (usage, exit 0) and a single positional into `POST`. After the loop, `if [ -z "$POST" ]; then usage; exit 1; fi`. Then `chmod 755 bin/social`.
  - Test (red): `bin/social` → `bash: bin/social: No such file or directory`
  - Test (green): `bin/social; echo "exit=$?"` → usage text then `exit=1`. `bin/social -h; echo "exit=$?"` → usage text then `exit=0`. `ls -l bin/social` shows `-rwxr-xr-x`.

- [x] Task 1.2: Validate the post path
  - File: `bin/social`
  - Change: after the empty-arg check, add three guards using the `Error: <detail>` + `exit 1` convention from `bin/promote:44-58` (plain `echo` to stdout, no `>&2` — matching research's finding that no `bin/` script writes to stderr). (1) `if [ ! -f "$POST" ]` → `Error: post not found: $POST`. (2) reject anything outside `_posts/` → `Error: not a published post: $POST` plus a second line `A live URL only exists after bin/promote. Publish the draft first.` (3) require a `YYYY-MM-DD-` filename prefix → `Error: post filename has no date prefix: $POST`.
  - Test (red): `bin/social _posts/nope.md; echo "exit=$?"` → prints usage or nothing, `exit=0`
  - Test (green): `bin/social _posts/nope.md; echo "exit=$?"` → `Error: post not found: _posts/nope.md` / `exit=1`. `touch _drafts/tmp.md && bin/social _drafts/tmp.md; echo "exit=$?"` → `Error: not a published post` / `exit=1`, then `rm _drafts/tmp.md`.

- [x] Task 1.3: Derive the live URL from the filename and `_config.yml`
  - File: `bin/social`; reads `_config.yml:11` (`url: https://www.codecrate.com`) and encodes the shape from `_config.yml:6` (`permalink: /:year/:month/:title.html`)
  - Change: `SITE_URL=$(sed -n 's/^url:[[:space:]]*//p' _config.yml)`, guarded by `if [ -z "$SITE_URL" ]; then echo "Error: no 'url:' key in _config.yml"; exit 1; fi`. Then from `BASE=$(basename "$POST" .md)`: `YEAR="${BASE:0:4}"`, `MONTH="${BASE:5:2}"`, `SLUG=$(echo "$BASE" | sed -E 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}-//')` (the same strip as `bin/promote:53`), then `URL="$SITE_URL/$YEAR/$MONTH/$SLUG.html"`. Temporarily end the script with `echo "$URL"` so this task is verifiable on its own; Task 1.6 replaces that line.
  - Test (green): `bin/social _posts/2026-09-08-the-finish-decides-the-shot.md` → exactly `https://www.codecrate.com/2026/09/the-finish-decides-the-shot.html`, and `bin/social _posts/2026-09-08-the-finish-decides-the-shot.md | wc -m` → `67` (66 characters plus the newline). Also `bin/social _posts/2026-04-10-team-topology-ownership.md | tr -d '\n' | wc -m` → `62`. Both match research's measured lengths.

- [x] Task 1.4: Read the `social:` folded scalar
  - File: `bin/social`
  - Change: add a `social_value()` function taking the post path, using `awk` to (1) skip until a line matching `^social:[[:space:]]*>`, (2) then for each following line beginning with two spaces, strip leading whitespace and print it joined to the previous with a single space, (3) stop at the first line that is not indented. Assign `TEXT=$(social_value "$POST")` and guard: `if [ -z "$TEXT" ]; then echo "Error: no 'social:' value in $POST"; echo "Run the sharing-on-social skill to draft one."; exit 1; fi`.
  - Test (red): with no `social:` key on the post, the script prints the URL and exits 0.
  - Test (green): `bin/social _posts/2026-09-08-the-finish-decides-the-shot.md; echo "exit=$?"` → `Error: no 'social:' value` / `exit=1`. Then hand-add to that post's front matter, directly under `title:`:
    ```yaml
    social: >
      Throwaway fixture line one
      and line two.
    ```
    Re-run with a temporary `echo "$TEXT"` and confirm one line: `Throwaway fixture line one and line two.` — the two source lines folded with a single space, leading indentation gone.

- [x] Task 1.5: Assemble the block and count characters
  - File: `bin/social`
  - Change: `BLOCK=$(printf '%s\n\n%s' "$TEXT" "$URL")`, then `COUNT=$(printf '%s' "$BLOCK" | wc -m | tr -d ' ')` and `URL_COUNT=$(printf '%s' "$URL" | wc -m | tr -d ' ')`. Add the over-limit guard: if `COUNT` exceeds 280, print the block, then `echo "Error: $COUNT characters — $((COUNT - 280)) over X's 280 limit. Not copied."` and `exit 1`.
  - Test (green): with the Task 1.4 fixture in place, confirm `COUNT` equals the prose length plus 2 plus 66 by hand: `echo -n "Throwaway fixture line one and line two." | wc -m` → `40`, so the reported count must be `108`. Then temporarily replace the fixture value with a 300-character run of text and confirm `Error: 3NN characters — NN over X's 280 limit. Not copied.` and `exit=1`.

- [x] Task 1.6: Print and copy
  - File: `bin/social`
  - Change: remove the temporary `echo` lines from Tasks 1.3-1.4. Final output: a line of 40 hyphens, the block, another line of 40 hyphens, then `echo "$COUNT characters ($URL_COUNT of them the URL)"`, then `printf '%s' "$BLOCK" | pbcopy` and `echo "Copied to clipboard."`. No ANSI or color — research found none anywhere in `bin/`. The clipboard gets `$BLOCK` only, never the separators or the count.
  - Test (green): `bin/social _posts/2026-09-08-the-finish-decides-the-shot.md` prints the framed block, `108 characters (66 of them the URL)`, and `Copied to clipboard.` Then `pbpaste | wc -m` → `108`, and `diff <(pbpaste) <(printf '%s\n\n%s' "Throwaway fixture line one and line two." "https://www.codecrate.com/2026/09/the-finish-decides-the-shot.html")` → no output. Confirm `pbpaste` contains no hyphens from the separator lines.

- [x] Task 1.7: Revert the fixture and commit
  - File: `_posts/2026-09-08-the-finish-decides-the-shot.md`
  - Change: `git checkout _posts/2026-09-08-the-finish-decides-the-shot.md` to drop the throwaway `social:` key. Confirm `git status` shows only `bin/social` as new.
  - Test (green): `git status --short` → exactly `?? bin/social`. `bin/social _posts/2026-09-08-the-finish-decides-the-shot.md; echo "exit=$?"` → `Error: no 'social:' value` / `exit=1`, proving the script is honest about an unauthored post.

- [ ] Commit Phase 1

## Phase 2: New `sharing-on-social` skill

- [x] Task 2.1: Create the skill file with frontmatter
  - File: `.claude/skills/sharing-on-social/SKILL.md` (new)
  - Change: `name: sharing-on-social` and a `description` whose trigger surface is sharing a published post on social — mentioning X and LinkedIn, a published `_posts/` file, and short reusable copy. It must NOT use the trigger words that route to `writing-a-blog-post` ("new post", "draft", "outline", "revise a draft", "skeleton"), so the two skills do not steal each other's invocations. Add an `# Sharing on Social` H1 and a short `## Overview` naming the job: get a published post shared on X and LinkedIn with one short reusable text. Per D9, the skill is named for the job, not the drafting step.
  - Test (green): `head -4 .claude/skills/sharing-on-social/SKILL.md` shows valid YAML with both keys. `grep -ci 'draft a new post\|outline\|skeleton' .claude/skills/sharing-on-social/SKILL.md` → `0`.

- [x] Task 2.2: Write the inputs and when-to-use section
  - File: `.claude/skills/sharing-on-social/SKILL.md`
  - Change: a `## When to Use` section — after `bin/promote` has published a post; when a published post has no `social:` key yet; when rewriting existing social copy. State the input explicitly: a path under `_posts/`. State that a draft is not a valid input because no live URL exists until publish, which is the same boundary `bin/social` enforces in Task 1.2.
  - Test (green): read the section back and confirm it names `_posts/` as the input and excludes `_drafts/`.

- [x] Task 2.3: Write the candidate-generation step
  - File: `.claude/skills/sharing-on-social/SKILL.md`
  - Change: read the published post first, then offer **three candidates taking genuinely different angles** — a claim, a concrete scene, a question — following the house pattern at `.claude/skills/writing-a-blog-post/SKILL.md:33`, including its escalation: if several rounds fail, ask what dimension is wrong rather than generating more. State the budget from D5: the whole assembled string stays at or under 280 characters counting the URL at its literal length (39 + slug length on this site, so 43-86 across the existing posts) plus the two newlines before it, so the prose gets `280 - 2 - URL`. Per D4, one text that pastes identically into both platforms — no per-platform variants, no hashtags, no @-mentions.
  - Test (green): `grep -c 'genuinely different angles' .claude/skills/sharing-on-social/SKILL.md` → at least `1`. Confirm the section states the 280 ceiling and the literal URL count.

- [x] Task 2.4: Write the candidate display format
  - File: `.claude/skills/sharing-on-social/SKILL.md`
  - Change: research found no display template exists anywhere in the repo, so define one here: a numbered list, each entry showing the candidate's total assembled character count and its angle label, then a prompt to pick a number or edit. Show it as a literal example block in the skill so the format is unambiguous.
  - Test (green): the section contains a concrete example block, not just a description of one.

- [x] Task 2.5: Write the front-matter write step
  - File: `.claude/skills/sharing-on-social/SKILL.md`
  - Change: instruct reading the post's existing front matter **before** editing (which is what absorbs the shape variance research found — flush-left vs. 2-space-indented tag lists, `tags:` with trailing whitespace, and the blank line after the opening fence that 251 of 296 posts carry). Then write `social:` as a folded `>` scalar, value indented 2 spaces, unquoted, placed directly after `title:` — matching all 9 `featured_description` uses, e.g. `_posts/2026-09-08-the-finish-decides-the-shot.md:1-10`. State that the prose is a single paragraph (no blank lines inside the scalar), because `bin/social` folds the lines with spaces.
  - Test (green): the section shows the exact YAML shape and says "after `title:`" and "single paragraph".

- [x] Task 2.6: Write the handoff to `bin/social`
  - File: `.claude/skills/sharing-on-social/SKILL.md`
  - Change: close the skill by running `bin/social <path-to-post>`, mirroring how `writing-a-blog-post/SKILL.md:240` closes with `bin/promote`. Note that the copy is now on the clipboard and gets pasted into X and LinkedIn by hand (D1), and that re-running `bin/social` on any post reprints and re-copies its stored copy at any time.
  - Test (green): `grep -c 'bin/social' .claude/skills/sharing-on-social/SKILL.md` → at least `1`.

- [x] Task 2.7: Add the pointer line to the blog skill
  - File: `.claude/skills/writing-a-blog-post/SKILL.md:240`
  - Change: extend that line — currently "Run the `writing-style` skill as the final pass. When the user is happy: `bin/promote _drafts/<file>.md [--date YYYY-MM-DD]`." — with one sentence pointing at the new skill once the post is published, in the same by-name form the line already uses for `writing-style`. **Do not touch `:18`** ("Not for a post already in `_posts/`"); leaving it intact is the point of D9. Do not add a phase, do not renumber, do not touch the `## Common Mistakes` table.
  - Test (red): `grep -c 'sharing-on-social' .claude/skills/writing-a-blog-post/SKILL.md` → `0`
  - Test (green): `git diff --stat .claude/skills/writing-a-blog-post/SKILL.md` → `1 file changed, 1 insertion(+), 1 deletion(-)`. `git diff -U0 .claude/skills/writing-a-blog-post/SKILL.md | grep '^[-+]' | grep -v '^[-+][-+]'` shows only line 240. `git diff .claude/skills/writing-a-blog-post/SKILL.md | grep -c '_posts/ — fix those directly'` → `0`, proving `:18` is untouched.

- [x] Task 2.8: End-to-end run, with leakage and preview checks
  - Files: `_posts/2026-09-08-the-finish-decides-the-shot.md`, `_site/`
  - Change: invoke the `sharing-on-social` skill against `_posts/2026-09-08-the-finish-decides-the-shot.md` and carry it through for real — three candidates, pick one, written to front matter, `bin/social` run. This is the workflow's first genuine use and the value is kept, not reverted.
  - Test (green): `bin/social _posts/2026-09-08-the-finish-decides-the-shot.md` prints the chosen copy plus `https://www.codecrate.com/2026/09/the-finish-decides-the-shot.html`, a count at or under 280, and `Copied to clipboard.` Then `bundle exec jekyll build --trace` and: `grep -ric 'social' _site/2026/09/the-finish-decides-the-shot.html` → the value's own words appear `0` times (grep for a distinctive 3-word phrase from the chosen copy, not the word "social", which appears in the page's own og/twitter markup); `grep -c '<distinctive phrase>' _site/atom.xml _site/search.json` → `0` each. Finally `bin/check-social-preview _site/2026/09/the-finish-decides-the-shot.html` → `ok`. Research predicts the key is inert; this proves it.

- [ ] Commit Phase 2

## Phase 3: Short-form voice guardrail

*Serves Preference decision D8, which was my own default rather than Ryan's stated requirement. Kept deliberately minimal — three tasks, one section in one file. Confirm it is worth having before expanding it.*

- [x] Task 3.1: Add the applicable-subset checklist to the new skill
  - File: `.claude/skills/sharing-on-social/SKILL.md`
  - Change: one `## Voice check` section listing only what can fire on 280 characters. From `~/.claude/skills/writing-style/SKILL.md`: Tier 1 in full (`:56-73`, including figurative `shape`/`shaped` at `:73`), the Tier 2 single-word rows (`:80-95`), Tier 3 in full (`:103-112`), and the single-instance structural patterns — significance puff (`:116`), superficial `-ing` (`:122`), negative parallelism (`:128`), rule-of-three inflation (`:142`), false ranges (`:148`), defensive scare quotes (`:210`), universal claim no one would disagree with (`:281`). From `CLAUDE.md`: first person and active, concrete over thesis, no "it's not X, it's Y". Then state plainly which rules are **out of scope at this length** so they are not applied spuriously: em-dash and tic counting (`:305`, `:250`, `:307`), adjacent-sentence restatement and self-contradiction (`:300`, `:309`), bolded-takeaway rules (`:299`), paragraph-closer rules (`:301`), the one-colon-per-paragraph cap (`:306`), citation-first openings (`:304`), the before/after specific-noun count (`:308`). Note for the record that `writing-style` has no sentence-length rule at all — "vary sentence and paragraph length" is `CLAUDE.md` item 4 — and no short-form mode, which is why this subset is spelled out here rather than by invoking the skill wholesale.
  - Test (green): `grep -c 'shape' .claude/skills/sharing-on-social/SKILL.md` → at least `1`. The section names both an in-scope and an out-of-scope list.

- [x] Task 3.2: Red/green the guardrail
  - File: none (behavioral check)
  - Change: none.
  - Test (red): hand the skill a deliberately slopped candidate containing `leverage`, `showcase`, and a figurative `shape` — confirm all three are caught and named.
  - Test (green): hand it a clean two-sentence candidate under 280 characters and confirm it passes with no length-dependent rule firing spuriously — no em-dash count, no bolded-takeaway complaint, no adjacent-paragraph check.

- [ ] Commit Phase 3

## Phase 4: Document the workflow

- [x] Task 4.1: Add the social step to the Workflow section
  - File: `CLAUDE.md` (the `## Workflow` section, which currently documents `bin/draft` at line 68 and `bin/promote` at line 69)
  - Change: a third bullet — the `sharing-on-social` skill drafts short copy for a published post and writes it to the post's `social:` key; `bin/social _posts/<file>.md` prints it with the live URL and copies it to the clipboard for X and LinkedIn.
  - Test (red): `grep -c 'bin/social' CLAUDE.md` → `0`
  - Test (green): `grep -n 'bin/social' CLAUDE.md` returns the new workflow line.

- [x] Task 4.2: Document the `social:` key in the front matter template
  - File: `CLAUDE.md` (the `## Front Matter Template` section, lines 79-88)
  - Change: add `social:` to the template as an optional key with the folded `>` shape, and one line saying it holds the reusable social copy and renders nowhere on the site. Research found `featured_description` exists on 9 posts and is documented only at its point of use in `_includes/head.html:3-7`, never in `CLAUDE.md` — do not repeat that omission, so add `featured_description` here too while the section is open.
  - Test (green): `grep -c 'social:' CLAUDE.md` → at least `1`; `grep -c 'featured_description' CLAUDE.md` → at least `1`.

- [ ] Commit Phase 4
