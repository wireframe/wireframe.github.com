---
title: "Graph Visualizer of Team Topology"
tags:
- team topology
- open source
---

Over the past 10 years of scaling engineering teams, one of the most critical time intensive and important topics has been formation of our teams, and I've found the ability to visualize team formations and interactions incredibly powerful for identifying opportunities for improvement, dependencies, etc.

The framework introduced in [Team Topologies: Organizing Business and Technology Teams for Fast Flow](https://www.amazon.com/Team-Topologies-Organizing-Business-Technology-ebook/dp/B09JWT9S4D) does a fantastic job of capturing these essential elements of team formations and has been my go-to book recommendation for other engineering leaders over the years.

<img src="/images/2025-03-12-legend.png">

The visualization format used in the book is fairly effective for laying out the team formations, but after putting it into real-world usage with a fairly large organization (100+ engineers and 15+ teams), I ran into a few specific shortcomings:

1. Platform teams are a common dependency across multiple teams, and the interaction visualization got messy very quickly.
2. Facilitating and Collaboration interactions are constrained to only map to a single team. While this may be a strong recommendation, it is a limitation that prevented rendering the reality of teams with multiple interactions.
3. Missing critical information around "size" of teams. One of the most common bits of information when discussing org design is the "amount of investment" in each value stream. This is easily visualizable.

After some ideation and experimentation, I found visualization via a graph network to hit the sweet spot to showcase the full spectrum of teams + interactions + amount of investment in each team.

<img src="/images/2025-03-12-graph.png">

With just an hour hacking away (thanks to rapid prototyping support via [Cursor](https://www.cursor.com/)), I was able to whip up a proof of concept app that "scratched my itch" and is extensible to support any permutation of teams via a simple JSON configuration. [The code is 100% opensource](https://github.com/wireframe/team-topology-graph), and if you're interested to give it a run, I welcome any feedback for improvements!