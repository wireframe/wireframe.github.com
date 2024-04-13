---
title: "The Commit Cycle"
tags:
- product development
---

Many years ago, I attended the very first Lean startup workshop hosted by Eric Ries. We were his guinea pigs in a true MVP experience.
It was an amazing event to learn from entrepreneurs, and to soak up concepts that shaped my mental model of building startups and pursuing Product/Market Fit.

Since then, I've had the opportunity to be a part of multiple Zero to one startups from incubation through growth stages and acquisitions. I've seen a few successes, and I've failed a *ton* along the way.

My biggest learning as a product and technology leader would be to echo the wisdom of the great philosopher, Weird Al Yankovic: Everything you know is wrong. Or, as Marty Cagan eloquently captures as the "Two Inconvenient Truths About Product":

> "The first truth is that **at least half of our ideas are just not going to work**...The second inconvenient truth is that even with the ideas that do prove to have potential, **it typically takes several iterations to get the implementation of this idea to the point where it delivers the necessary business value**."

Time is the enemy of every startup, and the best way I know of to increase our odds of success is by getting our customers to tell us what matters to them (and what doesn't matter) as quickly as possible. The tighter our feedback loops, the more opportunities we have to iterate and get it right for our customers. I've taken concepts that have been useful for me in Zero to one development and refined them into a Product Development Process (PDP) called "The Commit Cycle".

<img src="/images/the_commit_cycle.png">

First, we need to know where we are headed. **We commit to a *direction*.**

Our direction is set by working backwards from what success looks like for our customers, and the necessary steps to get there.
Defining and aligning on our plan should take as little time as necessary (and yes it is necessary).

The three critical elements of the direction include:
1. Scope of work: Minimum Valuable Experience (MVE)
2. success criteria: Key Performance Indicator (KPI) and Acceptance criteria
3. Timeline to timebox our execution until we will be "done" and commit to learning.

There are a million frameworks to chose from (my personal favorite is User story mapping), but at the end of the day, pick one that works for your team, and consciously evaluate how to improve it in the "Close the loop" step.


Now that we have our direction, we can put our heads down and execute. **We commit to *action*.**

"Time Thieves" as Will Larson says it.
1. Deflect interruptions.  
2. Defer changes to the next iteration.   Changing priorities are one of the biggest reasons for loss in velocity.  The tighter your feedback loops, the easier it is to defer incoming work to "the next version". If your feedback loop takes months, its more likely that it will be added to the current version.  
3. Minimize coordination taxes.  dependencies on other teams
4. minimize latency in decisions/impediments.  Rule of 3 for async communications.

The remaining time should be focused Deep work!

As execution mode closes out, we pick our heads up and **commit to *closing the loop*.**

Every high performing team invests time in reviewing their work and consciously making improvements to improve.
I personally have found the most telling sign of a high performing team is the quality of their retrospectives. If a team completes a retrospective with a general sense that "we're all good here" with no areas for improvement, I just plain don't believe them. Craftsmanship has no upper bounds. Bob Iger says it so well: "We are in the relentless pursuit of perfection."

Review your commitments.
1. Reflect on **the plan**.
  * Did you complete what you set out to do? Review the Acceptance criteria to really say whether it is "done".
  * Did you under-estimate (or over-estimate) the amount of work?
2. Reflect on **the execution**.
  * what interruptions/dependencies/collaboration tax did we encounter? Is there something you could invest in to reduce these going forward and move faster?
  * How much Deep work did we have this cycle?
  * Discuss the quality of the work produced.
3. Reflect on **the process**.
  * is there something you could do to make the next loop tighter?
  * Is our planning and retro process working for us?
4. Reflect on **the impact**.
  * What have you learned from your customers?
  * How are the systems performing in production?

There are a million retrospective frameworks to choose from and it's not important to have the "perfect" retrospective process. Pick what works for your team, and consciously discuss how well it works for you during your retrospective. (My personal favorite is the Team Sprint review and reflection recipe from User story mapping: discover the whole story, build the right product)


That's it! Ingest these learnings from the prior iteration and prioritize them along with any items that came up during the cycle, and keep it going with your next cycle of commitments.

---

**Objection handling:** Why create a plan? I can't count the number of objections I've heard over the years that planning is "waste" and we just need to "ship and learn".  Imagine of the Navy seals didn't take time to create a plan of action before a mission: "We don't have time to plan! We just need to get in there and figure it out!". I'm pretty sure we would not like the outcome of those events.

I can say confidently that I've seen these teams ultimately go slower for a few reasons.
1. Without a plan, many teams struggle to call it "done" and ship to their customers. This regularly leads to "just one more thing" Scope creep.
2. Part of the plan is the timeline for when the next iteration will begin. Without an agreed upon timeline for completion, the team is constantly fighting the impulse to continue to make more "tweaks" along the way. The cost of these interruptions adds up and creates significant drag on the overall system. Batching up these "tweaks" for the next iteration has compounding efficiency gains.
NOTE: I'm a huge believer in The Agile Manifesto, and there is a difference between "changing the plan", and "operating without a plan at all". Consciously changing a plan based on new information is absolutely encouraged (I'd call that a pivot). *