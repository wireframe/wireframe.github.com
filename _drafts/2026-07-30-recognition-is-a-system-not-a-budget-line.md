---

title: "Recognition Is a System, Not a Budget Line"
tags:
- leadership
- culture
---

## When Nothing Breaks, Nobody Claps

We spent months migrating our infrastructure onto AWS. The day it finished, nothing happened. No incident channel lit up, no support tickets, no customers noticing a thing had changed underneath them.

Nothing happening is rare, and it's the whole reason the moment stuck with me. Look at what actually gets celebrated at most companies: the launch that survived a 2am fire drill, the escalation someone talked a customer down from, the outage that got fixed before the exec team even heard about it. Drama makes a story, and a story is easy to recognize. A migration that goes exactly according to plan produces no story at all, so by default it goes unmarked, even though avoiding the fire is a harder and more valuable outcome than fighting it well.

So I made up an award for the team that had nothing to show for their work except the absence of a disaster. We called it the Crickets Award, for excellence in delivering value without disrupting the customer. No budget request, no approval chain, no cash attached. Recognition for the team's great work, and a durable system in place to replicate this outcome for future projects.


## Petty Cash Depreciates, Memories Compound

Ask anyone what "employee recognition" means and they'll describe a budget line: a bonus, a gift card, a comp adjustment that has to clear finance before it lands. It gets delivered on a schedule that has nothing to do with when the work actually happened — the annual review, the quarterly bonus cycle, an exec calling someone out by name at an all-hands.

That assumption isn't irrational. It matches how people report experiencing recognition today. Gallup found employees credit their manager for their most meaningful recognition 28% of the time, senior leaders or the CEO 24%, the manager's manager 12%, customers 10%. Peers come in last, at 9%. Recognition, as most companies run it, flows down the org chart. It almost never flows sideways.

That model has a bigger problem than being narrow, though: the research says it rewards people with the wrong currency. Laszlo Bock ran the numbers at Google and found the opposite of what people say they want. Ask someone whether they'd rather have cash or an experience and they'll pick cash. Give them the experience anyway, and:

> Despite telling us they would prefer cash over experiences, the experimental group was happier. Much happier. They thought their awards were 28 percent more fun, 28 percent more memorable, and 15 percent more thoughtful.
> — Laszlo Bock, *Work Rules!*

Cash gets spent and forgotten. A gift or an experience sticks around as a story — "the joy of money is fleeting, but memories last forever," as Bock puts it, and non-cash awards trigger an emotional response that a direct deposit never will. This isn't a one-company anecdote. The Incentive Research Foundation's meta-analysis found non-cash incentives outperform cash for discretionary effort and long-term performance in 65% of comparable studies. McKinsey found praise and leadership attention beat the three highest-rated financial incentives, cash bonuses included.

None of this works if it only happens once a year. Chip and Dan Heath studied what actually makes recognition land, and cadence mattered more than production value:

> The proper pace of recognition is weekly or even daily, not monthly or yearly.
> — Chip & Dan Heath, *The Power of Moments*

Style barely matters. Frequency and authenticity do. And frequency is exactly where a cash-based system breaks down: every dollar spent needs approval, so every instance of recognition inherits that approval cycle's latency. Recognition can't run weekly if it has to clear finance weekly. The budget gate is only half the problem, though. The deeper one is who's allowed to generate recognition in the first place.

## The Bottleneck Is the Org Chart

- Core claim: the org already has its best reinforcement channel, it just doesn't route recognition through it
- Source: Aubrey Daniels, *Bringing Out the Best in People: How to Apply the Astonishing Power of Positive Reinforcement*

  > Peers are the most effective source of reinforcement at work—and the most underutilized. Peers are in the best position to deliver positive and immediate reinforcement (positive, immediate, and certain consequences [PICs]) because they can observe performance more closely and more often than most supervisors and managers.
  > — Aubrey Daniels, *Bringing Out the Best in People*

- Callback to the Gallup breakdown from section 2: peers sit dead last at 9%, behind manager, senior leader/CEO, manager's manager, *and* customers. Daniels says peers should be first. That gap is the whole argument.
- The throughput case: if the manager is the only node in the network allowed to dispense recognition, the system is capacity-constrained by definition — one person, finite attention, finite hours in the week, no matter how much they care. Every peer added as a legitimate reinforcer is another node generating signal in parallel. That's not a marginal gain, it's a multiplier on volume.
- It's a multiplier on quality too, not just volume: a manager sees a fraction of anyone's actual work — the demo, the standup update, the postmortem. Peers see the pull request, the 11pm Slack message, the customer call. They have the higher-resolution view, which is exactly what Daniels means by "observe performance more closely and more often."
- Frame it as a design flaw, not a values gap: "whatever behaviors you recognize and incentivize is the behavior change you will see" (own note, `[[Incentive structure]]`) — if the only dispensing mechanism runs through managers, you've built a system that structurally under-uses the channel with both the most bandwidth and the best visibility
- This section is the pivot from "cash vs. non-cash" to "who's allowed to give it" — sets up section 5's examples as proof the fix is buildable

## The High-Five Economy

- Purpose: make the systems reframe concrete with three real mechanisms, layered from most frequent/cheapest to least
- **15Five high-fives** — free, instant, any peer to any peer, no approval needed. The base layer. (Aside, maybe cut for scope: we once tried to auto-classify high-fives by which cultural behavior they represented for a hackathon — worth a line as evidence of taking the signal seriously, not worth a full paragraph.)
- **Crickets Award** — callback to the opening story, don't retell it. For excellence in delivering value without disrupting the customer. Physical, engraved with team name / project / date, shipped to the team lead. Mid-frequency, tied to one specific behavior.
- **Culture Value Award** — quarterly, nomination-driven, explicitly tied to named company values (examples from own notes: Grit, Extreme Ownership, Craftsmanship, Empathy). Lowest frequency, highest visibility. Nominations pull from the high-fives layer below it — the cheap layer feeds the ceremonial one.
- The throughline: none of these required a budget conversation. They required deciding who's allowed to give recognition and how often, which is a systems decision, not a compensation decision.

## Ship Recognition Like Infrastructure

- Restate the thesis plainly: recognition is infrastructure you design — frequency, who can give it, how much friction it takes — not a line item you request from finance
- Cost of getting this wrong, to make it concrete for a reader who thinks this is a "nice to have": Gallup, for a 10,000-person org —
  - ~$92M in productivity gains from doubling the number of employees who receive recognition — [NPR/Gallup coverage](https://npr.org/2024/09/18/nx-s1-5113918/employee-praise-recognition-retention-gallup)
  - $16.1M saved annually in turnover
  - Employees who get meaningful recognition are 45% less likely to leave
- Possible closing beat:

  > The currency of leadership is recognition and praise.
  > — Damian Vaughn

  Leaders still matter here; they're just not supposed to be the only channel.
- Close on the provocation, not a summary: ask what the cheapest recognition mechanism in the reader's org is right now, and who's actually allowed to use it. If the honest answer is "only my manager, only at review time," that's the system to fix — not the values poster on the wall.
