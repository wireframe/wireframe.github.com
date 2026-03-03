---
title: "Agentic Engineering: Pilots Wanted"
tags:
- engineering
- product development
featured_description: >
  What agentic engineering looks like in practice, not in pitch decks
---

*Practical steps for integrating agents into your team, your stack, and your culture—without the hype*

## Buckle up!

We’re entering a new era of product development.

Agents—powered by large language models and other autonomous systems—are no longer just novelty tools or research demos. They’re *rapidly* becoming part of the workforce. Whether it’s triaging bugs, generating tests, or scaffolding new features, we’re seeing agents embedded into the tools, platforms, and our daily workflows.

The differentiator isn’t just in having agents. It’s in building the environment, infrastructure, and mindsets that allow teams to integrate them meaningfully.

But we’re still in the early days, and teams are regularly stumbling over landmines: tooling is inconsistent, the behavior is brittle, hallucinations, stale context, unpredictable edge cases. It’s messy. It’s frustrating. And it’s also one of **the most exciting shifts we’ve seen in software** since the rise of cloud-native development.

In this moment of rapid technological shift, now more than ever, we need "Pilots"—those who proactively tune environments, validate outputs, and guide agents through complex systems. Not "Passengers" waiting for someone else to figure it all out.

Let’s get to work.

---

## From Planning to Landing: Humans *still* required

Let's get this out of the way first. Agents currently have *severe* limitations and require significant oversight from domain experts with sufficient context. You cannot abdicate responsibility for code written by an agent. They’re only following your instructions—you bear responsibility for the result.

[This excellent interview with Gumroad's CEO, Sahil Lavingia](https://youtu.be/KVZ3vMx_aJ4), describes a model of human + agent collaboration where humans act as the task planners and reviewers—allowing agents to operate asynchronously.

Humans are uniquely suited to:

1. **The Planning.** Craft clear intent by providing well-defined tasks, expected outputs, and reference materials.
2. **The Landing.** Review, test, and ensure the agent’s output meets quality and functional standards. This often involves the same rigor as traditional code review and QA.

Teams can begin evaluating agents not just by what they output—but by how much human intervention is needed to land that work safely.

## Agents as Interns

Think of an agent as an intern. Ask an intern to "optimize the UI" and you’ll get chaos. But with a clear spec, metrics, and examples, you’ll get useful output.

Today’s agents are confident but brittle. This model helps manage expectations: with structure and support, they can be effective contributors.

When working with an agent, ask yourself:

> 🧠 If it could help an intern, it **definitely** will help an agent.

This test ensures you’re providing enough context and scaffolding for success.

(Side note: It’s wild to consider that **today is the worst these agents will ever be**. The pace of improvement is staggering.)

## Agent-Ready DX

If your systems are hard for humans to work with, they’re worse for machines. Great Developer Experience (DX) benefits everyone—including agents.

Make it easy for both:

* **Reproducible environments:** Use containers or setup scripts to onboard agents and humans alike.
* **Reliable test suites:** Fast, comprehensive tests allow agents to verify their changes.
* **Clear observability:** Well-structured logs, traces, and error messages help both sides of the collaboration debug effectively.

Better DX = more autonomy and less babysitting.

## It's All About the Context

Agents need usable context to succeed. In greenfield apps, it’s easier to bake in modular design and modern practices from the start.

Legacy systems? That’s where it gets tricky.

Use this **Agent Context Hygiene** checklist:

- ❌ Outdated or incomplete documentation  
- ❌ Accumulated TODOs and dead code  
- ❌ Inconsistent naming or structure  
- ✅ Modular, readable code  
- ✅ Accurate READMEs and internal docs

Poor context = hallucinations, misfires, and frustration. Fixing that helps everyone.

## Agentic Ecosystem

There’s no universal agent. Choose tools that fit your use case and maturity.

### a. Rapid Prototyping Agents  
*e.g., Vercel V0, Lovable.ai*

Great for early exploration. These tools convert napkin sketches or high-level designs into clickable prototypes. Don’t expect production-ready code—optimize for speed and learning.

### b. Engineering Implementation Agents  
*e.g., Cursor, GitHub Copilot, Devin.ai*

These work within your real stack—leveraging your data models, APIs, and architecture.

> Start small. Use real workflows. Measure impact.

## The Future is Now…

Agentic engineering isn’t a shortcut. It’s a discipline. A mindset of designing systems that enable collaboration—not just execution.

Teams that win won’t just adopt agents. They’ll create the conditions for agents to thrive: tuned environments, clean codebases, strong oversight, and a culture that supports experimentation.

In this rapidly evolving space, one thing is clear:
**Pilots ~~wanted~~ required.**