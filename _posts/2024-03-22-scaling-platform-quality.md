---
title: "A Journey of Continuously Improving Platform Quality"
tags:
- engineering
- leadership
---

## Background
After nearly a decade of scaling our organization and releasing updates multiple times a day, we began to notice cracks in our foundation. The team felt that the quality of the platform was declining. Some endpoints were experiencing slow response times, incidents took increasingly longer to resolve, and technical debt had accumulated over time. This situation prompted us to embark on a journey to objectively define and measure the quality of our software platform and to devise a technical strategy for the future.

## Defining Platform Quality
Building a "high-quality" platform has always been an aspirational goal for every engineering team I've been part of. But what does "quality" really mean? After numerous discussions and iterations, we agreed on three dimensions to define quality:

A **quality** platform is:
* **Secure.** We handle our customer data with the utmost care, not just for compliance reasons, but because trust is crucial for delivering value to our customers.
* **Maintainable.** A maintainable system is as simple as necessary (but no simpler), adheres to SOLID software development principles, has clear domain boundaries (Domain-Driven Design), and boasts high test coverage to be resilient to changes.
* **Operational.** The health of the platform extends beyond the state of the codebase. It must be available for our customers, meet performance expectations, and we must respond swiftly when issues arise.

## Breaking the Platform into Systems
Measuring quality across an entire platform was too broad for effective discussions. We needed to break the platform down into individual components, which we called "Systems". We then created a scorecard showing the status of each system across each dimension of quality.

Here's an example of what a system scorecard might look like for a simplified e-commerce platform:

|                | Secure  | Maintainable | Operational |
|----------------|---------|--------------|-------------|
| Product Search | 50%     | 80%          | 90%         |
| Shopping Cart  | 100%    | 50%          | 75%         |
| Payment        | 90%     | 40%          | 80%         |

By breaking down platform quality into the health of individual systems, we could assess the quality of the entire platform more objectively and have more effective prioritization discussions about where to invest our efforts.

## Making It Objective
To make each scorecard dimension objective, we developed a set of measurable rules that we believed offered the highest leverage. We started small to gain traction with quick wins and continuously raised the bar by adding new attributes as quality improved over time.

Some of the attributes we chose include:

### Secure

* **Git branch protection:** With our infrastructure built around continuous integration and delivery, preventing direct pushes to critical branches reduces the risk of unauthorized changes and ensures proper review processes.
* **Code review enforcement:** Ensures that code changes are reviewed by peers, reducing the risk of vulnerabilities and improving code quality.
* **Static code analysis:** Identifies potential security vulnerabilities and coding issues early in the development process for common issues like the OWASP Top 10.
* **Vulnerability management:** When vulnerabilities are detected within our ecosystem, we remediate them within an expected SLA to keep our platform secure. This includes mitigating CVEs within our dependencies and addressing items found from external penetration tests and bug bounties.

### Maintainable

* **Documentation:** Clear and up-to-date documentation makes it easier for developers to understand, maintain, and integrate with a system. The three layers of documentation support various use cases: 1) System Overview (e.g., README) 2) Internal APIs (e.g., Yardoc) 3) External APIs (e.g., OpenAPI, Swagger docs).
* **Code coverage:** Measures the extent to which the codebase is covered by automated tests, ensuring that changes can be made with confidence.
* **Cyclomatic complexity:** Complex code has more bugs and is harder to maintain.
* **Age of outdated dependencies:** Tracks the age of dependencies and ensures they are regularly updated to minimize security risks and compatibility issues.
* **Age of experiments:** Feature flags are effective for rapid experimentation and are intended to be short-lived and cleaned up once they have served their purpose.

### Operational

* **Availability Service Level Objectives (SLOs):** Defines the target level of system availability, ensuring a reliable user experience.
* **Latency Service Level Objectives (SLOs):** Defines the target levels of system responsiveness.
* **Real User Monitoring (RUM) SLO:** For systems that include user-facing interactions, monitors the actual end-user experience and ensures that performance meets defined objectives.
* **Postmortem Service Level Agreement (SLA):** When incidents occur, ensures that lessons are learned promptly and improvements are made within a reasonable timeframe to not only prevent recurrence but also to enhance the overall system.

## Key Learnings
We've learned a ton over this past year and continue to learn as we move forward. Some of my key learnings include:

1. **It all starts with ownership.** The old saying goes, "When everyone is an owner, no one is an owner." One of the more challenging aspects of this journey was defining who was responsible for each system. After nearly ten years of development, every system had transitioned between owners, and subject matter experts continued to be pulled into conversations years after code was written and transitioned to other teams. It took significant effort to break this anti-pattern by assigning ownership of each system to a *team* instead of an individual. While most systems aligned well with the domains of most teams, there was a long tail of remaining systems where this assignment was far from clear and took significant time to align and negotiate who would be the responsible team. Ultimately, having any owner proved more important than having the perfect owner. Becoming a system owner did not make it a top priority, nor did it [create gatekeepers for changes](https://build.betterup.com/extreme-ownership-at-betterup/), but the clarity of who was responsible for a system if/when changes were needed was invaluable.
2. **Not all systems are created equal.** We recognized that not all systems are created equal and introduced a tiered system to adjust expectations accordingly. This was particularly helpful for setting appropriate latency Service Level Objectives (SLOs) for specific systems.
3. **Where you shine the light, a path will follow.** As soon as we began making these scorecards visible across the company, we saw organic change begin to happen. Even before we had set targets for each measure, many teams began prioritizing investments in improvement. The expectation was never that "all systems must be at 100%". Peter Drucker's famous quote: "You can't manage what you can't measure" inspired us to break down the ambiguous concept of "quality" into an absolutely imperfect set of measures to facilitate a starting point for more objective and strategic conversations.

We're not "done". This framework has provided an excellent starting point for iteration and future refinement of both the measures and dimensions.

## Implementation Details

I believe most of the above article applies to any architecture, but in case it's interesting, I thought I'd share a few rough notes on what's under the hood for our environment which may have influenced our decisions.

1. We have operated with a [Rails Majestic Monolith](https://signalvnoise.com/svn3/the-majestic-monolith/) for most of our history. We have a few non-Ruby microservices in our ecosystem, which makes our environment closer to a [Citadel Architecture](https://blog.appsignal.com/2020/04/08/the-citadel-architecture-at-appsignal.html). There were many conversations about how much microservices should be part of our strategy going forward, and we made the opinionated decision to modularize the Monolith *instead* of migrating to Microservices. We chose [Packwerk](https://github.com/Shopify/packwerk) for our ecosystem, which offers amazing features for incremental migration and dependency analysis, although I've also done this in the past with vanilla Rails engines.
2. You can certainly accomplish system registry and scorecarding in spreadsheets, but why would you? I can't say enough good things about our experience with [Cortex](https://app.getcortexapp.com/) (And no, I'm not being paid for this endorsement). One of the killer features for me was the ability to have scorecards updated in near real-time from API integrations in our CI/CD processes, as well as their ability to *pull* information from our sources of truth (e.g., Datadog for performance SLOs).
