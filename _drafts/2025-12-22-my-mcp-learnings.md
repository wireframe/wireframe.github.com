---

title: "What I Learned Building BetterUp's MCP Server (And Where This Is All Heading)"
tags:
- mcp
- learnings
---

We recently shipped the [BetterUp MCP Server](https://www.betterup.com/blog/betterup-mcp-server), one of the first to bring human and AI coaching into the MCP ecosystem. The official announcement covers the *what* and *why*. This post is about the scars I picked up along the way.

**This was one of the most technically challenging projects I've ever taken on.**

That might sound surprising. MCP is "just" a protocol, right? But the complexity isn't in any single component. It's in the opacity of the entire system.

When you're building a mobile app, you can inspect execution paths on both the client and the backend. You can set breakpoints, trace requests, examine state. MCP development offers none of that comfort. The clients are complete black boxes. You ship a tool, and then you *hope* it gets selected. You *hope* the context threads correctly. You *hope* the response gets interpreted the way you intended. When something goes wrong, you're often left guessing.

That lack of observability runs through nearly every lesson I learned. Here's what I wish I'd known going in.

## The Spec Moves Faster Than Your Implementation

MCP is a moving target. What works today may break tomorrow. Sometimes literally.

Case in point: Claude broke OAuth support for web-based MCP connections just last week (Claude Code was unaffected). OAuth wasn't even part of the original MCP specification. It was added later as the ecosystem matured. Now we're seeing "MCP apps" emerge as a new pattern, and the spec itself has transitioned to the AI Foundation, which may actually *slow* the pace of change due to the foundation's governance structure.

The takeaway: build with flexibility in mind, and don't get too attached to any single implementation detail.

## Tool Selection Is Out of Your Hands

This was humbling to learn. When a user says "help me improve as a manager," whether that invokes your MCP tool is entirely up to the client. LLMs are inherently non-deterministic, and tool selection is no exception.

You can influence the odds through thoughtful tool metadata. Clear names, descriptive summaries, well-defined input schemas. But you can't guarantee your tool gets called. You're providing capabilities, not controlling the conversation.

And when your tool *doesn't* get selected? Good luck figuring out why. Was the metadata unclear? Did another tool seem more relevant? Did the model just... not feel like it? The black box offers no answers.

## Context Window Management Is an Evolving Art

MCP tool metadata is loaded into the client's default context window. That sounds straightforward until you realize every token counts.

The new [deferred tool loading](https://platform.claude.com/docs/en/agents-and-tools/tool-use/tool-search-tool) spec changes this model, deferring tool metadata loading until needed. It's a reasonable trade-off, but it comes with its own cost: tool selection may suffer if the model doesn't "see" your tool's description upfront.

Tool responses also consume context (though this may change). Keeping your response payloads high-signal and low-noise isn't optional. It's essential.

## Tool Chaining Is Magic (When It Works)

Here's where MCP gets genuinely delightful. The client can extract relevant information from one tool response, hold it in context, and use it on subsequent calls.

Example: a user asks for their list of coaches. Then they ask to see availability for "Coach Sarah." The client seamlessly threads the coach ID from the first response into the second request. When it works, it feels like the future.

When it doesn't work, you're back to staring at the black box, wondering what broke.

## You Don't Control the Final Output

MCP responses are *interpreted* by the client, not passed verbatim to the user. This is by design. The agent has a toolbelt, but the tool isn't driving the conversation.

This may evolve as the "MCP apps" spec matures, potentially allowing more direct integration that bypasses the chat interpretation layer. For now, you can nudge the client through instructions embedded in your tool metadata and response bodies, but the final presentation isn't yours to dictate.

## Model Variability Is Real

Different foundation models behave differently. Sometimes dramatically so.

GPT-5, for instance, doesn't consistently follow instructions we embed in tool responses asking it to relay information without "massaging" the message. Context chaining behavior also varies across models. What works flawlessly on Claude may behave unexpectedly elsewhere.

MCP Inspector is invaluable for verifying your implementation meets the spec. But passing the spec doesn't guarantee consistent behavior across actual clients and models. You're testing against a protocol, not against the unpredictable inference engines that will actually run your tools.

## OAuth Is Complex and Opaque

The OAuth dance in MCP is non-trivial. It's largely hidden inside the black box of MCP clients, which means debugging authentication issues can feel like archaeology.

Not all providers support dynamic client registration. Some implement token handling differently. We've built to OAuth 2.1 and modern RFC standards, but the client-side variability keeps things interesting.

## The Observability Gap

If there's a thread running through all of these lessons, it's this: **MCP development has a serious observability problem.**

Traditional client-server development gives you tools. Logs. Traces. Debuggers. Reproducible test environments. MCP gives you a protocol spec and a prayer.

You can verify your server implementation is correct. You can confirm your responses are well-formed. But once your payload disappears into an MCP client, you lose visibility. The model's reasoning, the tool selection logic, the context management... it's all opaque. When things break in production, root cause analysis often comes down to educated guessing and incremental experimentation.

This will improve as the ecosystem matures. But right now, building production MCP integrations requires a higher tolerance for ambiguity than most engineering projects.

## My Crystal Ball (It's Hazy)

Where does MCP go from here? Honestly, I'm less certain than usual. And that's saying something given the pace of AI infrastructure changes.

**50/50 odds MCP doesn't exist a year from now.** That's not pessimism. It's realism about how quickly this space is moving.  LLMs are getting *remarkably* good at generating their own tool integrations. Give a capable model access to a CLI, and decent API documentation, and it can often bootstrap its own "MCP-like" capabilities on the fly with existing tooling (curl, Typescript, etc).

That said, MCP's current value proposition is clear: it provides human and machine-readable metadata about tools in a standardized way. OpenAPI offers similar functionality, as do well-designed API documentation sites. Whether MCP's specific approach wins out or gets absorbed into something else remains to be seen.

## What I Know For Sure

Building the BetterUp MCP server was a lesson in shipping on shifting ground. The protocol is young, the ecosystem is fragmented, best practices are still being written, and the debugging experience is genuinely humbling.

But the core bet feels right: AI assistants will increasingly need structured access to the specialized platforms we use every day. Coaching in the flow of work isn't a gimmick. It's where things are headed.

We're just getting started.

---

*Want to try it yourself? [Connect BetterUp to Claude](https://www.betterup.com/blog/betterup-mcp-server) and see MCP-powered coaching in action.*
