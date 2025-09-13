---
title: "A Hacker Renaissance"
tags:
- engineering
- product development
- ai
---

## "Do you want to see the cool thing I built today?"

I think my family is sick of hearing this phrase. Every week another "crazy idea" turns into a semi-usable piece of software: a [Disney vacation planner](https://github.com/wireframe/disney-planner) with crowd calendar integration, a [voice-enabled AI rubber duck](https://github.com/wireframe/rubberduck) for debugging (including a playful duck personality), a [machine learning model that classifies if a song is "butt rock,"](https://github.com/wireframe/is-it-butt-rock) a [Spotify plugin for random song discovery](https://github.com/wireframe/song-of-the-day), a [translation telephone game](https://github.com/wireframe/translate_telephone), and a [team topology graph visualizer](https://github.com/wireframe/team-topology-graph).

There is a feeling of immense joy turning these ideas into reality, even if they are "prototypes" and not production grade.  Programming is __fun__ again,  and things that took hours can now be accomplished in a matter of __minutes__.  What a time to be alive...  

It feels like a renaissance of hacker culture, like in the early 2000's when there was a surge of DIY and open source technology that created a generation of tinkerers scratching their own itch.   What could this mean for the future of commercial software development?  

## The Changing Calculus of Build vs Buy Decisions

It's not just faster to build software now; it's also cheaper to maintain.

In the past, "building" was risky because most of the cost came after launch: updates, upgrades, and support. But AI is collapsing those costs too.  A recent AI-led upgrade of a React application handled a fairly complex multi-version upgrade seamlessly, including deprecated API changes.  Something that would have taken a few days, took minutes.

When both build and maintenance drop to a fraction of the effort, the old assumptions behind "buy vs. build" start to break down. Suddenly, spinning up internal tools or tailored systems isn't such a gamble: it's just a weekend well spent.  What does this mean for build vs buy decisions going forward?

### 1. Is It "Mission Critical"?

In the past, non-critical infrastructure was often viewed as a **distraction** from core business priorities. The default approach was to bring in a vendor or SaaS tool to handle these needs so internal teams could stay focused on "real" work.

But with AI shrinking the cost of building and maintaining small systems, that trade-off is shifting. It's now often faster, cheaper, and more flexible to build lightweight tools in-house, even for functions that used to justify vendor spend.

**Recent examples of what's moving in-house:**
* **Developer experience tooling.** Pull request quality checks are a good example: a few years ago, we’d have bought a vendor solution. Today, it’s a weekend build that fits our workflow exactly.
* **Slackbots and workflow helpers.** Where companies once bought niche SaaS for reminders, approvals, or integrations, we're now seeing small internal bots emerge — easier to maintain and more tailored than their vendor equivalents.

The question isn’t just "buy vs. build" anymore — it’s "why outsource non-critical systems if building them is nearly free?"

### 2. How Good is "Good Enough"?

Most vendor software comes with bloat where you end up paying for 100 features when you only use 10. The real question is: **how much extra are you willing to pay for those bells and whistles you don’t need?**

A recent case study makes this clear: [Klarna replaced Salesforce’s flagship CRM with a homegrown, AI-accelerated alternative](https://techcrunch.com/2025/03/04/klarna-ceo-doubts-that-other-companies-will-replace-salesforce-with-ai/). It wasn't perfect, but it did what they needed, and saved them millions.

That's the shift: perfect is expensive, "good enough" is cheap and in your control.  

This good enough beats perfect pattern is accelerating across:
* Workflow automation tools
* Lightweight analytics dashboards
* Basic integration services
* Internal process management
* Specialized utilities with narrow use cases

Of course, AI-built tools aren't flawless. They can be brittle or rough around the edges, which is fine for internal use but risky for mission-critical systems. The value comes from how quickly and cheaply you can shape them to your needs.

## The New Build vs Buy Decision Framework

Together, these two questions — mission criticality and good enough — reshape the build vs buy decision. Here’s a simple way to think about it:

1. **Is this mission-critical to my business?** (If yes → probably still buy)
2. **Can I live with "good enough" functionality?** (If yes → probably build)
3. **Is this primarily about convenience vs. core capability?** (If convenience → definitely build)

The build vs. buy decision is fundamentally different when building takes 10% of the time. Good enough internal solutions often beat perfect vendor solutions, especially when "perfect" includes features you'll never use.

## Let's Get Hacking

The cultural shift feels profound. We've moved from "Not Invented Here" syndrome to "Why Pay For This?" pragmatism. When building takes 10% of the traditional time, the economic equation flips entirely.

The barriers to creation have collapsed. The tools are exponentially more powerful. And that backlog of crazy ideas in your head? It's about to become your weekend shipping schedule too.

$99/month SaaS subscription vs. three-hour Saturday morning build. Multiply by dozens of "convenience" subscriptions across your organization. The math starts looking very different.

When building "good enough" solutions becomes this easy, the question isn't "Can we afford to build this?" It's "Can we afford NOT to?"

We're not just *consuming* software anymore, **we're creating it again**. It feels like the early 2000's where makers are empowered to craft solutions that work for them.

Time to get building.