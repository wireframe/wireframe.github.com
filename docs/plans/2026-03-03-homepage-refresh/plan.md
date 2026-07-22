# Plan: Homepage Refresh
Date: 2026-03-03
Decisions: [decisions.md](decisions.md)
Research: [research.md](research.md)
Structure: [structure.md](structure.md)

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Update the homepage to reflect a CTO/builder identity with conversational section headers and a specific career narrative.
**Architecture:** Content-only changes to two files — `_config.yml` (site metadata) and `index.html` (homepage template). No structural or layout changes.
**Tech Stack:** Jekyll, HTML, Liquid templates, YAML config.

---

## Phase 1: Site metadata

- [ ] Task 1.1: Update site description
  - File: `_config.yml:3`
  - Change: `description: Building better code` → `description: Building stuff that matters`
  - Test: `grep -q 'Building stuff that matters' _config.yml`

- [ ] Task 1.2: Remove unused bio field
  - File: `_config.yml:26`
  - Change: delete the `bio: "A passionate web developer focused on launching Lean startups using Ruby and Javascript technologies."` line
  - Test: `! grep -q '^\s*bio:' _config.yml`

- [ ] Commit Phase 1: `git add _config.yml && git commit -m "Update site description and remove unused bio field"`

## Phase 2: Homepage identity and content

- [ ] Task 2.1: Update header summary line
  - File: `index.html:14`
  - Change: `<p class="summary">Engineering leader. Building teams and platforms with impact.</p>` → `<p class="summary">CTO who still writes code.</p>`
  - Test: `grep -q 'CTO who still writes code.' index.html`

- [ ] Task 2.2: Rename section headers
  - File: `index.html:20,31,47`
  - Change: `<h2>TL;DR</h2>` → `<h2>How I work</h2>`; `<h2>The Path So Far</h2>` → `<h2>Where I've been</h2>`; `<h2>Open Source</h2>` → `<h2>What I'm shipping</h2>`
  - Test: `grep -q 'How I work' index.html && grep -q "Where I've been" index.html && grep -q "What I'm shipping" index.html`

- [ ] Task 2.3: Replace "Where I've been" career narrative
  - File: `index.html:30-44` (replace the `<section class="bio-section">` inner content, keeping the section tags)
  - Change: swap in the specific narrative; keep the closing "learned a *lot*... *more* learning yet to do" line:
    ```html
    <section class="bio-section">
      <h2>Where I've been</h2>
      <p>
        I've spent the last decade as the founding technology leader at <a href="https://www.betterup.com">BetterUp</a> &mdash; first engineer to 140+ person org, pre-revenue to $250M+ ARR. Before that, I built products inside a Fortune 5 startup incubator and was a core engineer at Socialcast through its acquisition by VMware.
      </p>
      <p>
        I've learned a <i>lot</i> along the way, and have a whole lot <i>more</i> learning yet to do.
      </p>
    </section>
    ```
  - Test: `grep -q 'founding technology leader at' index.html && grep -q 'Socialcast' index.html`

- [ ] Task 2.4: Add "What I'm thinking about" section
  - File: `index.html` — insert between the "Where I've been" and "What I'm shipping" sections
  - Change: insert the new section:
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
  - Test: `grep -q "What I'm thinking about" index.html && grep -q 'the-greenhouse-innovation-incubator' index.html`

- [ ] Task 2.5: Update "What I'm shipping" intro and drop duplicate GitHub line
  - File: `index.html` — open source section intro paragraph and trailing "Full inventory" paragraph
  - Change: replace the intro `<p>` with `I've been shipping open source since 2005. The majority of my work is on <a href="https://github.com/wireframe">GitHub</a>. Some highlights:`; delete the trailing `<p>Full inventory on <a href="https://github.com/wireframe">GitHub</a>.</p>` paragraph
  - Test: `grep -q 'shipping open source since 2005' index.html`

- [ ] Commit Phase 2: `git add index.html && git commit -m "Refresh homepage identity, headers, narrative, and open source intro"`

## Phase 3: Visual verification

- [ ] Task 3.1: Build and serve locally
  - Command: `cd /Users/ryansonnek/Projects/wireframe.github.com && bundle exec jekyll serve`
  - Test: server starts without build errors

- [ ] Task 3.2: Verify in browser at `http://localhost:4000`
  - Checklist:
    - [ ] Header shows "CTO who still writes code."
    - [ ] "How I work" section has all 5 value bullets
    - [ ] "Where I've been" mentions BetterUp, Socialcast, Fortune 5
    - [ ] "What I'm thinking about" has 3 linked posts
    - [ ] All 3 post links resolve correctly
    - [ ] "Read more..." links to /archive.html
    - [ ] "What I'm shipping" shows 3 projects with the new intro
    - [ ] Social icons still render in header
    - [ ] Avatar image still displays
    - [ ] No layout/styling regressions

---

## Follow-up (deferred — see decisions.md D7/D8 and research.md)
- Investigate driving the "What I'm thinking about" list dynamically (front matter `featured` flag + Liquid loop).
- Investigate a configurable open source project list (`_data/projects.yml`).
