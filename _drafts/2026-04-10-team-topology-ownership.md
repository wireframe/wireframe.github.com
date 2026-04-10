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

It doesn't matter whether a system lands in Team A or Team B, as long as there is a team that owns it. There will always be messy boundaries that could reasonably go either way, systems that don't fit neatly into any box. That's fine. What isn't fine is leaving it ambiguous. Every day without clear ownership is another day of delays.  Draw those first lines and move forward.  This is a reversible decision and you can redistribute ownership of systems over time as you learn more about what works. 

## Design Your Org for the Architecture You Want

Conway's Law ("any organization that designs a system will produce a design whose structure is a copy of the organization's communication structure") is one of those observations that sounds obvious until you realize how few organizations actually act on it. Your org structure will mirror your system architecture whether you plan for it or not. Ruth Malan put it sharply: "If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins."

The Reverse Conway Maneuver flips this from an observation into a strategy: deliberately structure your teams to produce the architecture you want. If you want loosely coupled services organized around business domains, organize your teams that way first. The architecture will follow.

But where do you draw the lines? This is a great opportunity to partner with product and design leadership, because the right team structure balances engineering needs with customer and business objectives. When engineering draws the lines alone, you get blind spots. Skelton and Pais explore this in depth in *Team Topologies*, and a few guiding principles stand out:

**Organize around business domains, not technical layers.** Teams that own a customer-facing domain end-to-end can ship without waiting on other teams. Splitting by technology (front-end/back-end/data) creates handoffs by design. It's the most common split, and often the wrong one.

**Split systems that move at different speeds.** Parts of the system that change weekly don't belong in the same team as parts that change quarterly. Splitting by change cadence lets each part move at its natural pace.

**Keep maintenance and innovation together.** I've seen organizations split teams into "build the new thing" and "keep the lights on," and it creates a two-tiered class system of innovators and maintainers. The team that builds a system should own it through its full lifecycle: building, running, and improving it. I wrote about this in my [Greenhouse post](https://www.codecrate.com/2026/02/the-greenhouse-innovation-incubator.html), specifically about the anti-pattern of incubating in one team and handing off to another for "productionization." You can't outsource expertise. No one will know your customer, your data, or your activation funnels better than the team that built it.

## Constantly Reorganize to Win -- But Thoughtfully

Your north-star architecture will evolve. Your business will evolve. Your teams need to evolve with them. It's never done.

**Planned evolution** is healthy. As you learn more about your domain and your customers, you reshape team boundaries to match. This is the Reverse Conway Maneuver as an ongoing practice, not a one-time event.

**Reactive reshuffling** is the trap. A firedrill lands, and the instinct is to assemble an Avengers team: pull the best people from across the org, form a new squad with theoretically perfect skillsets, and throw them at the problem. This is almost always a mistake. Every team goes through Tuckman's stages (Forming, Storming, Norming, Performing) before it hits its stride. Every reorg resets that clock. Leaders expect that when they form a team, they are immediately Performing, but the team starts back at Forming. The reduced velocity is real, compounding, and chronically underestimated.

When an unplanned project lands, route it to the team whose ownership boundary is closest, even if it's not a perfect fit. A team with established trust and a working rhythm will outperform a freshly assembled group of "perfect" individuals nearly every time. Save your reorgs for intentional moves toward your architectural north star. Don't spend them on firedrills.

## Boundaries Without Bridges Create Dysfunction

Now, you might be thinking: "Great, I'll draw hard lines around everything and let teams operate independently." That's half the answer.

Clear ownership boundaries are necessary but not sufficient. Without deliberate investment in cross-boundary collaboration and knowledge sharing, boundaries harden into silos. You trade the tragedy of the commons for a different failure mode: isolated teams optimizing locally, unaware of (or indifferent to) the impact on the broader system. "Not my problem" becomes the culture.


Stanley McChrystal learned this the hard way in *Team of Teams*: "By focusing on the component parts rather than the overall process, we were missing the fundamental problem. Speeding up the individual elements of the system did nothing to eliminate the blinks between them that most stymied our efforts." The same applies to engineering orgs. Optimizing individual teams while ignoring the seams between them just moves the bottleneck.

The goal is clear domains with porous edges. Each team knows what they own and can go deep in their area, but they also invest in the connections between teams. Guilds give engineers across teams a shared space to align on practices and cross-cutting concerns. Architecture reviews make system-level tradeoffs visible before they become surprises.

---

*Org design is never finished. Give every team member clarity of who's got the ball, then let them run.*
