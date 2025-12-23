---

title: "Lessons Learned From Building BetterUp's MCP Server (And Where This Is All Heading)"
tags:
- mcp
- learnings
---

We recently shipped the [BetterUp MCP Server](https://www.betterup.com/blog/betterup-mcp-server), one of the first to bring human and AI coaching into the MCP ecosystem. The official announcement covers the *what* and *why*. This post is about the scars I picked up along the way.

**This was one of the most technically challenging projects I've ever taken on.**

That might sound surprising. MCP is "just" a protocol, right? But the complexity isn't in any single component. It's in the opacity of the entire system.

When you're building a mobile app, you can inspect execution paths on both the client and the backend. You can set breakpoints, trace requests, examine state. MCP development offers none of that comfort. The clients are complete black boxes. You ship a tool, and then you *hope* it gets selected. You *hope* the response gets interpreted the way you intended. When something goes wrong, you're often left guessing.

Here are a few of the lessons I learned.

## You're Building on Shifting Sand

MCP is a moving target. What works today may break tomorrow. Sometimes literally.

Case in point: Claude's web client shipped a regression last week that broke OAuth for MCP connections. Their client changed implementation that broke dynamic client registration. The same code worked fine in Claude Code and ChatGPT. Tracking down the issue, and making the changes to our OAuth discovery metadata, was pure trial and error. Claude surfaced no error messages, just silent failure.

It feels like we're rediscovering observability pains that echo the early days of mobile development.  The pace of change in the MCP spec has been incredibly high, and with the recent transition of the spec to the [Agentic AI Foundation](https://aaif.io/), it is an open question whether the foundation's governance will *slow* the pace of change.

Regardless, the investments in observability pay off dividends as client implementations continue to iterate. Smoke test across multiple clients. And be prepared to adopt new practices as fast as this space evolves.

## Tool Chaining Is Magic (When It Works)

Here's where MCP gets genuinely delightful. The client can extract relevant information from one tool response, hold it in context, and use it on subsequent calls.

Example: a user asks to book a coaching session with their coach.  The MCP client seamlessly calls one tool to identify who the current coach is, and plucks the identifier for subsequent tool call to find open times for a coaching call.  When it works, it feels like the future.

When it doesn't work, you're back to staring at the black box, wondering why it failed and sometimes just trying again will get the "magic" to fire.

## Tool Selection Is Out of Your Hands

When a user asks to "help me improve as a manager," whether that invokes your MCP tool is entirely up to the client. LLMs are inherently non-deterministic, and tool selection is no exception.

You can influence the odds through thoughtful tool metadata. Clear names, descriptive summaries, well-defined input schemas. But you can't guarantee your tool gets called. You're a tool in the toolbelt. You don't get to decide when the carpenter reaches for you.

## Context Window Management Is an Evolving Art

MCP tool metadata is loaded into the client's default context window. That sounds straightforward until you realize every token counts.

The new [deferred tool loading](https://platform.claude.com/docs/en/agents-and-tools/tool-use/tool-search-tool) spec changes this model, deferring tool metadata loading until needed. It's a reasonable trade-off, but it comes with its own cost: tool selection may suffer if the model doesn't "see" your tool's description upfront.

Tool responses also consume context, and context fills up fast. A single GitHub MCP server exposes [90+ tools, consuming 50,000+ tokens](https://www.anthropic.com/engineering/code-execution-with-mcp) before your prompt even runs. Some providers are shipping [advanced context management](https://anthropic.com/news/context-management) that automatically clears stale tool results, but adoption isn't universal. This space will keep evolving. For now, keeping your response payloads high-signal and low-noise isn't optional. It's essential.

## You Don't Control the Final Output

MCP responses are *interpreted* by the client, not passed verbatim to the user. This is by design. The agent has a toolbelt, but the tool isn't driving the conversation.

You can *request* that the model behave a certain way: embed instructions in your tool metadata, add guidance in your response body. But none of it is binding. The client decides how to present your data. It might summarize. It might rephrase. It might ignore your instructions entirely. You're making suggestions, not giving orders.

This may evolve as the ["MCP apps"](https://blog.modelcontextprotocol.io/posts/2025-11-21-mcp-apps/) spec matures, potentially allowing more direct integration that bypasses the chat interpretation layer. For now, the final presentation isn't yours to dictate.

## OAuth Is Complex and Opaque

[OAuth is a fairly recent addition to the MCP spec](https://modelcontextprotocol.io/specification/draft/basic/authorization), and a massive unlock for building secure end-to-end tool execution. But it also has introduced a non-trivial amount of complexity as MCP clients implement the OAuth dance with...

1. Dynamic client discovery of OAuth well-known metadata
2. Client dynamically registers itself (RFC 7591)
3. Client kicks off OAuth 2.1 with PKCE
4. User authorizes in a browser
5. Authorization code comes back
6. Client exchanges code for token
7. Bearer token goes in the header for subsequent calls

That's a whole lot of steps before your tool does anything useful. Most of it is hidden inside the black box of MCP clients. And when something breaks, you're reverse-engineering which step failed with no error messages to guide you.

On top of that, the client-side variability keeps things interesting.  Not all providers support dynamic client registration. Some skip metadata discovery entirely. We've built to OAuth 2.1 standards, but every MCP client requires significant end-to-end testing to ensure they work as expected.

## The Observability Gap

If there's a thread running through all of these lessons, it's this: **MCP development has a serious observability problem.**

Traditional client-server development gives you tools. Logs. Traces. Debuggers. Reproducible test environments. MCP gives you a protocol spec and a prayer.

You can verify your server implementation is correct. You can confirm your responses are well-formed. [MCP Inspector](https://github.com/modelcontextprotocol/inspector) is invaluable for verifying your implementation meets the spec. But passing the spec doesn't guarantee consistent behavior across actual clients and models. You're testing against a protocol, not against the unpredictable inference engines that will actually run your tools.

Once your payload disappears into an MCP client, you lose visibility. The model's reasoning, the tool selection logic, the context management... it's all opaque. When things break in production, root cause analysis often comes down to educated guessing and incremental experimentation.

This will improve as the ecosystem matures. But right now, building production MCP integrations requires a higher tolerance for ambiguity than most engineering projects.

## My Crystal Ball (It's Hazy)

Building the BetterUp MCP server was a lesson in shipping on shifting ground. The protocol is young, the ecosystem is fragmented, best practices are still being written, and the debugging experience is genuinely humbling.

So, where does MCP go from here? Honestly, I'm less certain than usual. The pace of change in this space continues to accelerate and make things less predictable.

**50/50 odds MCP doesn't exist a year from now.** That's not pessimism. It's realism about how quickly this space is moving. LLMs are getting *remarkably* good at generating their own tool integrations. Give a capable model a CLI and decent API documentation, and it can bootstrap "MCP-like" capabilities on the fly with existing tooling (curl, TypeScript, etc).

The value proposition is clear: standardized, machine-readable metadata about tools. But OpenAPI already does this. So do well-designed API docs. The protocol may survive. Or it may get absorbed into something else. Either way, we'll keep integrating agentic capabilities into our workflows, with or without MCP.

But the core bet feels right: AI assistants will increasingly need structured access to the specialized platforms we use every day. It's where things are headed, and we're just getting started.

---

*Want to try it yourself? [Connect BetterUp to Claude](https://www.betterup.com/blog/betterup-mcp-server) and see MCP-powered coaching in action.*
