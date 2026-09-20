# Project: wireframe.github.com

Personal tech blog (Jekyll) with posts dating back to 2003. Topics include software engineering, product development, and technology opinions.

## Writing Voice

Conversational, personal, approachable. Questioning and rhetorical. Direct, succinct, punchy. Playful and punny. It should read like a senior engineer sharing hard-won insights over coffee, not a corporate whitepaper.

The habits that actually produce that voice:

- **Open on a concrete scene, not a thesis.** A migration that went quiet, a weekend project, four agent sessions running at once. The idea arrives after the scene.
- **First person, active, observed.** "I've watched," "I've never hired a programmer." Never "organizations have found."
- **Link prior posts liberally**, using `{% post_url YYYY-MM-DD-slug %}`. When the prose points at one directly ("a year ago I wrote…"), the post's title is the anchor text.
- **Quote named sources as blockquotes**, with the book or article linked. Never "industry experts say."
- **Concede the strongest counter-argument before answering it.** Stating it fairly is what makes the answer land.
- **Say when something didn't work.** "The Crickets Award didn't stick" is the most credible sentence in that post.
- **Name the constructs you invent** — The Commit Cycle, The Not Doing List, The Crickets Award, V2OOO. A named idea gets quoted back; an unnamed one gets paraphrased away.
- **Emphasize contested claims** with bold or italics, one or two per section, never on the topic sentence.
- **End on a question or a challenge**, not a summary.

Reference posts for tone:
- `_posts/2026-08-07-recognition-is-infrastructure.md` - current voice: scene opener, blockquoted sources, honest failure, closing challenge
- `_posts/2025-08-25-hacker-renaissance.md` - conversational, uses rhetorical questions
- `_posts/2025-05-28-agentic-engineering.md` - direct claims, practical frameworks
- `_posts/2025-04-28-the-most-powerful-part-of-your-product-roadmap.md` - personal experience driving insights

## AI Writing Anti-Patterns to Avoid
Reference this document for anti-patterns: https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing             

When writing or editing blog content, actively avoid these patterns:

### High Priority (Most Noticeable)

1. **No "It's not X, it's Y" structures** - Make positive claims directly instead of dramatic negation contrasts

2. **No inflated significance language** - Avoid: "stands as a testament," "plays a vital role," "watershed moment," "profound impact," "solidifies," "pivotal," "transformative"

3. **No superficial -ing analysis** - Never end sentences with empty phrases like: "...highlighting the importance," "...reflecting broader trends," "...ensuring long-term success," "...demonstrating the value"

### Medium Priority (Structural)

4. **Vary sentence and paragraph length** - Mix short punchy sentences with longer explanatory ones. Paragraphs should not all be the same size.

5. **Use em dashes sparingly** - Prefer parentheses or commas for asides. Reserve dashes for genuine emphasis, not "punched up" sales-like writing.

6. **No bolded bullet syndrome** - If using `**Topic:** description` format, the description must add new information, not restate the bolded phrase.

### Lower Priority (Word Choice)

7. **Minimize conjunctive phrases** - Use "moreover," "furthermore," "in addition," "on the other hand" sparingly and only when the logical connection genuinely needs stating.

8. **No editorializing meta-phrases** - Avoid: "it's important to note," "it is worth mentioning," "no discussion would be complete without"

9. **No promotional adjective clusters** - Avoid: "rich cultural heritage," "breathtaking," "enduring legacy," "stunning"

10. **Specific attribution or none** - Either name sources or remove hedging. Avoid: "industry experts say," "some critics argue," "observers note"

## Content Guidelines

- Posts should have a clear point of view
- Use concrete examples from real experience
- Code snippets welcome when they illustrate a point
- Keep introductions short; get to the insight quickly
- End with actionable takeaways or a provocative question, not generic summaries

## Workflow

- Use `bin/draft "Post Title"` to create new draft posts (handles date prefix and slug generation)
- Use `bin/promote _drafts/<file>.md` to publish a draft to `_posts/` (moves with `git mv` to preserve history). Takes a real path so shell tab-completion works. Defaults the publish date to today; pass `--date YYYY-MM-DD` to override (e.g. for archival dating)
- Once a post is published, the `sharing-on-social` skill drafts the social copy and writes it to the post's `social:` front matter key
- Use `bin/social _posts/<file>.md` to print that copy with the post's live URL and character count, and copy it to the clipboard for X and LinkedIn. Refuses to copy anything over 280 characters

## File Structure

```
_posts/YYYY-MM-DD-slug.md    # Published posts
_drafts/                      # Work in progress
images/                       # Post images (YYYY-MM-DD.png naming)
```

## Front Matter Template

```yaml
---
title: "Post Title"
tags:
- relevant-tag
- another-tag
---
```

Two optional keys, both folded `>` scalars placed after `title:`:

```yaml
title: "Post Title"
social: >
  One paragraph of social copy, no blank lines. Read by bin/social.
featured_description: >
  One line shown on the homepage and resume, in place of Jekyll's auto excerpt.
```

`social:` holds the reusable X/LinkedIn copy and renders nowhere on the site. `featured_description:` is read by `_includes/head.html` and `_includes/featured-writings.html`.

Common tags: `engineering`, `product development`, `ai`, `tools`

Use `release-announcement` to tag posts announcing an open-source release or project launch.
