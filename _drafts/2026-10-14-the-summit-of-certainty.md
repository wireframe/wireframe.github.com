---
title: "The Summit of Certainty"
featured_description: >
  Discovery and delivery are two different kinds of work. How to tell which side of the hill a project is on, and how to fund the climb.
tags:
- engineering
- product-development
- leadership
---

## Are We There Yet?

Every new project gets the same question, before anyone has written a line of code: "How long is it going to take?" For work we've done a dozen times, there's a real answer. For something new, there isn't: we don't know what we're building yet, so we can't know how long it will take.

We give a number *anyway*. Someone needs it for the roadmap, and "I don't know" sounds like we skipped our homework. So we pick something reasonable, pad it, and say it out loud. That number is wrong by more than any padding covers. Steve McConnell's [cone of uncertainty](https://www.construx.com/wp-content/uploads/2019/02/CxWhitePaper_ConeOfUncertainty.pdf) puts an initial-concept estimate off by as much as 4x either way: a six-month guess covers six weeks to two years.

That **guesstimate** becomes the commitment. Once a date is said out loud, the company plans around it and the team works backwards from it, cutting whatever has to go. Open questions get quick answers, experiments get skipped, and building starts before anyone knows what to build. The date gets hit, and what ships is the first idea we had.

The honest answer to "how long?" is "I'll tell you once we can see the rest of the work." Every project reaches the point where the big questions have answers and the remaining steps come into view. I call it **The Summit of Certainty**.

## Up One Side, Down the Other

Basecamp drew the picture I use for this: work is a hill. On the uphill side, you're figuring out what to build. On the downhill side, you're building it. Every step up adds certainty, and at the top you can see the rest of the route. Here's Basecamp's hill chart, with my labels added:

![A hand-drawn hill. Climbers on the uphill side have question marks over their heads, under the label Uncertainty. One stands at the top, labeled Summit of Certainty. One walks down the other side, under the label Certainty.](/images/2026-10-14-summit-hill.png)

Ryan Singer wrote the hill up in *Shape Up*:

> From this vantage point, you can see all of the steps that are left. It's even fair to estimate how long all the work will take.
> — Ryan Singer, *[Shape Up](https://basecamp.com/shapeup/3.4-chapter-13)*

The two sides feel different to walk. Uphill there's no visible trail. It works like fog of war in a strategy game: the map lifts only where you've already walked, so the climb is a series of choices about where to look next. Some switchbacks double back over ground you already covered, and some of the wandering turns out to have been the path all along. You only see that looking back. Downhill the path still winds, but it's marked, and the work is following it.

That's why discovery, figuring out what to build, is the hardest part of any project to manage. Delivery can take a long time, but we know how to manage that: break it into tasks, estimate them, track the burndown. **Most teams I've watched manage discovery with the delivery playbook.**

Real projects are rarely a single hill. Discovery and delivery run at the same time, and every scope inside a project gets its own hill (Basecamp plots each one as its own dot). Each dot is answering one question: do we know yet what it will take to build this?

## Four Trail Markers to the Summit

Discovery means carrying four questions up the hill:

1. Will customers use it?
2. Can they figure out how?
3. Can we build it?
4. Does it work for the business?

These are [Marty Cagan's four big risks](https://www.svpg.com/four-big-risks/) (value, usability, feasibility, and viability), phrased the way a team asks them on the way up. The summit is where you can answer all four. Answered doesn't mean *proven*, and I encourage being at the summit once you have ~80% of the answers, which generally aligns with [Jeff Bezo's classic guidance](https://www.aboutamazon.com/news/company-news/2016-letter-to-shareholders).

Feasibility can be answered at a whiteboard and usability in a hallway test, but value is the most unknown of the four.  Value can only be answered by real customers choosing to use the thing, on their schedule. That makes a demo a **false summit**. From below it looks like the top: the prototype works and the room applauds. But a demo has answered whether we can build it, and maybe whether people can use it. Whether customers will choose it is still open, and there's more hill behind the crest.

Even a prototype in front of real users, which is the best value test there is and worth running as one, can lead to a misread trail: "Isn't it already done?" Reaching the top is not the end of the hike. A prototype is something you can demo. A product is something you can run the business on, and turning one into the other is the whole second half.

## Hidden Below the Treeline

Most of the climb is invisible. A week of discovery produces customer interviews, a throwaway prototype, and two approaches ruled out, and none of that appears in a status report as progress. There's no upfront backlog to burn down, because nobody knows the work yet. The **discovery backlog** is a list of open questions, and answering one often adds two. A dead end only counts as progress in hindsight, once it's clear which path was the route.

Invisible work doesn't get funded. A budget line needs something to point at, and by default the climb has nothing to show until it's nearly over. That default is a choice, and most teams make it without noticing. The work still has to be tracked, so **leave breadcrumbs** as you climb: write down each question you set out to answer, what you tried, what you learned, and which paths you ruled out. That log is the climb's version of a commit history. It's how the team sees how far it has come, and how the company sees the work it's paying for.

Discovery is unknown by definition, and a business can't run on an open-ended unknown. Finance needs a number to plan around, and the team needs to know what it has to work with. Shape Up has the right word for the answer:

> An appetite is completely different from an estimate. Estimates start with a design and end with a number. Appetites start with a number and end with a design.
> — Ryan Singer, *[Shape Up](https://basecamp.com/shapeup/1.2-chapter-03)*

An appetite for the climb gives both. We set the resourcing and the timeline we're willing to invest in an answer, and a **drop-dead date** on which we decide whether to build, change course, or stop. That's the first honest answer to "how long is it going to take?": we'll spend this long finding out, and we'll tell you the rest from the top. If the team isn't over the top when the date arrives, the kill switch is built in: the money goes to a different bet. Mountaineers call that a turnaround time, the hour they start back down no matter how close the top looks, and they set it before they leave camp. The date can move, but only one way: the team goes back to the people who funded the climb, shows them what it has learned, and asks for more. An appetite renegotiated in the open is still an appetite. One that quietly slips is an estimate again.

The climb is worth paying for because most ideas fail. Cagan's first inconvenient truth is that "at least half of our ideas are just not going to work," [the same number I built The Commit Cycle around]({% post_url 2024-04-13-the-commit-cycle %}). The climb is where you find out which half, for the price of a prototype instead of a product.

The strongest objection to funding discovery at all is that some discovery never ends in a decision. I've written about [the innovation lab that becomes a place where activity masquerades as progress]({% post_url 2026-02-05-the-greenhouse-innovation-incubator %}). The decide-by date is the difference: on that day the team commits, changes course, or stops, and the lab never has a day like that.

The delivery playbook still works. It starts at the top. Past that point estimates hold, a ship date can be promised, velocity means something, lead time measures the work that started after the top, and "how long is it going to take?" finally has an answer.

## Go Alpine

Mountaineers call the fast way up alpine style: a small team with light packs, moving quickly, where expedition style brings a large team, fixed ropes, and stocked camps. Discovery has an alpine style too.

How long the hike takes depends on the project. Some are clear early (a platform migration, say), and some spend most of their life on the climb. The team's choices change the slope. In the worst case the climb is long and shallow with a late turning point. In the best case it's steep and early, because the team did its discovery up front. Skip it and the unknowns ride along to the ship date, what McConnell calls ["a Cloud that persists to the end of the project."](https://www.construx.com/wp-content/uploads/2019/02/CxWhitePaper_ConeOfUncertainty.pdf)

![Two curves plotted over time. Worst case: a long, shallow climb with a sharp peak near the end. Best case: a steep climb to an early peak, then a long, gradual descent.](/images/2026-10-14-worst-vs-best.png)

**Start by listing the questions**, then climb the hardest face first. Hal Gregersen's [question burst](https://hbr.org/2018/03/better-brainstorming) is the fastest way I know to get the list, because it bans answers until the questions are on the table. Then sort the list against Cagan's four risks: which unanswered question kills the project if the answer is no? That one gets the first prototype.

**Build something**. Singer's diagnosis of a team stuck on the climb is that ["somebody did the uphill work with their head instead of their hands."](https://basecamp.com/shapeup/3.4-chapter-13) A working prototype answers more than a plan. Build it cheap, though. Cagan's rule of thumb in [Inspired](https://www.svpg.com/books/inspired-how-to-create-tech-products-customers-love-2nd-edition/) is that testing an idea should cost at least an order of magnitude less than building it, and the gap is the point: a prototype that costs as much as the product *is* the product, built before anyone knows it's the right one. AI is this decade's accelerator for the climb. [Every week another crazy idea turns into semi-usable software]({% post_url 2025-08-25-hacker-renaissance %}), and a prototype that takes hours answers feasibility and usability for almost nothing. It leaves value and viability exactly where they were, because no model can decide to buy your product.

**Leave the downhill work for the downhill**. The hill sorts work by how clear it is, not by how important it is. Non-functional requirements, localization, error handling, accessibility, and performance all matter, all can be specified on day one, and all can wait until after the top. Localizing a feature that dies in discovery is pure waste. Security is the exception, and I never defer it.

> It's better to get a few critical scopes over the top early in the project and leave the screw-tightening for later.
> — Ryan Singer, *[Shape Up](https://basecamp.com/shapeup/3.4-chapter-13)*

## Pack for the Full Hike

For your biggest project right now:

1. **Stake the hill.** Ask everyone on the team to mark where it sits on the hill, then compare the marks. Basecamp has the people doing the work place the dots themselves, and the spread between them is the first thing worth talking about.
2. **Reset your discovery appetite.** If it's still climbing, give it a budget and a date to decide by, and say both out loud to the team and to the company.
3. **Climb light.**  List the questions, prototype the scariest one first, and leave the downhill work for the downhill.

Climb before you commit.
