---
title: "Recognition Is Infrastructure"
featured_description: >
  How to build a recognition system that's cheap, frequent, and open to anyone in the org
tags:
- leadership
- culture
---

## When Nothing Breaks, Nobody Claps

We spent months migrating our infrastructure onto AWS. The day it finished, nothing happened. No incident channel lit up, no support tickets, no customers noticing a thing had changed underneath them.

Nothing happening is rare, and it's the whole reason the moment stuck with me. Look at what actually gets celebrated at most companies: the launch that survived a 2am fire drill, the escalation someone talked a customer down from, the outage that got fixed before the exec team even heard about it. Drama makes a story. A story is easy to recognize. A migration that goes exactly according to plan produces no story at all, so by default it goes unmarked — even though avoiding the fire is harder and more valuable than fighting it well.

So I made up an award for the team that had nothing to show for their work except the absence of a disaster. We called it the Crickets Award, for excellence in shipping change no customer ever felt. No budget request, no approval chain, no cash attached.


## Petty Cash Depreciates, Memories Compound

Ask anyone how they want to be recognized at work and they'll describe a budget line: a bonus, a raise, a comp adjustment that has to clear finance before it lands. Recognition then arrives on the finance calendar instead of on the work's calendar. Annual review, quarterly bonus cycle, occasional spot bonus.

Google ran the experiment. One set of award winners got cash. The other got trips, team dinners, and gifts of the same value.

> Despite telling us they would prefer cash over experiences, the experimental group was happier. Much happier. They thought their awards were 28 percent more fun, 28 percent more memorable, and 15 percent more thoughtful.
> — Laszlo Bock, *[Work Rules!](https://books.google.com/books/about/Work_Rules.html?id=YbPCoAEACAAJ)*

Five months later the gap had widened. Happiness with the cash awards had dropped about 25 percent. Happiness with the experiences hadn't moved. "The joy of money is fleeting, but memories last forever," as Bock puts it. Cash gets spent and forgotten. A gift or an experience sticks around as a story.

Praise is cheaper still, and it holds up against money. When [McKinsey surveyed](https://www.mckinsey.com/capabilities/people-and-organizational-performance/our-insights/motivating-people-getting-beyond-money) 1,047 executives, managers, and employees, three noncash motivators (praise from an immediate manager, attention from leadership, a chance to lead a project) rated as effective or more effective than the three highest-rated financial incentives, cash bonuses included.

Cash also has a hard ceiling on frequency. Nobody hands out a bonus every week. Chip and Dan Heath put a number on how often recognition actually needs to happen:

> The proper pace of recognition is weekly or even daily, not monthly or yearly.
> — Chip & Dan Heath, *[The Power of Moments](https://www.simonandschuster.com/books/The-Power-of-Moments/Chip-Heath/9781501147760)*

Every dollar spent needs approval, so every instance of recognition inherits that approval cycle's latency. A system that has to clear finance cannot run weekly. The budget gate is only half the problem, though. The deeper one is who's allowed to generate recognition in the first place.

## The Bottleneck Is the Org Chart

Gallup asked employees to name where their most memorable recognition came from.

> The data revealed the most memorable recognition comes most often from an employee's manager (28%), followed by a high-level leader or CEO (24%), the manager's manager (12%), a customer (10%) and peers (9%).
> — [Gallup, *The Importance of Employee Recognition: Low Cost, High Impact*](https://www.gallup.com/workplace/236441/employee-recognition-low-cost-high-impact.aspx)

Peers finish last. The people sitting next to you in every stand-up and every pull request review rank behind customers who only ever see the finished product.

Aubrey Daniels has spent a career arguing the opposite ranking is correct:

> Peers are the most effective source of reinforcement at work—and the most underutilized. Peers are in the best position to deliver positive and immediate reinforcement (positive, immediate, and certain consequences [PICs]) because they can observe performance more closely and more often than most supervisors and managers.
> — Aubrey Daniels, *[Bringing Out the Best in People](https://www.aubreydaniels.com/store/books/bringing-out-the-best-in-people)*

The gap between who Daniels puts first and who Gallup shows is actually last is the whole argument.

Start with capacity. If a manager is the only person dispensing recognition, the system is constrained by definition: one person, finite attention, finite hours in a week, no matter how much they care. Every peer added as a legitimate reinforcer is another node generating signal in parallel. That's a multiplier on volume, and until you add them the majority of the team stays starved.

Quality moves too. A manager sees a fraction of anyone's actual work: the demo, the standup update, the postmortem after something goes wrong. Peers see the pull request, the 11pm Slack message asking for a sanity check, the customer call nobody wrote a summary of. That's the higher-resolution view Daniels means by "observe performance more closely and more often."

Everybody already agrees peer recognition matters. The gap is structural, not attitudinal. Whatever behavior you recognize is the behavior you get more of, and in most orgs the only valve for recognition runs through the manager. That's a system ignoring its highest-bandwidth channel by design.

Who's allowed to give recognition decides more than what currency it's paid in.

## The High-Five Economy

- Purpose: make the systems reframe concrete with three real mechanisms, layered from most frequent/cheapest to least
- **15Five high-fives** — free, instant, any peer to any peer, no approval needed. The base layer. (Aside, maybe cut for scope: we once tried to auto-classify high-fives by which cultural behavior they represented for a hackathon — worth a line as evidence of taking the signal seriously, not worth a full paragraph.)
- **Crickets Award** — callback to the opening story, don't retell it. For excellence in shipping change no customer ever felt. Physical, engraved with team name / project / date, shipped to the team lead. Mid-frequency, tied to one specific behavior.
- **Culture Value Award** — quarterly, nomination-driven, explicitly tied to named company values (examples from own notes: Grit, Extreme Ownership, Craftsmanship, Empathy). Lowest frequency, highest visibility. Nominations pull from the high-fives layer below it — the cheap layer feeds the ceremonial one.
- The throughline: none of these required a budget conversation. They required deciding who's allowed to give recognition and how often, which is a systems decision, not a compensation decision.
- TODO: reference eager beaver award.   recognizing the behaviors you want to see is beyond just recognizing the "outcome" (which may not be within our control).

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
