# Research: Homepage Refresh
Date: 2026-03-03
Decisions: [decisions.md](decisions.md)

> Carried over from the design doc's "Flagged for investigation" follow-ups. These lay out approaches and tradeoffs; grounded `file:line` evidence from the codebase is still pending and should be gathered before structuring the dynamic work.

## Dynamic "What I'm thinking about" list (resolves D7)
**Findings:**
- The section currently uses hardcoded `<li>` links in `index.html`, so keeping it fresh means manual edits.
- Possible approaches:
  - **Jekyll front matter flag** — add `featured: true` to post front matter, then a Liquid loop pulls the latest N featured posts. Editorial control (you choose which posts appear) without hardcoding URLs.
  - **Tag-based query** — use a `featured` tag and loop over `site.tags.featured`.
  - **Most recent N posts** — show the latest 3 posts. Zero maintenance, no curation.
  - **Hybrid** — show featured posts if any exist, fall back to most recent.
- Trade-off: editorial control vs. zero-maintenance.

## Configurable open source project list (resolves D8)
**Findings:**
- The "What I'm shipping" project list is hardcoded HTML in `index.html`, so updating projects means editing the template.
- Possible approaches:
  - **`_config.yml` list** — define projects under `owner.projects` (or a top-level `projects` key) and loop with Liquid. Everything stays in one config file.
  - **Jekyll data file** — `_data/projects.yml` with name, url, description fields. Cleaner separation of content from config.
  - **GitHub API at build time** — a Jekyll plugin pulls pinned repos from the GitHub API. Zero maintenance but adds a build dependency and less editorial control over descriptions.
- Trade-off: content/template separation vs. build dependencies.

## Constraints Discovered
- Both lists live inline in `index.html` today; any dynamic approach requires introducing a Liquid loop and (for projects) a config or data source.

## Open Decisions (must be resolved before /structure)
- **D7 Dynamic "What I'm thinking about" list:** front matter `featured: true` flag + Liquid loop gives editorial control without hardcoded URLs; tag-based query is similar; most-recent-N is zero-maintenance but uncurated; hybrid combines both. Leaning `featured` flag as the balance of control and low upkeep. Still unresolved — recommend picking before structuring.
- **D8 Configurable open source projects:** `_data/projects.yml` is the cleanest (dedicated data file, easy to edit, no build dependency); `_config.yml` list keeps everything in one file; GitHub API is zero-maintenance but adds a build dependency. Leaning `_data/projects.yml`. Still unresolved — recommend picking before structuring.
