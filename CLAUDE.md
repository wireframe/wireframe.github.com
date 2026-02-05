# Project: wireframe.github.com

Personal tech blog (Jekyll) with posts dating back to 2003. Topics include software engineering, product development, and technology opinions.

## Writing Voice

This blog has a distinct voice: opinionated, direct, conversational. Posts often start with personal anecdotes or provocative questions. The writing should feel like a senior engineer sharing hard-won insights over coffee, not a corporate whitepaper.

Reference posts for tone:
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

Common tags: `engineering`, `product development`, `ai`, `tools`
