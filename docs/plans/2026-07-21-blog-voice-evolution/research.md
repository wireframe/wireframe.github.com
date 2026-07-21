# Research: blog-voice-evolution
Date: 2026-07-21
Decisions: [decisions.md](decisions.md)

Source: 290 posts in `_posts/` (2003-12-20 → 2026-05-30; count includes both `.md` and `.markdown` files), analyzed by four era-window research passes plus one Roam world-view anchor. Every claim below traces to a post file or a Roam block.

## Archive inventory & era segmentation
**Findings:**
- Posts per year: 2003:3, 2004:30, 2005:57, 2006:54, 2007:25, 2008:25, 2009:33, 2010:11, 2011:11, 2012:3, 2013:8, 2014:13, 2015:3, 2016–2021:0, 2022:1, 2023:1, 2024:3, 2025:6, 2026:3.
- The volume shape defines the eras better than round decades. Four coherent eras emerge:
  - **Era 1 — The Ranter (2003–2006, ~144 posts):** dense daily-driver Java blog. Opens `_posts/2003-12-20-my-first-blog.md` ("Ignore my innane ramblings").
  - **Era 2 — The Evangelist (2007–2009, ~83 posts):** Java→Ruby startup pivot, open-source/speaking, faith emerges.
  - **Era 3 — The Taper / Team Lead (2010–2014, ~46 posts):** trough at 2012 (3 posts), deliberate 2013 revival, IC→tech-lead transition. Not a smooth taper — a trough-then-comeback.
  - **Era 4 — The Leader (2015–2026, 17 posts):** a 2015 tail of old protip voice (3 posts), a true silence 2016–2021 (zero posts, six years), one post each in 2022–2023, then a 2024+ revival as a leadership/product/AI essayist.
- Hard genre break sits *inside* Era 4: 2015 posts are still technical tips (`2015-09-01-git-excited.markdown`); from `2022-07-09-performance-review-mindset-shift.md` onward the blog is leadership/strategy essays.

## Representative posts per era (for quoting)
**Findings:**
- **Era 1:** `2004-01-13-human-compilers.md`, `2006-04-13-performance-is-overrated.md`, `2006-03-20-curse-of-passion.md`, `2004-03-20-why-opensource-exists.md`, `2005-09-27-words-of-wisdom.md`.
- **Era 2:** `2008-04-21-open-wide.md` (the startup pivot), `2008-04-30-say-it-do-it-prove-it.md`, `2009-08-03-end-of-adobe-air.md`, `2008-11-28-my-strongest-strength.md` (faith), `2009-07-12-adios-jroller.md` (announces adding personal content).
- **Era 3:** `2013-07-16-a-new-day.md` (career-change hinge), `2014-09-08-startup-words-of-wisdom.md`, `2014-09-10-optimized-development-workflow.md` (team of 25), `2011-01-14-3-es-of-engineering.md`, `2014-11-17-rspec-controllers-best-practices.md` (pragmatism-vs-dogma).
- **Era 4:** `2022-07-09-performance-review-mindset-shift.md`, `2023-11-23-my-no-shame-november-story.md` (the PEBCAK reversal), `2024-03-22-scaling-platform-quality.md`, `2025-05-28-agentic-engineering.md`, `2025-08-25-hacker-renaissance.md`, `2026-05-30-engineering-your-remote-engineering-team.md`.

## World-view anchor (Roam block `((NKUuTwhnE))`)
**Findings:**
- The block is Ryan's **Primal World Beliefs** self-assessment (Roam page `[[Primal world beliefs]]`, uid `hdMYPQ9GY`), done **Feb 2023** during a BetterUp executive-leadership intensive (path: "FY23/Q4 SteerCo/Executive Leadership Team (ELT) Intensive in Miami").
- Plain-English translation of the framework: "Primals" are deeply-held, mostly-subconscious, stable beliefs about what the world is fundamentally like (research by Jer Clifton, backed by Marty Seligman; an attempt at a "Big Five of worldviews"). Strongly correlated with well-being; only slightly mutable (via gratitude journaling, meditation).
- Ryan's scores (scale ~1–5, midpoint 3.0), Roam uids in `((NKUuTwhnE))`: **Good 3.52** ("a great world" — assumes ambiguity hides good things), **Enticing 3.82** (world is interesting/worth exploring), **Alive 3.79** (world is responsive/meaningful, not mechanical), **Safe 3.28** (leans safe, most guarded of the four).
- Profile: **optimist-explorer** — assumes the world rewards curiosity and engagement, with a moderate (not naive) sense of safety. Dated exactly at the Era-4 hinge between silence and revival.
- This is an external psychometric anchor to test the blog's implicit world-view against — not something to restate in Roam jargon in the report (per [[feedback-roam-jargon]], translate "Primals," "Enticing," "Alive" into plain terms).

## Identity arc (engineer → leader)
**Findings:**
- **Era 1:** hands-on in-the-trenches Java coder with a frustrating corporate day-job and side OSS (`2005-08-09-web-development-done-right.md`); self-labels "A Passionate Opensource Software Developer" (`2006-03-20-curse-of-passion.md`).
- **Era 2:** leaves corporate Java for a startup (Socialcast) and Rails (`2008-04-21-open-wide.md`); becomes evangelist/community organizer (Wicket user group, ships his own gem, hosts a hack-a-thon `2009-08-12-socialcast-developer-api-released.md`). Still an IC, no management yet.
- **Era 3 is the hinge:** `2013-07-16-a-new-day.md` marks leaving Socialcast for "the unknown." Personal repos (`github.com/wireframe/`) give way to an org he runs (`github.com/thegarage/`, `2014-01-20-replace-rake-with-thor.md`); "**We built**" replaces "my gem"; explicit "team of 25 developers" and onboarding/standards work (`2014-09-10-optimized-development-workflow.md`). Moves from *"here is my gem"* to *"here is the process I standardize across my team."*
- **Era 4:** unambiguous senior eng/product leader at **BetterUp** — "manager of managers" with "significantly more direct reports" (`2022-07-09`), "100+ engineers and 15+ teams" (`2025-03-12-team-topology-graph-visualizer.md`), owns platform-quality and product strategy, ships the BetterUp MCP server (`2025-12-22-my-mcp-learnings.md`), writes remote-leadership manifestos (`2026-05-30`).

## Belief continuity vs. reversal
**Findings:**
- **Continuous through-lines (all 4 eras):**
  - Testing is non-negotiable: `2005-10-05-untested-equals-broken.md` → `2008-04-30-say-it-do-it-prove-it.md` → `2010-12-08-anatomy-of-effective-unit-test.md` → still framing quality work in `2024-03-22`.
  - Clarity/craft over cleverness: `2004-01-13-human-compilers.md`, `2006-04-13-performance-is-overrated.md` → "craftsmanship has no upper bound" (`2024-04-13-the-commit-cycle.md`).
  - Ship small/fast, tolerate imperfection: Era-2 "unreleased code is a liability" → Era-3 "perfect is the enemy of good" (`2014-09-08`) → Era-4 fast-failure/anti-fragility (`2026-02-05-the-greenhouse-innovation-incubator.md`).
  - Anti-bureaucracy / vendor-skepticism: Era-1 anti-JSP/anti-BA crusades → Era-4 anti-RTO-mandate, anti-corporate-"immune-system" (`2026-05-30`, `2026-04-10`).
  - "Make the right thing the easy thing" traces from `2015-09-01-git-excited.markdown` into `2026-05-30`.
- **Documented reversals / maturation:**
  - **Dogma → pragmatism.** Era-1 absolutism ("if it's not tested it's CRAP") softens to explicit "pragmatism vs dogma" judgment calls (`2014-11-17-rspec-controllers-best-practices.md`).
  - **Developer-vs-user reversal (the sharpest).** Old self dismissed users as "PEBCAK"/"User Error"; `2023-11-23-my-no-shame-november-story.md` names that as shame and pivots to customer empathy — which becomes the Era-4 customer-validation gospel (`2024-04-13`, `2025-02-04`).
  - **Focus on self → growing others.** Heads-down "flow is everything" IC identity matures into "it's about helping *them* achieve their full potential" (`2022-07-09`).
  - Smaller tech reversals within Era 2: recants Adobe AIR (`2009-08-03`), reframes Dependency Injection as a testability crutch (`2008-08-09-end-of-dependency-injection_09.md`).

## Tone markers over time
**Findings:**
- **Era 1–3 constant:** combative, profane, exclamation/ALL-CAPS-heavy, sarcastic, `=)` emoticons, unedited typos ("innane," "benifets," "teh new hotness"). Peak vitriol: "consider tossing yourself from a balcony" (`2006-06-14-when-will-hurting-stop.md`), "greatest crimes against humanity" re Adobe AIR (`2010-01-10-airfail-for-html-developers.md`), risqué extended jokes ("Bad Touch Rails," `2010-03-12-rails-good-touchbad-touch.md`). Self-branding ("Dr. Sonnek," "Testing Nazi").
- **Era 4 shift:** still punchy/declarative with fragments and bold emphasis, still anecdote-first and pop-culture-laced (Weird Al, `2024-04-13`), but the profanity and cruelty toward tools/people are gone. Replaced by **cited authorities** (Cagan, Drucker, Clear, Skelton/Pais, Bezos, Conway), numbered frameworks, and a **humble-expert disclaimer tic** ("Every mental model is wrong…some are useful," `2025-02-04-v2ooo.md`; "My Crystal Ball (It's Hazy)," `2025-12-22`). Copy is now edited and structured (headers, lists) vs. the raw fast-drafting of earlier eras.
- Constant across all eras: rhetorical questions, second-person address, personal-anecdote openers, and closing exhortations ("change the world right here right now" in Era 1 → "Let's get to work" in Era 4).

## Signature framings — first appearance & evolution
**Findings:**
- **Passion-as-identity:** Era 1 "curse of passion" (`2006-03-20`) and Era 2 "passion as my strongest fiber" (`2008-11-28`) → sublimated into leadership energy in Era 4.
- **"Change the world, right here, right now":** verbatim in `2005-09-27-words-of-wisdom.md` (Era 1) and `2008-11-28-life-motto.md` (Era 2) — an early idealism that persists.
- **Culture-as-output, team-as-atomic-unit, ownership, customer validation, craft→resilience→antifragile** ([[reference-core-operating-constructs]]): these are Era-4 native (`2026-05-30`, `2024-03-22`, `2026-04-10`) but have clear seeds — ownership/mentoring in `2011-01-14-3-es-of-engineering.md`, customer empathy crystallizing in `2023-11-23`.
- **Faith:** explicit and central in Era 2 (`2009-01-28-3-keys-to-decision-making.md`, `2009-02-12-science-of-random.md`), largely recedes from the public blog by Era 4 (present as values, not doctrine).

## Per-era world-view inference (Primals + fixed/growth mindset)
**Findings (inferred from text; the only measured datapoint is Feb-2023 Primals):**

Reading each era against the four Primals dimensions (Good / Safe / Enticing / Alive) and Dweck's fixed-vs-growth mindset. The scores below are analyst estimates from the writing, not measurements, except the Era-4 Primals row which is Ryan's actual Feb-2023 assessment.

- **Era 1 — The Ranter (2003–06): curious mind, defended self.**
  - Enticing HIGH, Alive HIGH, Safe LOW, Good MIXED. Tech is art worth devoting a life to (`2004-03-20-why-opensource-exists.md`), and individual action matters ("change the world, right here, right now," `2005-09-27`). But the human world is adversarial — sorted into people who "get it" vs. "mindless drones" (`2005-10-10-real-world.md`), full of enemies (JSP, vendors, management) to be fought. Low Safe.
  - **Mindset: predominantly FIXED — but only about people and self, not skills.** The tell is talent-as-innate sorting: "mindless drones," "those who get it," and passion framed as fixed wiring ("built with passion as one of the strongest fibers in my being," `2006-03-20-curse-of-passion.md`). Being *right* is identity; disagreement is others' stupidity, not a learning signal. Yet he was voraciously learning new tools the whole time — so the fixed mindset governed his view of *people and his own worth*, not his craft. This is the important nuance: his hypothesis holds, but the fixed part was social/self-evaluative, never technical.
- **Era 2 — The Evangelist (2007–09): the world gains meaning.**
  - Enticing HIGH, Alive HIGH (now explicit), Good RISING, Safe still guarded. Faith reframes the world as purposeful and responsive — "the outcome is in God's hands" (`2009-01-28-3-keys-to-decision-making.md`), gratitude and love as themes (`2009-01-04-giving-is-gift.md`). The Alive dimension maps almost directly onto this theistic, world-is-intentional frame.
  - **Mindset: transitional.** Still fixed markers ("Testing Nazi," "prove it / I don't believe you," `2008-04-30`). But two growth seeds appear: talents framed as gifts to be *stewarded and grown* ("do your job…plus one," `2008-12-02`), and the willingness to publicly recant (Adobe AIR, DI — `2009-08-03`, `2008-08-09`). Changing his mind starts becoming acceptable.
- **Era 3 — Team Lead (2010–14): comfort with change, investing in others.**
  - Safe RISING (empowered, trusted, chose his path), Enticing HIGH but rationed by family/time, Alive HIGH. The world rewards those who keep moving.
  - **Mindset: pivots toward GROWTH.** The hinge post is explicit: "If you are unwilling to change, you are *guaranteed* to atrophy," closing on "Stay hungry. Stay foolish." (`2013-07-16-a-new-day.md`) — he *voluntarily leaves the comfortable known for the unknown*, the defining growth-mindset move. Backed by "it is better to be wrong than undecided" / "perfect is the enemy of good" (`2014-09-08`), "pragmatism vs dogma" (`2014-11-17`), and investing in others' growth ("train new developers…mentor developers of the future," `2011-01-14`). The drones-vs-those-who-get-it sorting has faded.
- **Era 4 — The Leader (2015–26): open, low-defense, growth by default.**
  - Measured Feb-2023 Primals: **Good 3.52, Safe 3.28, Enticing 3.82, Alive 3.79** — optimist-explorer, moderately (not naively) safe. The blog matches: "what a time to be alive" (`2025-08-25`), curiosity about AI, wariness of complacency rather than of people.
  - **Mindset: fully GROWTH, and the old fixed frame is explicitly repudiated.** The single sharpest before/after in the whole archive: Era-1 "people who get it vs. mindless drones" becomes **"Talent is equally distributed. Opportunity is not"** (`2026-05-30`). Talent went from innate-and-sortable to universal-and-conditional. Reinforced by "today is the worst these agents will ever be" (`2025-05-28`), "craftsmanship has no upper bound" (`2024-04-13`), identity-based habit change from Atomic Habits (`2022-07-09`), "half our ideas are just not going to work" and "every mental model is wrong, some are useful" (`2024-04-13`, `2025-02-04`) — being wrong is now data, not shame.

**Your prior self vs. now, in one line:** the old self was a *curious, defended perfectionist* — high on exploring ideas, low on trusting people, ego fused to being right (fixed mindset about people and self). The current self is a *curious, open builder* — same exploratory drive, but ability is malleable, being wrong is information, and talent is everywhere. The clearest proof isn't a mood shift; it's a specific reversal: **"mindless drones" (2005) → "talent is equally distributed, opportunity is not" (2026),** and the **PEBCAK/"User Error" → customer-empathy** turn (`2023-11-23`).

**Candid caveat (per D4):** "fixed → growth" is true but slightly too clean if applied to your *whole* worldview. You were always growth-oriented about *skills and technology* — even Era 1 shows relentless self-teaching. What actually flipped was the *social/self-evaluative* layer: how you judge other people's potential, and whether your self-worth depends on being right. That's where the fixed mindset lived, and that's what changed.

## Patterns Observed
- **Constant DNA across 23 years:** opinionated, direct, anecdote-driven, anti-bureaucratic, craft-obsessed, testing-evangelist, techno-optimist. The *values* barely move; the *scope* and *manners* do.
- **The unit of concern scales with the author's role:** a method/gem (Era 1–2) → a team's lifecycle (Era 3) → an engineering org and its culture (Era 4). Identity change is legible directly in what he chooses to write about.
- **Tone civilizes without going corporate:** the punch stays, the cruelty and profanity leave, authority is now borrowed from cited thinkers rather than asserted by insult.
- **The world-view anchor matches the text:** the "optimist-explorer, moderately-safe" Primals profile (Feb 2023) lines up with the blog's persistent techno-optimism and curiosity, and the "most guarded on Safe" score echoes the recurring wariness of complacency/bureaucracy.

## Constraints Discovered
- **Quantifiable-per-era metrics are limited.** Reliable hard numbers: post counts/year, post length, and coarse topic tags. "Tone" (confidence, profanity, humor) is a qualitative read, not a measured score — any visual (D6) that charts "tone" is presenting *analyst-assigned* ratings, not data. This must be labeled honestly in the visual, not dressed up as measured sentiment.
- **Era sizes are wildly unequal** (144 posts vs. 15). Sampling depth differs by era; the report should not over-claim precision for the sparse late era even though those posts were read in full.
- **World-view input is a single Feb-2023 datapoint**, not a time series — it anchors the *present* world-view, and earlier-era world-view must be inferred from the text alone.
- **Faith content** is a real, evidenced thread (Era 2) that later recedes from the public blog. Per the "fully candid" decision (D4) it belongs in the report, handled factually.

## Open Decisions (must be resolved before /structure)
- None. All decisions in decisions.md are Firm or Preference. D6 (visual companion) is a Preference; `/structure` should scope it modestly and honor the "tone is analyst-rated, not measured" constraint above rather than build a data-dashboard that implies false precision.
