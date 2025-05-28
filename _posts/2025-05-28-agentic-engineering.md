---
title: "Agentic Engineering: Pilots Wanted"
tags:
- engineering
- product development
---

*Practical steps for integrating agents into your team, your stack, and your culture—without the hype*

## Buckle up!

We’re entering a new era of product development.

Agents—powered by large language models and other autonomous systems—are no longer just novelty tools or research demos. They’re *rapidly* becoming part of the workforce. Whether it’s triaging bugs, generating tests, summarizing retrospectives, or scaffolding new features, we’re starting to embed agents into the tools, platforms, and workflows we already rely on.

The differentiator isn’t just in having agents. It’s in building the habits, infrastructure, and mindsets that allow teams to integrate them meaningfully. To turn them from passive tools into active contributors. From passengers into pilots.

But we’re still in the early days. The tooling is uneven. The behavior is brittle. And teams are regularly stumbling over landmines—hallucinations, stale context, unpredictable edge cases. It’s messy. It’s frustrating. And it’s also one of the most exciting shifts we’ve seen in software since the rise of cloud-native development. In this moment of rapid technological shift, now is the time more than ever, that we need "Pilots" to navigate through the turbulence and avoid waiting as "Passengers" for someone else to figure it all out.

Let’s get to work.

---

## From Planning to Landing: Humans *still* required

Let's get this out of the way first. Agents currently have *severe* limitations, and require significant oversight from domain experts who have sufficient context. Just because an agent wrote the code does not mean you abdicate responsibility for every single line they write. After all, they're only following your instructions (ie: prompt) and operating on your behalf.

The model described in this excellent interview with Gumroad's CEO, Sahil Lavingia, really resonates with me that human's bear significant responsibility in crafting the intent for agentic behavior (ie: The Planning), as well as ensuring that the work done by the agent accomplishes the task appropriately (ie: The Landing).  
[https://youtu.be/KVZ3vMx_aJ4](https://youtu.be/KVZ3vMx_aJ4)

Teams will soon start to evaluate how effective their agentic workforce is by how much intervention is required to "land" a given changeset.

## Agents as Interns

The best model I've found is to **think of an agent as an intern**. Given clear enough instructions, they are capable of autonomous execution, yet require *thorough* inspection to ensure the work is done correctly and meets the desired quality. 

LLMs are confident, but not always correct. Today’s agents are “brittle scripts wearing a clever mask.” They can be powerful, but they’re fragile—and they need support. To that end, a simple question to ask oneself when collaborating with an agent is:

> 🧠 If it helps an intern, it helps an agent.

This leads to my next point that investing in improved codebase ergonomics benefit not only the agentic workforce, but also every human engineer as well.

(Side note: It is bonkers that **today is the worst these agents will *ever* be**. What a wild thought to consider what things will look like just a few short years from now!)

## Better DX = Better Agents

If your systems are hard for a human to navigate, they’re worse for a machine. Reusing the intern analogy, the easier it is for an intern to get up an running, the more successful they will be. Good Developer Experience principles apply equally to agents.

Developer experience (DX) topics that significantly impact agentic engineering workflows include:

- **Codebase consistency and readability**: Clean, modular code with consistent patterns makes it easier for agents to reason and generate safe outputs.
- **Comprehensive, updated documentation**: Accurate and accessible internal documentation, including READMEs, API references, and design documents, reduces the chance of agentic misunderstanding or hallucination.
- **Testing infrastructure**: Fast, reliable test suites (unit, integration, and end-to-end) empower agents to self-check changes and reduce risk.
- **Well-defined error messages and logs**: Useful debugging output helps agents (and developers) trace and correct failures effectively.
- **Intuitive local development environments**: Easily reproducible environments (e.g., with containerization or setup scripts) reduce barriers to productive agent contribution.
- **Declarative configuration and infrastructure**: Infrastructure as code and consistent environment setups reduce ambiguity and make reasoning about system behavior easier.
- **Tooling observability**: Monitoring, tracing, and performance tools give agents data to reason over and help humans audit their impact.
- **Semantic versioning and changelogs**: Clear visibility into what changed and why supports safe, context-aware operation by agents.
- **Granular access and permissions**: Role-based access ensures agents operate within defined boundaries and limits blast radius.
- **Continuous Integration (CI) and validation hooks**: CI pipelines that catch regressions and enforce standards help agents align with team norms and deliver safe, verifiable output.

All of these contribute to creating environments where agents can act effectively without requiring constant human babysitting—turning them into true leverage multipliers.

Agents perform best when they’re introduced into environments with intentional entry points and well-scoped permissions. Think of it as building a “first day experience” for a digital teammate.

---

## It's All About The Context

Context is everything. A well-scoped agent still needs to understand *enough* of the environment to be useful.

Building greenfield applications with agentic engineering have the benefit of a clean slate—free from legacy decisions, tech debt, and inconsistencies. It's relatively straightforward for an LLM to bootstrap new applications, apply best practices, modular design, and current documentation standards when you're not constrained by years of accumulated complexity.

In contrast, introducing agentic workflows into an existing application means navigating a much trickier landscape. Engineers must grapple with outdated patterns, legacy dependencies, untyped code, brittle interfaces, and often contradictory documentation. These conditions don’t just slow human onboarding—they actively impair agentic performance, increasing the likelihood of hallucinations, bad assumptions, or unintended side effects.

To put it plainly: adapting best practices to an existing application isn't just about retrofitting design patterns. It's about unblocking clarity—for humans and agents alike.

There is significant challenge in integrating an agent into legacy codebases. The old adage "Garbage in, Garbage out", is incredibly applicable for what you're feeding into an agent for context. Is your application's codebase littered with:

- out of date documentation and incomplete README's. Old documentation is a fast path to hallucinations.
- TODOs as holding places for technical debt that someone else should take care of in the future.
- Legacy modules, dead code, inconsistent patterns

If it’s confusing for a human, it’s worse for a language model. Constant investments in housekeeping your codebase context generates *significant* yield for both human engineers and agentic performance.

---

## Agentic Ecosystem

At the moment, there is no "one-size-fits-all" agent.  There are a variety of agents that solve very different use-cases in the product development process.  Match their role to your maturity and your need.

### a. Rapid Prototyping
e.g. Vercel V0, Lovable.ai, etc

- Dump-to-code tools for concept visualization
- Storyboarding agents that interpret user flows
- Low-risk, fast-feedback environments

### b. Embedded Implementation
e.g. Cursor Code, Github Copilot, Devin.ai, etc

- Agents that work *within* your application
- Context-aware agents that know your data models and internal APIs
- “Intern work” delegation: testing, migrations, UI tweaks

My recommendation is to: Start small. Use real workflows. Measure impact.

---

## The Future is Now...

Agentic engineering isn’t a shortcut. It’s a discipline—a mindset of treating systems as collaborators, not just tools.

The teams that will thrive in this new era won’t just be the ones who adopt agents first, but the ones who integrate them thoughtfully. Who tune their environments, groom their codebases, and keep humans in the loop from planning to landing.

The goal isn’t perfection—it’s progress. Design your systems to help agents try, learn, and improve. Invest in the conditions that make it safe to experiment and easy to adapt.

We don't need agents that execute blindly. We need ones that act with intent, backed by context, and supported by humans who care about the outcome. In this rapidly evolving landscape, one thing is clear: Pilots are ~~wanted~~ required.