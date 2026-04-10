---
title: "Outgrowing the Org Chart: Team Topology for Scaling Teams"
tags:
- engineering
- leadership
featured_description: >
  Why ownership clarity matters more than the perfect org chart
---

In the early days of a startup, every engineer knows the whole system. You wrote half of it, and probably reviewed the other half. When something breaks at 2am, you have a reasonable mental model of where to look. **This doesn't survive growth.**

The system grows faster than the team's capacity to hold it all in their heads. Engineers end up context-switching across systems they half-understand rather than going deep on the systems they own. Every change turns into a scavenger hunt for who to talk to.

And when ownership is unclear, you get the bystander effect. Technical debt piles up because everyone assumes someone else will fix it. Issues languish in the backlog because no one feels responsible enough to prioritize them. When everyone owns everything, no one owns anything.

## Every Org Design Is Wrong -- And That's Ok

If you've spent time agonizing over the right way to structure your engineering organization, I have good news and bad news. The bad news: there's never a perfect way to carve up the pie. Every org design is wrong. The good news: that's not actually the point. **The point is to create clarity.**  When a team knows that they have [collective ownership](https://build.betterup.com/extreme-ownership-at-betterup/) of a domain, they operate differently. They go deeper, they make decisions faster, and they build better.

It doesn't matter whether a system lands in Team A or Team B, as long as there is a team that owns it. There will always be messy boundaries that could reasonably go either way, systems that don't fit neatly into any box. That's fine. What isn't fine is leaving it ambiguous. Every day without clear ownership is another day of delays. So, draw those first lines and move forward.  This is a reversible decision and you can redistribute ownership of systems over time as you learn more about what works. 

## Design Your Org for the Architecture You Want

Conway's Law ("any organization that designs a system will produce a design whose structure is a copy of the organization's communication structure") is one of those observations that sounds obvious until you realize how few organizations actually act on it. Your org structure will mirror your system architecture whether you plan for it or not. Ruth Malan put it sharply: "If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins."

The Reverse Conway Maneuver flips this from an observation into a strategy: deliberately structure your teams to produce the architecture you want. If you want loosely coupled services organized around business domains, organize your teams that way first. The architecture will follow.

But where do you draw the lines? This is where Team Topologies' concept of "fracture planes" is useful. A fracture plane is a natural seam in the software system where it can be split cleanly. The most common ones:

- **Business domain / bounded context:** This should be your primary dimension. Organize teams around customers and business outcomes when possible, not around technical layers.
- **Change cadence:** Parts of the system that change at different speeds often belong in different teams. Splitting them lets each part move at its natural pace.
- **Risk profile:** High-risk regulatory systems might need different ownership than fast-moving product features.
- **Technology:** The most common split, and often the wrong one. Front-end/back-end/data splits create handoffs by design. Use this dimension sparingly.

Co-create your topology with both product and engineering leadership. The appropriate team structure balances engineering and architecture needs with customer and business objectives. When just one side drives the topology, you get blind spots.

Start with stream-aligned teams: teams organized around a flow of business value, owning their domain end-to-end. These are the foundation. Platform teams, enabling teams, and complicated-subsystem teams (the other three types in Team Topologies) are layers you add once stream-aligned ownership is solid and you can clearly see what shared capabilities to extract. Get the fundamentals right first.

And on the topic of end-to-end ownership: keep maintenance and innovation together. I've seen organizations split teams into "build the new thing" and "keep the lights on," and it creates a two-tiered class system of innovators and maintainers. The team that builds a system should own it through its full lifecycle: building, running, and improving it. I wrote about this in my [Greenhouse post](https://www.codecrate.com/2026/02/the-greenhouse-innovation-incubator.html), specifically about the anti-pattern of incubating in one team and handing off to another for "productionization." The context loss from that handoff is enormous. You can't outsource expertise. No one will know your customer, your data, or your activation funnels better than the team that built it.

## Constantly Reorganize to Win -- But Thoughtfully

Your north-star architecture will evolve. Your business will evolve. Your teams need to evolve with them. It's never done.

But there are two types of reorganization:

**Planned evolution** moves you toward your north-star architecture. It's deliberate, informed by what you've learned, and gives teams time to adjust. This is the Reverse Conway Maneuver in practice: you're intentionally reshaping the org to produce the system you want.

**Reactive reshuffling** dissolves existing teams to chase unplanned work. A firedrill lands, and the instinct is to assemble an Avengers team: pull the best people from across the org, form a new squad with theoretically perfect skillsets, and throw them at the problem.

This is almost always a mistake, and the reason is Tuckman.

Bruce Tuckman's stages of group development (Forming, Storming, Norming, Performing) describe what every team goes through before it hits its stride. Forming is the polite phase where people figure out how to work together. Storming is where conflicts surface and working styles collide. Norming is where the team finds its rhythm. Only then does Performing happen, the state where the team actually delivers at the level you expected when you drew the org chart.

Every reorg resets this clock. Leaders mentally skip straight to Performing when they reorganize, but the team starts back at Forming. The months of reduced velocity during Forming and Storming are real and compounding. This cost is chronically underestimated.

The discipline is knowing the difference. When an unplanned project or firedrill lands, route the problem to the team whose ownership boundary is closest, even if it's not a perfect fit. A team with established trust, shared context, and a working rhythm will outperform a freshly assembled group of "perfect" individuals nearly every time. The cost of imperfect fit is almost always lower than the cost of team dissolution and reformation.

Save your reorgs for intentional moves toward your architectural north star. Don't spend them on firedrills.

## Boundaries Without Bridges Create Dysfunction

If you've followed the argument this far, you might be thinking: "Great, I'll draw hard lines around everything and let teams operate independently." That's half the answer.

Clear ownership boundaries are necessary but not sufficient. Without deliberate investment in cross-boundary collaboration and knowledge sharing, boundaries harden into silos. You trade the tragedy of the commons for a different failure mode: isolated teams optimizing locally, unaware of (or indifferent to) the impact on the broader system. "Not my problem" becomes the culture.

The goal is clear domains with porous edges. Each team knows what they own and can go deep in their area. But they also have regular, structured opportunities to share knowledge across boundaries, align on cross-cutting concerns, and build relationships with the teams whose systems interact with theirs.

How you create that connective tissue will depend on your organization. Stanley McChrystal's *Team of Teams* describes how the Joint Special Operations Task Force moved from rigid command hierarchies to a "shared consciousness" model: teams that maintained clear missions but invested heavily in inter-team awareness. The specifics of his military context don't translate directly, but the principle does: you need both autonomy and connection.

Too little structure and no one owns anything. Too much structure and you've built walls instead of boundaries. The right answer lives in the tension between those two failure modes, and it shifts over time as your organization grows. Like everything else in org design, it's never done. But if you're investing in both clarity of ownership and deliberate cross-boundary connection, you're pointed in the right direction.

---

*Org design is never finished. Give every team member clarity of who's got the ball, then let them run.*
