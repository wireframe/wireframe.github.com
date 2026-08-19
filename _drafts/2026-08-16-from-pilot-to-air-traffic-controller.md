---
title: "From Pilot to Air Traffic Controller"
featured_description: >
  The job changed from flying one aircraft to sequencing the whole airspace
tags:
- engineering
- ai
- leadership
---

## The Pilot Has Moved to the Tower

[Last year, I wrote that working with coding agents needed pilots: people who __fly__ agents through a new airspace of work by guiding the outcome, setting the context, and validating the output.]({% post_url 2025-05-28-agentic-engineering %}) Watch an engineer today, and you'll see how much has changed in just twelve months. Four sessions running: one waiting on tests, one mid-migration, one blocked on a decision, one off the rails ten minutes ago and unaware. We are not flying anymore.  We're managing airspace and sequencing arrivals.

All those extra flights carry increased baggage that lands somewhere. I've seen our team's delivery volume increase several-fold within a year and each change is carrying more code than it used to. This aligns with industry-wide trends showing [short-term churn is increasing, and refactored code is falling](https://www.gitclear.com/ai_assistant_code_quality_2025_research) which means that [AI is improving our throughput, but often at the cost of stability](https://dora.dev/insights/dora-2025-year-in-review/).  Most people call that technical debt. Debt is a shortcut taken deliberately, priced at the time, with a plan to repay it. As Uncle Bob put it, "a mess is not a technical debt. A mess is just a mess." **This mess has a name: [workslop](https://hbr.org/2025/09/ai-generated-workslop-is-destroying-productivity)**.

Directing agents to increase throughput __without__ decreasing quality requires a new set of skills and [being a great pilot does not necessarily translate to the new role as an Air Traffic Controller](https://hbr.org/2026/07/research-why-some-junior-employees-work-well-with-ai-and-others-dont).  It starts with improving the quality of the flight plan.

## Flight Plans Are Cheaper Than Go-Arounds

A flight plan is what lets an aircraft reach its destination swiftly and smoothly. A bad one costs go-arounds: circling the field, burning fuel, and retrying the approach again...and again. When working with coding agents, every weak plan creates __more work__ through multiple review rounds, rework and merge conflicts.

Research-Plan-Implement became the emerging best practice for agentic work: research the codebase, write a plan, then implement. Crafting a "quality plan" has been elusive to scale from "prompt protips" to "standard operating procedures" for the whole team. [Question, Research, Structure, Plan, Implement](https://www.youtube.com/watch?v=YwZR6tc7qYg) is the evolution, and the two stages it adds in front of the plan dramatically increase the consistency of creating a quality plan.

**Taste is all the rage.** [Greg Brockman calls it a new core skill](https://x.com/gdb/status/2023481258639286401), Cloudflare CTO Dane Knecht called it the engineering differentiator for 2026, and [the whole discourse got memed](https://www.fastcompany.com/91520808/why-tech-bros-are-so-worried-about-ai-having-bad-taste) about as fast. Taste is also nebulous, unassailable, and flattering to whoever claims it, which makes it worthless under review. Discernment is the version you can review, and [the questions phase](https://github.com/wireframe/dotfiles/blob/main/home/.claude/commands/question.md) is how it gets there. Before reading a line of the codebase, the agent asks one question at a time, each with options and tradeoffs, and records every answer with how firmly it's held: Firm, Preference, or Open. Later phases weight by that grade, so a shrug written down as Firm gets over-built, and a genuine requirement written down as Open gets quietly dropped.

What falls out is every constraint and assumption you were putting around the system, externalized. That conversation used to happen in a hallway or an architecture review, when it happened at all. Now it is a document your team can argue with before anything gets built.

Agents *love* to build horizontally. Left alone, one writes all the backend, then all the frontend, burning tokens for hours before anything exists you can run. [The structure phase](https://github.com/wireframe/dotfiles/blob/main/home/.claude/commands/structure.md) breaks the work into three to five independently shippable phases, each carrying its own verification step. Those are checkpoints: places for the agent to test what it built, clean up, simplify, and correct the architecture while correcting it is still cheap, instead of one enormous review at the end. [Build a skateboard, then a scooter, then a bike](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp), not four wheels, then a chassis, then a car.

![Wide builds wheels, then a chassis, then a car. Deep builds a skateboard, then a scooter, then a bike.](/images/2026-08-16-skateboard.png)

**The plan is the work product now.**

## Getting More Planes in the Air

A plan good enough to leave without you raises the next question: how many can you launch at once? For twenty years, developer productivity tooling aimed at making one piece of work go faster. Running many at once is a different problem.

The goal is to maximize the number of sandboxes you can run in parallel — locally through git worktrees, containers and throwaway checkouts, and remotely through cloud development environments. Then keep them busy. Every engineer knows [Compiling](https://xkcd.com/303/), except now the waiting belongs to the agent, and the idle time that costs you is the gap between one finishing and you noticing. Tracking which is which is its own emerging problem, and tools like [Herdr](https://github.com/herdrdev/herdr) exist to sit on top of it, showing what's working, what's blocked, and what finished while you were looking elsewhere. None of this is free, either: every additional workstream is another context to hold, and the switching cost is real.

More changes running in parallel put pressure on the two things that gate a landing, human review and automated verification, and they go hand in hand. Start by lowering the cost of the review itself. Using agents to assist code review is becoming common and takes load off the reviewer, and one protip matters more than the rest: make sure the reviewing model is a different model than the one that wrote the code. A model reviewing its own output shares its own blind spots and misses exactly what it was always going to miss. Running reviewer models side by side, I watched review quality improve when they differed.

Then take the human out of the landings that never needed one. Classify changes by risk and route them: real blast radius goes to a person, while the trivial group (dependency bumps, documentation, test-only updates) runs the full CI/CD pipeline and self-approves. Early analysis suggests nearly a third of pull request volume can be classified that way. And none of it is safe unless production failures trace back to the change that caused them.

The sandboxes, the routing, the verification loops. Every one of them is infrastructure that somebody has to fund and build while the flights keep going.

## Building the Tower

A tower is made of four things, and a leader builds all four. None of them is a model upgrade. Model capability arrives whether or not anyone at your company works for it, so chasing it is the lowest-return work available, while an hour spent on the harness multiplies across every engineer and every workstream. The [Self-Harness experiment](https://arxiv.org/html/2606.09498v1) holds the model and the evaluator fixed, changes only the scaffolding, and moves held-out scores by 14 to 21 points across three models, with the weakest of them posting the largest relative gain. If a model upgrade forces a rebuild, it was never a harness, it was a workaround with good PR.

**The bar.** An agent will hand you code that compiles, passes the tests and reads cleanly. That used to be the bar and it's now table stakes, because all three come out of the machine for free. What replaces it is whether the change leaves the system easier to change tomorrow, which is what Sandro Mancuso means by code you are not scared to change. Test: is your bar written down, and can anyone on the team quote it?

**The plans.** Specification, context, and a codebase legible enough that an agent can work safely in code it has never seen. This is work that never looks urgent: writing down constraints and keeping documentation accurate buys nothing today and pays out weeks later on somebody else's ticket, which is why it dies first in a crunch. Test: run [Question, Research, Structure, Plan, Implement](https://www.youtube.com/watch?v=YwZR6tc7qYg) on a real piece of work and see whether the decisions and the phases survive a peer review.

**The instruments.** Change failure rate, time to recover, and batch size. Batch size matters more than it used to, because agents write large changes by default and a large change is slower to review and harder to roll back. Speed metrics will lie to you first, and so will a comparison against last quarter; measure against where the trend was already heading, or you can't answer "we would have improved anyway." With those in place I've watched cycle time improve while volume rose and while each change got bigger, tool adoption bend the curve once and harness work bend it again harder, and a migration that failed outright before the harness succeeded after it: same task, same codebase, different system around it. Test: can you say how many workstreams you landed last week and what each one cost?

**The people.** Hire for discernment. Stop asking candidates to write the function, hand them a pull request and ask what is wrong with it. The job change underneath that is real and worth naming: if you identify as a programmer, this is hard. Annie Vella said it in [The Software Engineering Identity Crisis](https://annievella.com/posts/the-software-engineering-identity-crisis): "Many of us don't just write code — we love writing code. It's not just work, not just a craft — it's who we are." **I've never hired a programmer.** I've hired people to solve customer problems, and [written that down](https://build.betterup.com/extreme-ownership-at-betterup/) since long before an agent could write anything: if you can deliver impact to our customers without writing a line of code, do it. The identity was never in the code. It was in the impact. Test: does your interview loop contain a review exercise at all?

A pilot sees one aircraft. A controller sees the whole airspace. Flying was good work. This is bigger work.
