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

## You're Building on Shifting Sand

MCP is a moving target. What works today may break tomorrow. Sometimes literally.

Case in point: Claude's web client shipped a regression last week that broke OAuth for MCP connections. Their client stopped using dynamic client registration, and our server's OAuth discovery metadata needed updating. The same code worked fine in Claude Code and ChatGPT. Tracking down the issue was pure trial and error—Claude surfaced no error messages, just silent failure.

Now we're seeing ["MCP apps"](https://blog.modelcontextprotocol.io/posts/2025-11-21-mcp-apps/) emerge as a new pattern, and the spec itself has transitioned to the AI Foundation, which may actually *slow* the pace of change due to the foundation's governance structure.

This is the new frontier for AI agentic integration, and we're rediscovering observability pains that echo the early days of mobile development. Invest in observability. Smoke test across multiple clients. And be prepared to adopt new practices as fast as this space evolves.

## Tool Chaining Is Magic (When It Works)

Here's where MCP gets genuinely delightful. The client can extract relevant information from one tool response, hold it in context, and use it on subsequent calls.

Example: a user asks for their list of coaches. Then they ask to see availability for "Coach Sarah." The client seamlessly threads the coach ID from the first response into the second request. When it works, it feels like the future.

When it doesn't work, you're back to staring at the black box, wondering what broke.

## Tool Selection Is Out of Your Hands

When a user asks to "help me improve as a manager," whether that invokes your MCP tool is entirely up to the client. LLMs are inherently non-deterministic, and tool selection is no exception.

You can influence the odds through thoughtful tool metadata. Clear names, descriptive summaries, well-defined input schemas. But you can't guarantee your tool gets called. You're a tool in the toolbelt—you don't get to decide when the carpenter reaches for you.

## Context Window Management Is an Evolving Art

MCP tool metadata is loaded into the client's default context window. That sounds straightforward until you realize every token counts.

The new [deferred tool loading](https://platform.claude.com/docs/en/agents-and-tools/tool-use/tool-search-tool) spec changes this model, deferring tool metadata loading until needed. It's a reasonable trade-off, but it comes with its own cost: tool selection may suffer if the model doesn't "see" your tool's description upfront.

Tool responses also consume context—and context fills up fast. A single GitHub MCP server exposes [90+ tools, consuming 50,000+ tokens](https://www.anthropic.com/engineering/code-execution-with-mcp) before your prompt even runs. Some providers are shipping [advanced context management](https://anthropic.com/news/context-management) that automatically clears stale tool results, but adoption isn't universal. This space will keep evolving. For now, keeping your response payloads high-signal and low-noise isn't optional—it's essential.

## You Don't Control the Final Output

MCP responses are *interpreted* by the client, not passed verbatim to the user. This is by design. The agent has a toolbelt, but the tool isn't driving the conversation.

You can *request* that the model behave a certain way—embed instructions in your tool metadata, add guidance in your response body—but none of it is binding. The client decides how to present your data. It might summarize. It might rephrase. It might ignore your instructions entirely. You're making suggestions, not giving orders.

This may evolve as the ["MCP apps"](https://blog.modelcontextprotocol.io/posts/2025-11-21-mcp-apps/) spec matures, potentially allowing more direct integration that bypasses the chat interpretation layer. For now, the final presentation isn't yours to dictate.

## OAuth Is Complex and Opaque

[OAuth was a recent addition to the MCP spec](https://modelcontextprotocol.io/specification/draft/basic/authorization)—it wasn't part of the original protocol. The dance is non-trivial. Here's what happens when a user connects:

1. Client hits your server, gets a 401
2. Client discovers your OAuth metadata via `/.well-known/oauth-authorization-server`
3. Client dynamically registers itself (RFC 7591)
4. Client kicks off OAuth 2.1 with PKCE
5. User authorizes in a browser
6. Authorization code comes back
7. Client exchanges code for token
8. Bearer token goes in the header
9. Repeat for every. single. request.

That's nine steps before your tool does anything useful—and most of it is hidden inside the black box of MCP clients. When something breaks, you're reverse-engineering which step failed with no error messages to guide you.

Not all providers support dynamic client registration. Some skip metadata discovery entirely. We've built to OAuth 2.1 and modern RFC standards, but the client-side variability keeps things interesting.

## The Observability Gap

If there's a thread running through all of these lessons, it's this: **MCP development has a serious observability problem.**

Traditional client-server development gives you tools. Logs. Traces. Debuggers. Reproducible test environments. MCP gives you a protocol spec and a prayer.

You can verify your server implementation is correct. You can confirm your responses are well-formed. [MCP Inspector](https://github.com/modelcontextprotocol/inspector) is invaluable for verifying your implementation meets the spec. But passing the spec doesn't guarantee consistent behavior across actual clients and models. You're testing against a protocol, not against the unpredictable inference engines that will actually run your tools.

Once your payload disappears into an MCP client, you lose visibility. The model's reasoning, the tool selection logic, the context management... it's all opaque. When things break in production, root cause analysis often comes down to educated guessing and incremental experimentation.

This will improve as the ecosystem matures. But right now, building production MCP integrations requires a higher tolerance for ambiguity than most engineering projects.

## My Crystal Ball (It's Hazy)

Where does MCP go from here? Honestly, I'm less certain than usual. And that's saying something given the pace of AI infrastructure changes.

**50/50 odds MCP doesn't exist a year from now.** That's not pessimism. It's realism about how quickly this space is moving.  LLMs are getting *remarkably* good at generating their own tool integrations. Give a capable model access to a CLI, and decent API documentation, and it can often bootstrap its own "MCP-like" capabilities on the fly with existing tooling (curl, Typescript, etc).

The value proposition is clear: standardized, machine-readable metadata about tools. But OpenAPI already does this. So do well-designed API docs. Give a capable model a CLI and decent documentation, and it can bootstrap the same capabilities without MCP. The protocol may survive. Or it may get absorbed into something else. Either way, we'll keep integrating agentic capabilities into our workflows—with or without MCP.

## What I Know For Sure

Building the BetterUp MCP server was a lesson in shipping on shifting ground. The protocol is young, the ecosystem is fragmented, best practices are still being written, and the debugging experience is genuinely humbling.

But the core bet feels right: AI assistants will increasingly need structured access to the specialized platforms we use every day. Coaching in the flow of work isn't a gimmick. It's where things are headed.

We're just getting started.

---

*Want to try it yourself? [Connect BetterUp to Claude](https://www.betterup.com/blog/betterup-mcp-server) and see MCP-powered coaching in action.*
