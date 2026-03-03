# Homepage Refresh Design

## Purpose

Update codecrate.com homepage to reflect current CTO/builder identity while preserving the structured layout and opinionated voice established in the existing design.

## Changes

### 1. `_config.yml`

- Update `description` from `Building better code` to `Building stuff that matters`
- Remove the `bio` field (unused -- not referenced in any template or layout)

### 2. `index.html` -- Header

Change the summary line:

```
Current:  "Engineering leader. Building teams and platforms with impact."
New:      "CTO who still writes code."
```

Tagline ("Building stuff that matters."), avatar, and social icons remain unchanged.

### 3. `index.html` -- Section Headers

Rename all section headers to a cohesive conversational set:

| Current | New |
|---|---|
| TL;DR | How I work |
| The Path So Far | Where I've been |
| Open Source | What I'm shipping |

### 4. `index.html` -- "Where I've been" Content

Replace the current vague career narrative with specific but concise copy:

```
I've spent the last decade as the founding technology leader at BetterUp --
first engineer to 140+ person org, pre-revenue to $250M+ ARR. Before that,
I built products inside a Fortune 5 startup incubator and was a core engineer
at Socialcast through its acquisition by VMware.
```

Keep the closing line: "I've learned a *lot* along the way, and have a whole lot *more* learning yet to do."

### 5. `index.html` -- New "What I'm thinking about" Section

Insert between "Where I've been" and "What I'm shipping":

```html
<section class="bio-section">
  <h2>What I'm thinking about</h2>
  <ul>
    <li>How growth-stage companies can <a href="/2026/02/the-greenhouse-innovation-incubator.html">maintain innovation velocity</a> without building an ivory tower</li>
    <li>What <a href="/2025/05/agentic-engineering.html">agentic engineering</a> looks like in practice, not in pitch decks</li>
    <li>Why the best part of your product roadmap is <a href="/2025/04/the-most-powerful-part-of-your-product-roadmap.html">what you're <em>not</em> doing</a></li>
  </ul>
  <p><a href="/archive.html">Read more...</a></p>
</section>
```

### 6. `index.html` -- "What I'm shipping" Intro

Replace current open source intro text:

```
Current:  "I've benefited from building on the shoulders of giants for years,
           and contributing back to the community has been both meaningful and
           a way to sharpen my craft. A few of my more projects include:"

New:      "I've been shipping open source since 2005. The majority of my work
           is on GitHub. Some highlights:"
```

Keep the existing three projects (multitenant, backgrounded, gitx) and "Full inventory on GitHub" link.

### 7. Not Changing

- Avatar image and layout structure
- Social icons (`social.html` include)
- Nav structure (Home, Articles, Search)
- "How I work" values content (all five bullets stay)
- Project list (same three projects)

## Follow-up: Dynamic Article List

**Status:** Flagged for investigation

The "What I'm thinking about" section currently uses hardcoded links. Investigate whether this can be driven dynamically so the homepage stays fresh without manual edits.

Possible approaches to explore:
- **Jekyll front matter flag** -- Add a `featured: true` field to post front matter, then use a Liquid loop to pull the latest N featured posts. This gives editorial control (you choose which posts appear) without hardcoding URLs.
- **Tag-based query** -- Use a specific tag (e.g., `featured`) and loop over `site.tags.featured`.
- **Most recent N posts** -- Simply show the latest 3 posts. Zero maintenance but no curation.
- **Hybrid** -- Show featured posts if any exist, fall back to most recent.

Trade-off: editorial control vs. zero-maintenance. A `featured` front matter flag is likely the best balance -- you tag posts deliberately, and the homepage renders them automatically.

## Follow-up: Configurable Open Source Projects

**Status:** Flagged for investigation

The "What I'm shipping" project list is hardcoded HTML in `index.html`. Investigate whether this can be driven from `_config.yml` or a data file so projects can be updated without editing the template.

Possible approaches to explore:
- **`_config.yml` list** -- Define projects under `owner.projects` (or a top-level `projects` key) and loop with Liquid. Keeps everything in one config file.
- **Jekyll data file** -- Create `_data/projects.yml` with name, url, and description fields. More separation of content from config.
- **GitHub API at build time** -- Use a Jekyll plugin to pull pinned repos from the GitHub API. Zero maintenance but adds a build dependency and less editorial control over descriptions.

Trade-off: `_data/projects.yml` is likely the cleanest option -- dedicated data file, easy to edit, no build dependencies.
