---
title: "A Journey of Continuously Improving Platform Quality"
tags:
- engineering
- leadership
---

## Background
After nearly a decade of scaling our organization and shipping releases multiple times a day, we began to see cracks in our foundation.  The sentiment from the team was that the quality of the platform was deteriorating.  Some of our endpoints were struggling with response times, incidents were taking longer and longer to resolve, and the amount of technical debt had increased over time.  This prompted us to embark on a journey to define and measure the quality of our software platform objectively and craft a technical strategy going forward.

## Defining Platform Quality
Building a "high-quality" platform has been an aspirational goal of __every__ engineering team that I've been a part of, but what does "quality" really mean?  After many conversations and iterations, we aligned on three dimensions to define quality.

A **quality** platform is:
* **Secure.**  We treat our customer data with the utmost care, not for compliance reasons, but because trust is essential for delivering value to our customers.
* **Maintainable.**  A maintainable system is as simple as necessary (and not simpler), adheres to SOLID software development principles, has clear domain boundaries (Domain-Driven Design), and has high test coverage to be resilient to changes.
* **Operational.**  The health of the platform is __more__ than the state of the codebase.  It is available for our customers, responsive to performance expectations, and we respond quickly when issues arise.

## Breaking the Platform into Systems
Measuring quality across an __entire__ platform was too broad to have effective conversations.  We needed to break the platform down into individual parts, which we called "Systems".  From there, we built a scorecard with the status of each system across each dimension of quality.

Here's an example of what a system scorecard might look like for a simplified e-commerce platform:

|                | Secure  | Maintainable | Operational |
|----------------|---------|--------------|-------------|
| Product Search | 50%     | 80%          | 90%         |
| Shopping Cart  | 100%    | 50%          | 75%         |
| Payment        | 90%     | 40%          | 80%         |

By decomposing platform quality into the health of individual systems, we were able to see the quality of the entire platform, and have __much__ more objective and effective prioritization conversations around where to invest our efforts.

## Making It Objective
To make each of the scorecard dimensions objective, we built out a set of measurable rules that we believed provided the highest leverage.  We started small to gain traction with quick wins, and then continuously raised the bar by adding new attributes as quality improved over time. 

Some of the attributes that we chose include:

### Secure

* **Git branch protection:**  With our infrastructure and deployment infrastructure built around continuous integration, and continuous delivery, preventing direct pushes to critical branches, reducing the risk of unauthorized changes and ensuring proper review processes. 
* **Code review enforcement:** Ensures that code changes are reviewed by peers, reducing the risk of vulnerabilities and improving code quality. 
* **Static code analysis:** Identifies potential security vulnerabilities and coding issues early in the development process for common issues like the OWASP Top 10.  
* **Vulnerability management**:**  When vulnerabilities are detected within our ecosystem, we remediate them within an expected SLA to keep our platform secure.  This includes mitigating CVEs within our dependencies, to items found from external penetration tests and bug bounties.

### Maintainable

* **Documentation:** Clear and up-to-date information makes it easier for developers to understand, maintain, and integrate with a system. The three layers of documentation support various use cases: 1) System Overview (eg: README) 2) Internal APIs (eg: Yardoc) 3) External APIs (eg: OpenAPI, Swagger docs).
* **Code coverage:** Measures the extent to which the codebase is covered by automated tests, ensuring that changes can be made with confidence. 
* **Cyclomatic complexity:** Complex code has more bugs and is harder to maintain.
* **Age of outdated dependencies:** Tracks the age of dependencies and ensures they are regularly updated to minimize security risks and compatibility issues. 
* **Age of experiments:** Feature flags are effective for rapid experimentation, and are intended to be short-lived and cleaned up once they have served their purpose.

### Operational

* **Availability Service Level Objectives (SLOs):** Defines the target level of system availability, ensuring a reliable user experience. 
* **Latency Service Level Objectives (SLOs):** Defines the target levels of system responsiveness. 
* **Real User Monitoring (RUM) SLO:** For systems that include user-facing interactions, monitor the **actual**__ end-user experience and ensure that performance meets the defined objectives. 
* **Postmortem Service Level Agreement (SLA):** When incidents occur, ensure that lessons are learned while they are fresh in our minds, and improvements within a reasonable timeframe to not only prevent the recurrence of the same issue but also to improve the overall system as well.  

## Key Learnings
We've learned a __ton__ over the journey this past year, and continue to learn as we go forward.  Some of my key learnings include:

1. **It all starts with ownership**.  The old saying goes, "When everyone is an owner, no one is an owner".  One of the more challenging aspects of this journey was defining who was responsible for each system.  After nearly ten years of development, every system had transitioned between owners, and subject matter experts continued to be pulled into conversations years after code was written and transitioned to other teams.  It took significant effort to break this anti-pattern by assigning ownership of each system to a *team* instead of a *person*.  The majority of systems fell fairly cleanly into the domains of most teams, but there was a long tail of remaining systems where this assignment was far from clear and took significant time to align and negotiate who would be the responsible team.  At the end of the day, I found that it was much less important to have the **perfect** owner than to have __any__ owner.  There was not an expectation that owning a system made it a top priority, but it was incredibly valuable to have clarity of who was responsible for a system if/when changes needed to be made.  [We think of it more like stewardship than creating gatekeepers.](https://build.betterup.com/extreme-ownership-at-betterup/)
2. **Not all systems are created equal.**  We recognized that not all systems are created equal and introduced a tiered system to adjust expectations accordingly. This was particularly helpful for setting appropriate latency Service Level Objectives (SLOs) for specific systems.
3. **Where you shine the light, a path will follow.**  As soon as we began to make these scorecards visible across the company, we began to see change take place organically.  Even before we had set targets for each of the measures, many teams began to prioritize investments in moving.  The expectation was never set that "all systems must be at 100%".  Peter Drucker's famous quote: "You can't manage what you can't measure" was our inspiration to break down the ambiguous concept of "quality" into an *absolutely imperfect* set of measures to facilitate a starting point for more objective and strategic conversations.  

We're not "done".  This framework has provided an excellent starting point for iteration and future refinement of both the measures, and the dimensions.

## Implementation details

I believe the vast majority of the above article applies to any architecture, but incase it's interesting, I thought I'd share a few rough notes on what's under the hood for our environment which may have influenced our decisions.  

1. We have operated with a [Rails Majestic Monolith](https://signalvnoise.com/svn3/the-majestic-monolith/) for most of our history.  We have a few non-Ruby microservices in our ecosystem, which makes our environment closer to a [Citadel Architecture](https://blog.appsignal.com/2020/04/08/the-citadel-architecture-at-appsignal.html).  There were many conversations around how much microservices should be a part of our strategy going forward, and we made the opinionated decision to Modularlize the Monolith *instead* of migrating to Microservices.  We chose [Packwerk](https://github.com/Shopify/packwerk) for our ecosystem, which has some amazing features for incremental migration and dependency analysis, but I've also done this in the past with vanilla Rails engines.
2. You can certainly accomplish the system registry and scorecarding in spreadsheets, but why would you?  I can't say enough good things about our experience with [Cortex](https://app.getcortexapp.com/) (And no, I'm not being paid for this endorsement).  One of the killer features for me was the ability to have the scorecards updated in near realtime from API integrations in our CI/CD processes, as well as their ability to *pull* information from our sources of truth (eg: Datadog for performance SLOs)

