---
title: "From Pilot to Air Traffic Controller"
tags:
---

## The Pilot Has Moved to the Tower

A year ago, in [Agentic Engineering: Pilots Wanted]({% post_url 2025-05-28-agentic-engineering %}), I wrote that working with coding agents needed pilots: people who tune the environment, validate the output, and fly the agent through what it can't handle alone. That was one person landing one agent's work. Watch an engineer today. Four sessions running: one waiting on tests, one mid-migration, one blocked on a decision, one off the rails ten minutes ago and unaware. Nobody is flying. They're sequencing arrivals.

All that extra output lands somewhere. I've watched it up close in an engineering org running this at scale, where delivered volume rose several-fold inside a year and each change carried more code than it used to. The industry-wide version is in the codebases: [GitClear analyzed 211 million changed lines](https://www.gitclear.com/blog/gitclear_ai_code_quality_research_pre_release) and found copy-paste blocks up eightfold, refactoring down from 24.1% to 9.5%, and code rewritten within two weeks of being written climbing steadily. DORA's 2025 report finds the same trade at the delivery end, with throughput up and instability up alongside it.

Most people call that technical debt. Debt is a shortcut taken deliberately, priced at the time, with a plan to repay it — and as Uncle Bob put it, "a mess is not a technical debt. A mess is just a mess." The mess finally has a name: [workslop](https://hbr.org/2025/09/ai-generated-workslop-is-destroying-productivity), work that looks like work and doesn't advance the task.

Directing agents is its own skill, and [the skills you already have don't predict it](https://hbr.org/2026/07/research-why-some-junior-employees-work-well-with-ai-and-others-dont). The people who direct and correct an agent outperform the ones who hand work over, and critical thinking and domain knowledge won't tell you which is which. It's a new set of skills, and it starts with the flight plan.

## Flight Plans Are Cheaper Than Go-Arounds

A flight plan is what lets an aircraft reach its destination without someone hand-flying every turn. A bad one costs go-arounds: circle the field, burn the fuel, try the approach again. At the volumes agents now produce, every weak plan multiplies into review rounds, rework and merge conflicts, and all of it lands on the same people who are already authoring more. The quality of the plan is the lever.

Research-Plan-Implement became the emerging best practice for agentic work: research the codebase, write a plan, then implement. The quality of that plan stayed a black art, traded around as prompting folklore. [Question, Research, Structure, Plan, Implement](https://www.youtube.com/watch?v=YwZR6tc7qYg) is the evolution, and the two stages it adds in front are where the quality actually gets decided.

Taste is all the rage. [Greg Brockman calls it a new core skill](https://x.com/gdb/status/2023481258639286401), Cloudflare's CTO calls it the engineering differentiator, and [the whole discourse got memed inside a week](https://www.fastcompany.com/91520808/why-tech-bros-are-so-worried-about-ai-having-bad-taste). Taste is also nebulous, unassailable, and flattering to whoever claims it, which makes it worthless under review. Discernment is the version you can review, and [the questions phase](https://github.com/wireframe/dotfiles/blob/main/home/.claude/commands/question.md) is how it gets there. Before reading a line of the codebase, the agent asks one question at a time, each with real options and tradeoffs, and records every answer with how firmly it's held: Firm, Preference, or Open. Later phases weight by that grade, so a shrug written down as Firm gets over-built, and a genuine requirement written down as Open gets quietly dropped. What falls out is every constraint and assumption you were putting around the system, externalized. That conversation used to happen in a hallway or an architecture review, when it happened at all. Now it is a document your team can argue with before anything gets built.

Agents love to build horizontally. Left alone, one writes all the backend, then all the frontend, burning tokens for hours before anything exists you can run. [The structure phase](https://github.com/wireframe/dotfiles/blob/main/home/.claude/commands/structure.md) breaks the work into three to five independently shippable phases, each carrying its own verification step. Those are checkpoints: places for the agent to test what it built, clean up, simplify, and correct the architecture while correcting it is still cheap, instead of one enormous review at the end. [Build a skateboard, then a scooter, then a bike](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp), not four wheels, then a chassis, then a car.

![Wide builds wheels, then a chassis, then a car. Deep builds a skateboard, then a scooter, then a bike.](/images/2026-08-16-skateboard.png)

Which makes the plan the real work product.

## Getting More Planes in the Air

A plan good enough to leave without you raises the next question: how many can you launch at once? For twenty years, developer productivity tooling aimed at making one piece of work go faster. Running many at once is a different problem.

The goal is to maximize the number of sandboxes you can run in parallel — locally through git worktrees, containers and throwaway checkouts, and remotely through cloud development environments. Then keep them busy. Every engineer knows [Compiling](https://xkcd.com/303/), except now the waiting belongs to the agent, and the idle time that costs you is the gap between one finishing and you noticing. Tracking which is which is its own emerging problem, and tools like [Herdr](https://github.com/herdrdev/herdr) exist to sit on top of it, showing what is working, what is blocked, and what finished while you were looking elsewhere. None of this is free, either: every additional workstream is another context to hold, and the switching cost is real.

More changes running in parallel puts pressure on the two things that gate a landing, human review and automated verification, and they go hand in hand. Start by lowering the cost of the review itself. Using agents to assist code review is becoming common and takes real load off the reviewer, and one protip matters more than the rest: make sure the reviewing model is a different model than the one that wrote the code. A model reviewing its own output shares its own blind spots and misses exactly what it was always going to miss. Running reviewer models side by side, we saw review quality improve when they differed.

Then take the human out of the landings that never needed one. Classify changes by risk and route them: real blast radius goes to a person, while the trivial group — dependency bumps, documentation, test-only updates — runs the full CI/CD pipeline and self-approves. Early analysis suggests at least 30% of pull request volume can be classified that way. And none of it is safe unless production failures trace back to the change that caused them.

None of that gets built by someone who is flying. The sandboxes, the routing, the verification loops — every one of them is infrastructure that somebody has to fund and build while the flights keep going.
