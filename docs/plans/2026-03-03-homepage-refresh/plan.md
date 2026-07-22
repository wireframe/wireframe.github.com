# Homepage Refresh Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Update codecrate.com homepage to reflect CTO/builder identity with conversational section headers and specific career narrative.

**Architecture:** Content-only changes to two files: `_config.yml` (site metadata) and `index.html` (homepage template). No structural/layout changes.

**Tech Stack:** Jekyll, HTML, Liquid templates, YAML config

**Design doc:** `docs/plans/2026-03-03-homepage-refresh-design.md`

---

### Task 1: Update `_config.yml` -- description and remove bio

**Files:**
- Modify: `_config.yml:3` (description field)
- Modify: `_config.yml:26` (remove bio field)

**Step 1: Update description**

In `_config.yml`, change line 3:

```yaml
# Before
description: Building better code

# After
description: Building stuff that matters
```

**Step 2: Remove unused bio field**

In `_config.yml`, delete line 26:

```yaml
# Delete this line
  bio: "A passionate web developer focused on launching Lean startups using Ruby and Javascript technologies."
```

**Step 3: Commit**

```bash
git add _config.yml
git commit -m "Update site description and remove unused bio field"
```

---

### Task 2: Update header summary line

**Files:**
- Modify: `index.html:14`

**Step 1: Change summary text**

In `index.html`, change line 14:

```html
<!-- Before -->
<p class="summary">Engineering leader. Building teams and platforms with impact.</p>

<!-- After -->
<p class="summary">CTO who still writes code.</p>
```

**Step 2: Commit**

```bash
git add index.html
git commit -m "Update homepage summary to CTO identity"
```

---

### Task 3: Rename section headers

**Files:**
- Modify: `index.html:20,31,47`

**Step 1: Rename "TL;DR" to "How I work"**

In `index.html`, change line 20:

```html
<!-- Before -->
<h2>TL;DR</h2>

<!-- After -->
<h2>How I work</h2>
```

**Step 2: Rename "The Path So Far" to "Where I've been"**

In `index.html`, change line 31:

```html
<!-- Before -->
<h2>The Path So Far</h2>

<!-- After -->
<h2>Where I've been</h2>
```

**Step 3: Rename "Open Source" to "What I'm shipping"**

In `index.html`, change line 47:

```html
<!-- Before -->
<h2>Open Source</h2>

<!-- After -->
<h2>What I'm shipping</h2>
```

**Step 4: Commit**

```bash
git add index.html
git commit -m "Rename section headers to conversational style"
```

---

### Task 4: Replace "Where I've been" content

**Files:**
- Modify: `index.html:30-44`

**Step 1: Replace career narrative**

Replace the entire `<section>` content for "Where I've been" (lines 30-44). Keep the section tags, replace inner content:

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

Note: The header rename from Task 3 is already included here. If executing tasks sequentially, this will match. If executing independently, this is the final state for this section.

**Step 2: Commit**

```bash
git add index.html
git commit -m "Update career narrative with specific BetterUp details"
```

---

### Task 5: Add "What I'm thinking about" section

**Files:**
- Modify: `index.html` -- insert new section between "Where I've been" and "What I'm shipping"

**Step 1: Insert new section**

After the closing `</section>` of the "Where I've been" section and before the opening `<section>` of the "What I'm shipping" section, insert:

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

**Step 2: Commit**

```bash
git add index.html
git commit -m "Add 'What I'm thinking about' section with featured posts"
```

---

### Task 6: Update "What I'm shipping" intro text

**Files:**
- Modify: `index.html` -- the open source section intro paragraph

**Step 1: Replace intro paragraph**

In the "What I'm shipping" section, replace the intro `<p>`:

```html
<!-- Before -->
<p>
  I've benefited from building on the shoulders of giants for years, and contributing back to the community has been both meaningful and a way to sharpen my craft.  A few of my more projects include:
</p>

<!-- After -->
<p>
  I've been shipping open source since 2005. The majority of my work is on <a href="https://github.com/wireframe">GitHub</a>. Some highlights:
</p>
```

Also remove the duplicate "Full inventory on GitHub" paragraph at the end of the section since GitHub is now linked in the intro:

```html
<!-- Delete this paragraph -->
<p>
  Full inventory on <a href="https://github.com/wireframe">GitHub</a>.
</p>
```

**Step 2: Commit**

```bash
git add index.html
git commit -m "Update open source intro text"
```

---

### Task 7: Visual verification

**Step 1: Build and serve locally**

```bash
cd /Users/ryansonnek/Projects/wireframe.github.com && bundle exec jekyll serve
```

**Step 2: Verify in browser**

Open `http://localhost:4000` and confirm:
- [ ] Header shows "CTO who still writes code."
- [ ] "How I work" section has all 5 value bullets
- [ ] "Where I've been" mentions BetterUp, Socialcast, Fortune 5
- [ ] "What I'm thinking about" has 3 linked posts
- [ ] All 3 post links resolve correctly
- [ ] "Read more..." links to /archive.html
- [ ] "What I'm shipping" shows 3 projects with new intro
- [ ] Social icons still render in header
- [ ] Avatar image still displays
- [ ] No layout/styling regressions

---

## Follow-up Tasks (not part of this plan)

### Investigate: Dynamic article list
The "What I'm thinking about" section uses hardcoded links. Research using a `featured: true` front matter flag with a Liquid loop to auto-populate. See design doc for options.

### Investigate: Configurable open source projects
The project list is hardcoded HTML. Research using `_data/projects.yml` to drive the list. See design doc for options.
