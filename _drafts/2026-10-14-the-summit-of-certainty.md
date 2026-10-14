---
title: "The Summit of Certainty"
tags:
- product development
- engineering
---

## Are We There Yet?

Every new project gets the same question, usually before anyone has written a line of code: "How long is it going to take?"

For work we've done a dozen times, that question has a real answer. For something nobody on the team has built before, it doesn't. We haven't figured out what we're building yet, so we can't know how long it will take to build.

We give a number anyway. Someone needs it for a roadmap, a board update, or a customer call, and "I don't know" sounds like we skipped our homework. We pick something reasonable, pad it a little, and say it out loud.

That number becomes the commitment. Teams that take their word seriously make this worse. I wrote ["we do what we say, deliver on our commitments, and own our time"](https://build.betterup.com/extreme-ownership-at-betterup/) into my team's engineering tenets, and a team that keeps its word will keep a guessed word too. So we back into the date. Open questions get quick answers, experiments get skipped, and the team starts building before it knows what to build, because the calendar says it's time.

The honest answer to "how long?" is "I'll tell you once we can see the rest of the work." Every project reaches a point where that answer becomes possible, where the big questions have answers and the remaining steps come into view. I call it **The Summit of Certainty**.

## Up One Side, Down the Other

Basecamp drew the picture I use for this: work is a hill. On the uphill side, you're figuring out what to build. On the downhill side, you're building it. Every step up adds certainty, and at the top you can see the rest of the route. Here's how I drew it for my team in 2018:

![A hand-drawn hill. Climbers on the uphill side have question marks over their heads, under the label Uncertainty. One stands at the top, labeled Summit of Certainty. One walks down the other side, under the label Certainty.](/images/2026-10-14-summit-hill.png)

Ryan Singer wrote the hill up in *Shape Up*:

> From this vantage point, you can see all of the steps that are left. It's even fair to estimate how long all the work will take.
> — Ryan Singer, *[Shape Up](https://basecamp.com/shapeup/3.4-chapter-13)*

Most of us learned a different chart, the cone of uncertainty: wide at the start, narrowing smoothly toward delivery. Drawn that way, nothing on it tells a team when the kind of work changes. The hill has a top. (Steve McConnell, who named the cone, [would object to the smooth version too](https://www.construx.com/wp-content/uploads/2019/02/CxWhitePaper_ConeOfUncertainty.pdf). In his telling it narrows only when the team does the work to narrow it.)

The two sides feel different to walk. Uphill there's no visible trail. It works like fog of war in a strategy game: the map lifts only where you've already walked, so the climb is a series of choices about where to look next. Some switchbacks double back over ground you already covered, and some of the wandering turns out to have been the path all along. You only see that looking back. Downhill the path still winds, but it's marked, and the work is following it.

That's why discovery, figuring out what to build, is the hardest part of any project to manage. Delivery can take a long time, but we know how to manage that: break it into tasks, estimate them, track the burndown. **Most teams I've watched run that one playbook on both sides of the hill.** Marty Cagan has names for the two modes, [building to learn and building to earn](https://www.svpg.com/prototypes-vs-products/), and only one of them fits a burndown chart.

Real projects are rarely a single hill. Discovery and delivery run at the same time, and every scope inside a project has its own hill (Basecamp plots each one as its own dot). The mix shifts as more of those dots cross the top. The question for any one piece of work stays the same: which side of the hill is it on?

## Four Trail Markers to the Summit

Discovery means carrying four questions up the hill:

1. Will customers use it?
2. Can they figure out how?
3. Can we build it?
4. Does it work for the business?

These are [Marty Cagan's four big risks](https://www.svpg.com/four-big-risks/) (value, usability, feasibility, and viability), phrased the way a team asks them on the way up. The summit is where you can answer all four.

Answered doesn't mean proven. My gut check for the top is 70 to 80 percent sure: answers I'd bet on. Jeff Bezos made the general case in his [2016 letter to shareholders](https://www.aboutamazon.com/news/company-news/2016-letter-to-shareholders): "most decisions should probably be made with somewhere around 70% of the information you wish you had." A team that waits for the last 20 percent never commits.

Value takes the longest. Only real customers using the thing can answer it, so it's the risk to start on first, and it will still finish last. That makes a demo a **false summit**. From below it looks like the top: the prototype works and the room applauds. A prototype demoed to stakeholders has answered whether we can build it, and maybe whether people can use it. Whether customers will choose it is still open, and there's more hill behind the crest. A prototype is something you can demo. A product is something you can run the business on.

"Why can't we just ship the prototype?" is a question I keep getting. The honest answer starts with which of the four risks the prototype has retired. Sometimes the answer is yes, as an experiment: ship it to a small group under that name, and treat what comes back as the value answer. It can't ship as the product while value and viability are still open.

## Hidden Below the Treeline

The engineering metrics that reach the executive dashboard start counting at the top of the hill. DORA defines lead time as ["the amount of time it takes for a change to go from committed to version control to deployed in production"](https://dora.dev/guides/dora-metrics-four-keys/), so everything before the first commit sits outside it by design. Velocity and burndown count tasks, and on the climb the task list grows as the team learns, so a burndown drawn uphill is measuring a list that hasn't finished growing. These are good delivery metrics. The mistake is making them the only instruments.

The first commit used to be a fair sign that a team had reached the top. It isn't anymore, so a team has to say out loud which side it's on.

Accounting draws the same line. Under US GAAP, the cost of building internal software is expensed while the project is still being figured out, and capitalized only once management commits funding and completion is probable. The [2025 update to the standard](https://arch.bdo.com/New-ASU-on-Internal-Use-Software-Costs-Guidance) goes further: capitalization waits while "significant development uncertainty" exists, and that uncertainty is resolved "through coding and testing."

Estimates have the same problem. Any single-number estimate made before the top is a guess. McConnell puts estimates made at the initial concept [off by as much as 4x in either direction](https://www.construx.com/wp-content/uploads/2019/02/CxWhitePaper_ConeOfUncertainty.pdf). The honest early estimate is a range.

The strongest objection to funding the climb: some discovery never ends in a decision. I've written about [the innovation lab that becomes a place where activity masquerades as progress]({% post_url 2026-02-05-the-greenhouse-innovation-incubator %}). A climb nobody has to finish fails the same way.

The answer is to fund the climb with a budget and a date to decide by. Shape Up calls the budget an appetite:

> An appetite is completely different from an estimate. Estimates start with a design and end with a number. Appetites start with a number and end with a design.
> — Ryan Singer, *[Shape Up](https://basecamp.com/shapeup/1.2-chapter-03)*

Basecamp sets an appetite for building. I set one for the climb itself: we'll spend six weeks finding out, and on that date we decide whether to build, change course, or stop. A decide-by date is a date finance can plan on. The same tenets that make a team keep a guessed date also say ["when the unexpected arises, we revise our plans and re-negotiate with our stakeholders,"](https://build.betterup.com/extreme-ownership-at-betterup/) and a decide-by date puts that renegotiation on the calendar instead of leaving it to whoever notices first. Once the team is over the top, set the date to ship by.

The climb is worth paying for because most ideas fail. Cagan's first inconvenient truth is that "at least half of our ideas are just not going to work," [the same number I built The Commit Cycle around]({% post_url 2024-04-13-the-commit-cycle %}). The climb is where you find out which half, for the price of a prototype instead of a product.

The delivery playbook still works. It starts at the top. Past that point estimates hold, velocity means something, lead time measures the work that started after the top, and "how long is it going to take?" finally has an answer.

## Go Alpine

How long the climb takes depends on the project. A platform migration is clear early and arduous after: everyone knows what done looks like in the first week. A new product can spend most of its life on the climb. In 2018 I drew two versions of the curve for my team. In the worst case the climb is long and shallow, with a late turning point. In the best case it's steep and early.

![Two curves plotted over time. Worst case: a long, shallow climb with a sharp peak near the end. Best case: a steep climb to an early peak, then a long, gradual descent.](/images/2026-10-14-worst-vs-best.png)

Part of the slope is a choice. McConnell says the same about the cone: ["The Cone narrows only as you make decisions that eliminate variability."](https://www.construx.com/wp-content/uploads/2019/02/CxWhitePaper_ConeOfUncertainty.pdf) Skip that work and the uncertainty becomes "a Cloud that persists to the end of the project." The work that narrows it is discovery, and how much of it a team does sets the slope. Not every part of the climb compresses, though. A team can shorten the work but not the calendar: retention shows up over weeks of real use, and a regulator answers on its own schedule. Everything else is ours to speed up.

Mountaineers have a name for the fast way up. Expedition style uses a large team, fixed ropes, and stocked camps. Alpine style uses a small team with light packs, moving quickly. Discovery has an alpine style too.

Start by listing the questions, then climb the hardest face first. Hal Gregersen's [question burst](https://hbr.org/2018/03/better-brainstorming) is the fastest way I know to get the list, because it bans answers until the questions are on the table. Then sort the list against Cagan's four risks: which unanswered question kills the project if the answer is no? That one gets the first prototype.

Build something. Singer's diagnosis of a team stuck on the climb is that ["somebody did the uphill work with their head instead of their hands."](https://basecamp.com/shapeup/3.4-chapter-13) A working prototype answers more than a plan, and Cagan's rule of thumb in [Inspired](https://www.svpg.com/books/inspired-how-to-create-tech-products-customers-love-2nd-edition/) is that testing an idea should cost at least an order of magnitude less than building the product.

AI is this decade's accelerator for the climb. [Every week another crazy idea turns into semi-usable software]({% post_url 2025-08-25-hacker-renaissance %}), and a prototype that takes hours answers feasibility and usability for almost nothing. It leaves value and viability exactly where they were, because no model can decide to buy your product.

Leave the downhill work for the downhill. The hill sorts work by how clear it is, not by how important it is. Non-functional requirements, localization, error handling, accessibility, and performance all matter, all can be specified on day one, and all can wait until after the top. Localizing a feature that dies in discovery is pure waste. Security is the exception, and I never defer it.

> It's better to get a few critical scopes over the top early in the project and leave the screw-tightening for late.
> — Ryan Singer, *[Shape Up](https://basecamp.com/shapeup/3.4-chapter-13)*

Put your most experienced people on the climb. The same team climbs and descends, but someone who has climbed before should lead it. In [Mihaly Csikszentmihalyi's flow model](https://en.wikipedia.org/wiki/Flow_%28psychology%29), challenge that outruns skill produces anxiety instead of flow, and uphill work is almost all challenge.

## Pack for the Full Hike

Three things to do on Monday:

1. Name which side of the hill each project is on, out loud.
2. Fund the climb with a budget and a date to decide by.
3. Climb light and fast: questions first, cheap prototypes, and experienced people leading.

Pick your biggest project. Is it uphill or downhill, and does everyone working on it give the same answer?
