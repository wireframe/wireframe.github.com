---
title: "Agentic Engineering: Pilots Wanted"
tags:
- engineering
- product development
---

*Practical steps for integrating agents into your team, your stack, and your culture—without the hype*

## Buckle up!

We’re entering a new era of product development.

Agents—powered by large language models and other autonomous systems—are no longer just novelty tools or research demos.  They’re *rapidly* becoming part of the workforce.  Whether it’s triaging bugs, generating tests, or scaffolding new features, we’re seeing agents embedded into the tools, platforms, and our daily workflows.

The differentiator isn’t just in having agents.  It’s in building the environment, infrastructure, and mindsets that allow teams to integrate them meaningfully.  

But we’re still in the early days and teams are regularly stumbling over landmines: tooling is inconsistent, the behavior is brittle, hallucinations, stale context, unpredictable edge cases.  It’s messy.  It’s frustrating.  And it’s also one of **the most exciting shifts we’ve seen in software** since the rise of cloud-native development.  In this moment of rapid technological shift, now more than ever, we need "Pilots" to navigate through the turbulence and avoid waiting as "Passengers" for someone else to figure it all out.

Let’s get to work.

---

## From Planning to Landing: Humans *still* required

Let's get this out of the way first. Agents currently have *severe* limitations, and require significant oversight from domain experts who have sufficient context.  
You can not abdicate responsibility for code written by an agent.  After all, they're literally only following the instructions you gave them.  You still bear the responsibility for every line of code.

[This excellent interview with Gumroad's CEO, Sahil Lavingia](https://youtu.be/KVZ3vMx_aJ4), describes a model for human + agent team interaction that really resonated with me where humans are acting as the drivers for agents to operate on tasks asynchronously.  This highlights where humans are uniquely positioned for:
1.  **The Planning.**  Take the lead in crafting the *intent* for the agents behavior by providing a clear specification of the work to be done, and the expected output along with any reference materials needed to accomplish the task.
2.  **The Landing.**  Team members are responsible for ensure that the work done by the agent accomplishes the task appropriately and with the expected level of quality.  This generally follows standard Development Code Review and Quality Assurance practices.

From there, the actual implementation can be taken on by the agent to (hopefully) complete the job successfully.  It will be interesting to see how teams begin to evaluate the effectiveness their agentic workforce is by how much intervention is required to "land" a given changeset.

## Agents as Interns

The best model I've seen is to **think of an agent as an intern**.  Given clear enough instructions, they are capable of autonomous execution, yet require *thorough* inspection to ensure the work is done correctly and meets the desired quality. 

LLMs are confident, but not always correct.  Today’s agents can be powerful, but they’re fragile and they need support. When collaborating with an agent, a good litmus test question to ask yourself is:

> 🧠 If it could help an intern, it **definitely** will help an agent.

This framing helps helpful to ensure I'm providing enough context for prompts, as well as adding proper reference implementations for expected outputs.

(Side note: It is absolutely *bonkers* that **today is the worst these agents will *ever* be**.  What a wild thought to consider what things will look like just a few short years from now!)

## Better DX = Better Agents

If your systems are hard for a human to navigate, they’re worse for a machine.  Reusing the intern analogy, the easier it is for an intern to get up an running, the more successful they will be. 

Good Developer Experience practices apply equally to agents.  Developer experience (DX) topics that significantly impact agentic engineering workflows include:
* **Intuitive local development environments:** Easily reproducible environments (e.g., with containerization, setup scripts, or Infrastructure as Code) reduce barriers to productive agent contribution.
* **Testing infrastructure:** Fast, reliable test suites (unit, integration, and end-to-end) empower agents to self-check changes and reduce risk.  The better your developer experience for running test suites, the better an agent will be able to "self verify" that it's changes are correct.
* **Tooling observability:** Monitoring, tracing, and performance tools give agents data to reason over and help humans audit their impact.  Including well-defined error messages and logs for useful debugging output helps agents (and developers) trace and correct failures effectively.

All of these contribute to creating environments where agents can act effectively without requiring constant human babysitting—turning them into true leverage multipliers.

## It's All About The Context

Context is everything. A well-scoped agent still needs to understand *enough* of the environment to be useful.

Building greenfield applications with agentic engineering have the benefit of a clean slate—free from legacy decisions, tech debt, and inconsistencies. It's relatively straightforward for an LLM to bootstrap new applications, apply best practices, modular design, and current documentation standards when you're not constrained by years of accumulated complexity.

In contrast, introducing agentic workflows into an existing application means navigating a much trickier landscape. Engineers must grapple with outdated patterns, legacy dependencies, untyped code, brittle interfaces, and often contradictory documentation. These conditions don’t just slow human onboarding—they actively impair agentic performance, increasing the likelihood of hallucinations, bad assumptions, or unintended side effects.

To put it plainly: adapting best practices to an existing application isn't just about retrofitting design patterns. It's about unblocking clarity—for humans and agents alike.

There is significant challenge in integrating an agent into legacy codebases. The old adage "Garbage in, Garbage out", is incredibly applicable for what you're feeding into an agent for context. Is your application's codebase littered with:

* out of date documentation and incomplete README's.  Old documentation is a fast path to hallucinations.
* TODOs as holding places for technical debt that someone else should take care of in the future.
* Legacy modules, dead code, inconsistent patterns
* Codebase consistency and readability: Clean, modular code with consistent patterns makes it easier for agents to reason and generate safe outputs.
* Comprehensive, updated documentation: Accurate and accessible internal documentation, including READMEs, API references, and design documents, reduces the chance of agentic misunderstanding or hallucination.

If it’s confusing for a human, it’s worse for a language model. Constant investments in housekeeping your codebase context generates *significant* yield for both human engineers and agentic performance.

## Agentic Ecosystem

At the moment, there is no "one-size-fits-all" agent.  There are a variety of agents that support very different use-cases across the product development process.  Match their role to your maturity and your need.

### a. Rapid Prototyping Agents
e.g. Vercel V0, Lovable.ai, etc

These agents support early stage concept exploration and zero-to-one product experimentation.  
Great usecases are for taking a high level design (mockup or even a napkin drawing), and translating that into a high-fidelity clickable prototype.

The output of this agent may very well be throw-away code, but the value is very high for rapid exploration of concept feature sets.

### b. Engineering Implementation Agents
e.g. Cursor Code, Github Copilot, Devin.ai, etc

These agents are more targeted to work within your application context with an understanding of existing data models, APIs, etc.

You may not need agents across all use cases.  My recommendation is to: Start small...Use real workflows...and measure impact.

## The Future is Now...

Agentic engineering isn’t a shortcut. It’s a discipline and a mindset of treating systems as collaborators, not just tools.

The teams that will thrive in this new era won’t just be the ones who adopt agents first, but the ones who integrate them thoughtfully. Who tune their environments, groom their codebases, keep humans in the loop from planning to landing, and invest in the conditions that make it safe to experiment and easy to adapt.

In this rapidly evolving landscape, one thing is clear: **Pilots ~~wanted~~ required.**