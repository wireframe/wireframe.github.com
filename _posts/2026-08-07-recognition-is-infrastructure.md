---
title: "Recognition Is Infrastructure"
featured_description: >
  How to build a recognition system that's cheap, frequent, and open to anyone in the org
tags:
- engineering
- leadership
- culture
---

## When Nothing Breaks, Nobody Claps

One of our teams spent months migrating our infrastructure to a new cloud provider. They worked carefully through prelaunch testing, and when they finally flipped the switch to cutover, we all held our breath. The cutover was a non-event. No incident channel lit up, no support tickets, no customers noticing a thing had changed underneath them.

The team did tremendous work, and once the cutover was behind us, it was "back to business as usual."  The moment stuck with me. A "quiet launch" is a rare thing. Look at what actually gets celebrated at most companies: the launch that survived a 2am fire drill, the escalation someone talked a customer down from, the outage that got fixed before the exec team even heard about it. Drama makes a story. A story is easy to recognize. A migration that goes exactly according to plan produces no story at all, so by default it goes unmarked — even though avoiding the fire is harder and more valuable than fighting it well.

So we created an award for the team that had nothing to show for their work except the *absence* of a disaster: "The Crickets Award".  No cash attached, no budget request, and no approval chain.  Just a small custom-made trophy with the team name and project engraved and a short informal ceremony to shine a spotlight on the work. 🦗


## Petty Cash Depreciates, Memories Compound

Ask anyone how they want to be recognized at work and they'll describe a budget line item: a bonus, a raise, a comp adjustment.  The research tells a very different story about what people *say* they want versus what they *actually* value. Both Google and [McKinsey](https://www.mckinsey.com/capabilities/people-and-organizational-performance/our-insights/motivating-people-getting-beyond-money) have found non-cash recognition to be more memorable, more thoughtful, and appreciated over a longer time frame.  As Laszlo Bock puts it in *[Work Rules!](https://books.google.com/books/about/Work_Rules.html?id=YbPCoAEACAAJ)*, "The joy of money is fleeting, but memories last forever."

Cash also has a hard ceiling on frequency. Nobody hands out a bonus every week, and even occasional spot bonuses carry friction, delays, and denials.  Chip and Dan Heath put a number on how often recognition needs to happen:

> The proper pace of recognition is weekly or even daily, not monthly or yearly.
> — Chip & Dan Heath, *[The Power of Moments](https://www.simonandschuster.com/books/The-Power-of-Moments/Chip-Heath/9781501147760)*

Every dollar spent needs approval, so every instance of recognition inherits that approval cycle's latency. A system that has to clear finance cannot run weekly. The budget gate is only half the problem, though. The deeper one is who's allowed to generate recognition in the first place.

## The Bottleneck Is the Org Chart

[Gallup's research](https://www.gallup.com/workplace/236441/employee-recognition-low-cost-high-impact.aspx) found that roughly two-thirds of employees' most memorable recognition came through the management layer.  While not surprising, that points straight at the real constraint: **capacity**.  If a manager is the only person dispensing recognition, the system is constrained by definition: one person, finite attention, finite hours in a week, no matter how much they care. 

Aubrey Daniels has spent a career arguing the largest untapped resource for breaking that capacity constraint already exists within every single organization: **it's your peers**. The people sitting next to you each and every day have far more opportunities to recognize great work than anyone with a "manager" job title ever will. Peers add quantity, and they also raise **quality**. A manager sees a fraction of anyone's actual work while peers see the the real meat of the work: the craft within the pull request, the 11pm Slack message asking for a sanity check, the customer call nobody wrote a summary of. That's exactly what Daniels is describing:

> Peers are the most effective source of reinforcement at work—and the most underutilized. Peers are in the best position to deliver positive and immediate reinforcement (positive, immediate, and certain consequences [PICs]) because they can observe performance more closely and more often than most supervisors and managers.
> — Aubrey Daniels, *[Bringing Out the Best in People](https://www.aubreydaniels.com/store/books/bringing-out-the-best-in-people)*

Everyone agrees that peer recognition matters. The gap is structural, not attitudinal. In most orgs the only valve for recognition runs through the manager, which ignores the highest-bandwidth channel by design.

Opening that valve took very little investment in tooling, but it took time for the habits to form within the organization.  A simple system where any person could post recognition to a feed the whole company could read.  Operating in real-time, 24/7, without friction, approvals, or a specific job title to recognize another person's work.

Who's empowered to give recognition matters more than what currency it's paid in.

## The Ground Game

The behaviors you recognize are the behaviors you will get more of. Currency and permissions are two of the three dials. The third is what you point the recognition at.

The obvious target is **results**. Ship the thing, hit the number, close the deal. The trouble is that results are only *partly* within our control. A team can run a flawless quarter and still miss, and a team can stumble through one and get lucky anyway. Poker players call this *resulting*: grading a decision by how it turned out rather than by how it was made. Annie Duke brought the term to the rest of us in *[Thinking in Bets](https://www.penguinrandomhouse.com/books/552885/thinking-in-bets-by-annie-duke/)*. Ninety percent of startups fail even when they're run well. Recognize outcomes alone and you end up handing out awards for variance.

One of my favorite examples comes from Pete Carroll's coaching career. He didn't reserve recognition for the scoreboard.

> [The Eager Beaver] award [was given] to the player who practiced the hardest. It was such a small thing that it was almost silly. The player who worked the hardest earned the title of "eager Beaver." ... [It] gave our guys something to compete for, and it also gave us a common experience that no one outside our circle could share. It really was the best of both worlds.
> — Pete Carroll, *[Win Forever](https://www.goodreads.com/book/show/7368602)*

Practicing hardest is within the control of every single player. Winning on Sunday isn't.

Pointing at a behavior only works if people can picture it. "Craftsmanship" is not something you can catch someone doing, and why the Crickets Award anchored in tangible and observable behaviors of "Shipping something big that customers never felt". We had the same problem with ownership, a value everyone nodded at and nobody could act on, until we [wrote down what it looks like](https://build.betterup.com/extreme-ownership-at-betterup/). Name the behavior precisely enough that someone could spot it in a pull request, and you have something a system can *actually* run on.


## Nobody Claps, Nobody Stays

Every one of these is a design decision for leadership. How often recognition can happen. Who's allowed to dispense it. What it points at. How much friction sits between noticing something good and saying so out loud. Those are the same kinds of decisions you make about a deploy pipeline, and they have the same property: when you get them wrong, the problem is structural. Caring harder doesn't fix a bottleneck.

> The currency of leadership is recognition and praise.
> — Damian Vaughn

A currency is only worth something if it circulates. When nominations opened for our quarterly culture award, the prompt we sent out was: go review the high fives you've handed out this quarter. Nobody had to fight recency bias or reconstruct three months from memory, because the daily layer had already written the nomination. One hackathon we even pointed a language model at that feed and had it sort every high five against our named behaviors, which only worked because there was real signal sitting there to sort.

So why does almost nobody build this? David Marquet has the best explanation I've found:

> First, the pause to celebrate takes time away from the production work, reducing efficiency and creating waste. Second, we worry that our team will turn complacent and not be motivated to continue on to the next phase. Third, we don't see the components of the work in chunks, we see it as one long conveyor belt. Hence, we never get to the end of anything, and there is nothing to celebrate because "we're not done yet."
> — L. David Marquet, *[Leadership Is Language](https://www.penguinrandomhouse.com/books/566179/leadership-is-language-by-l-david-marquet/)*

The third one is what happened to my migration team. Nobody looked at that cutover and decided it wasn't worth marking. There was just no edge to the work, no moment where something was demonstrably finished, so the moment slid past and the next ticket started. A conveyor belt doesn't stop on its own. Somebody has to cut it into pieces and call one of them done.

If that still sounds like a soft problem, Gallup and Workhuman put a price on it. Doubling the number of employees who get recognized in a given week produces a [9% productivity gain](https://www.businesswire.com/news/home/20230328005814/en/New-Workhuman-Gallup-Study-Finds-Employee-Recognition-Can-Help-Businesses-Gain-Over-$90-Million-in-Increased-Productivity). Separately, employees getting high-quality recognition were [45% less likely to leave](https://www.npr.org/2024/09/18/nx-s1-5113918/employee-praise-recognition-retention-gallup).  The gains are enormous. The mechanisms cost almost nothing.

The Crickets Award didn't stick. It was a good experiment and it faded, and there's plenty I'd do differently next time. Running it is how I know any of that.  You don't get this right on paper.  What works at your company is a fact about your company, and the only way to *learn* it is to start recognizing people badly for a while.  A mediocre system running every week beats an excellent one you're still designing.

So here's the question worth sitting with. What's the cheapest way for someone at your company to recognize a peer today, without asking permission from anyone? How long does it take, and who's allowed to do it?

If the honest answer is that it runs through a manager, once a year, at review time, then you already know what to build. Nobody's budget is stopping you.
