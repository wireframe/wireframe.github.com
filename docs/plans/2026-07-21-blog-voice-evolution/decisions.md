# Decisions: blog-voice-evolution

Date: 2026-07-21

Task: Analyze the blog archive for how Ryan has changed as a professional / leader / engineer over the years — what has shifted in tone, personality, and world-view.

## D1: Deliverable format
**Question:** What should the deliverable be for this analysis?
**Firmness:** Firm
**Options considered:**
- Written report to Ryan (private markdown, analytical, with quoted examples)
- Visual timeline artifact (interactive era cards, tone charts)
- Raw evidence + patterns (data-forward, light on narrative)
- Material shaped toward a future blog post
**Chosen:** Written report to Ryan — private analytical write-up in markdown, describing the arc across eras with quoted examples from the posts. Not for publication. **Plus a visual companion** (see D6) to explore tone/voice shifts at a glance.
**Rationale:** Ryan wants this for his own reflection. A narrative report (not a publish-ready draft) is the primary format he picked; he later added that a visual exploration of the changes "would be cool."

## D6: Visual companion to the report
**Question:** (Added mid-research) Should the analysis include a visual way to explore tone/personality changes over time, not just prose?
**Firmness:** Preference
**Options considered:** Prose-only report; report + a self-contained visual artifact (timeline of eras, tone/confidence trend indicators, era cards with representative quotes); full interactive dashboard.
**Chosen:** Report + a self-contained visual artifact alongside it. Exact form (timeline vs. era cards vs. small-multiple trend charts) to be decided in structure/implement, grounded in whatever the research quantifies.
**Rationale:** Ryan said exploring the changes visually "would be cool" — a lean, not a hard requirement. Keep it a companion to the written report, not a replacement. What can actually be visualized depends on which tone/voice signals the research can measure per era (post frequency, length, dimension scores, quote pulls). Over-investing in a polished dashboard is not warranted unless Ryan confirms he wants it.

## D2: Archive scope
**Question:** How much of the archive should the analysis cover, given posts run 2003 → present?
**Firmness:** Firm
**Options considered:**
- Full archive, all eras (broad, relies on per-era sampling)
- Recent years, deeper (last 5–7 years, earlier as backdrop)
- Bookends comparison (earliest vs. most recent)
**Chosen:** Full archive, all eras (2003 → 2026).
**Rationale:** Ryan wants the complete arc, not a snapshot. Research phase will need to segment the 20+ year span into eras and sample representative posts per era rather than deep-reading every single post.

## D3: Analytical dimensions
**Question:** Which dimensions should the report emphasize most?
**Firmness:** Firm
**Options considered:** Tone & voice; Identity shift (engineer → leader → product/strategy); Beliefs & values; Topics & focus.
**Chosen:** Tone & voice, Identity shift, Beliefs & values — **plus a world-view dimension** Ryan added explicitly.
**Rationale:** Ryan selected the first three and added "consider my changes from a world-view perspective." Topics & focus was NOT selected as a primary lens (may appear as supporting evidence, but is not a headline dimension). World-view is a firm fourth dimension; its precise definition is partly to be informed by the referenced Roam doc (see Research Focus Areas).

## D4: Candor level
**Question:** How candid should the report be about less-flattering changes (blind spots, regressions, contradictions, over-corrections)?
**Firmness:** Firm
**Options considered:** Fully candid; Balanced but gentle; Descriptive only.
**Chosen:** Fully candid — name regressions, contradictions, and blind spots directly alongside the growth. Honest mirror, not a highlight reel.
**Rationale:** Ryan explicitly wants an honest mirror. Critical observations must still be grounded in textual evidence, not invented.

## D5: World-view reference input (Roam)
**Question:** (Implicit) What source material informs the "world-view" lens?
**Firmness:** Firm
**Options considered:** n/a — Ryan provided a specific Roam block reference.
**Chosen:** Roam block `((NKUuTwhnE))` is a required research input for the world-view dimension.
**Rationale:** Ryan supplied this block ref alongside the world-view dimension. Research phase must resolve it. Before reading the graph: call `get_graph_guidelines` for the relevant graph first (per MCP server instructions), and translate any Roam-internal shorthand into plain English in the final report (standing preference: [[feedback-roam-jargon]]).

## D7: Era count — three, not four (revised after analysis)
**Question:** Does "The Evangelist" (2007–2009) stand as its own era, or is it a transition to be absorbed?
**Firmness:** Firm (revised post-analysis)
**Chosen:** Collapse to **three eras** — The Ranter (2003–2007, 169 posts), The Builder (2008–2014, 104), The Leader (2015–2026, 17). The old Evangelist dissolves: 2007 folds into the Ranter; 2008–2009 becomes the front of the Builder, which also absorbs the old Team Lead (2010–2014).
**Rationale (proven from the archive, year-by-year keyword pass):** In 2007, 24 of 25 posts were still Java (96%) — statistically identical to the Ranter years (78–81% Java). The Java→Ruby pivot actually runs 2008–2011 (Ruby-tagged posts 8%→28%→44%→75%→82%), straddling the old Evangelist/Team-Lead boundary rather than fitting inside 2007–09. Faith language is diffuse (2006 had as many faith posts as 2009), not a 2007–09 signature. Combative tone is continuous to ~2010 (peak vitriol — the Adobe AIR line — is 2010). Only posting cadence set 2007–09 apart, and cadence is not identity. Propagated across `report.md`, `evidence.md`, `research.md`, `evolution.html`, and the blog draft `_drafts/2026-07-22-from-cynic-to-stoic.md`. (The original four-era task descriptions in `plan.md` are left as an execution record; this decision supersedes them.)

## Research Focus Areas
- Inventory the full `_posts/` archive: list every post with date and title, then segment the 2003→2026 span into coherent eras (e.g. by role, topic cluster, or writing-style breaks). How many posts per era?
- Per era, identify 2–4 representative posts to quote from for tone/voice evidence.
- Resolve Roam block `((NKUuTwhnE))` — orient via `get_graph_guidelines` first, then read the block and its context. What does it say about Ryan's world-view, and how should "world-view" be operationalized as an analytical dimension?
- Trace the identity arc through the text: where does the writing shift from engineer-voice → team/leadership-voice → product/strategy-voice? Which posts mark the transitions?
- Trace belief continuity vs. reversal: which convictions recur across decades, and where has Ryan explicitly or implicitly changed his mind?
- Characterize tone markers over time: sentence rhythm, use of anecdote, confidence/hedging, humor, formality, rhetorical questions, directness.
- Cross-reference Ryan's known signature framings ([[reference-core-operating-constructs]]) — when do these first appear, and how did they evolve?
