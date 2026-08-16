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

Research-Plan-Implement became the emerging best practice for agentic work: research the codebase, write a plan, then implement, with the review on the plan rather than the diff. The quality of that plan stayed a black art, traded around as prompting folklore. [QRSPI](https://www.youtube.com/watch?v=YwZR6tc7qYg) is the evolution, adding questions and structure in front, and those two artifacts are where the quality actually gets decided. ([All five commands](https://github.com/wireframe/dotfiles/tree/main/home/.claude/commands) are in my dotfiles.)

Taste is all the rage. [Greg Brockman calls it a new core skill](https://x.com/gdb/status/2023481258639286401), Cloudflare's CTO calls it the engineering differentiator, and [the whole discourse got memed inside a week](https://www.fastcompany.com/91520808/why-tech-bros-are-so-worried-about-ai-having-bad-taste). The critique lands: taste is nebulous, unassailable, and it flatters whoever claims it. Discernment is the version you can put under review, and it has a file. `decisions.md` records every design decision before any code exists, graded Firm, Preference, or Open. Later phases weight by that grade, so a soft choice marked Firm gets over-built and a must-have marked Open gets quietly dropped.

Agents love to build horizontally. Left alone, one writes all the backend, then all the frontend, burning tokens for hours before anything exists you can run. `structure.md` breaks the work into independently testable phases instead, which turns the build back into the learning loops and iteration that have been best practice for decades. Henrik Kniberg drew the difference in [Making sense of MVP](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp) in 2016.

![Wide builds wheels, then a chassis, then a car. Deep builds a skateboard, then a scooter, then a bike.](/images/2026-08-16-skateboard.png)

Which makes the plan the real work product. The typing stopped mattering. The reading didn't. And once a plan is good enough that work can leave without you steering it, the only question left is how many you can have in the air at once.
