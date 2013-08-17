---
layout: post
title: "Maximized Abstraction By Dual Implementation"
date: 2004-07-09
comments: false
categories:
 - java
---

How can developing the same thing twice lead to a better design? I thought it sounded a bit crazy myself until I started on a project that did just that.

   
Charged with creating a search architecture for our system, I set out to integrate with a commercial solution. Along the way, I wanted to make sure that we were flexible enough to handle any system that we could plug into. The problem was how can you abstract out possible hooks for systems that may perform totally different? It doesn't make sense to spend time architecting a system with a series of hooks that "might" be needed X years from now with vendor Y. Well, my friends, that's where open source comes into play. While integrating with the commercial vendor, I designed a dual implementation to work with an open source search engine called [Lucene](http://jakarta.apache.org/lucene).

   
Designing a second implementation forced my design to be more flexible and to abstract out the common pieces between the two. It also led to a greater understanding of how search systems in general work, which would lead to easier integration with yet a different vendor. Putting the extra work into designing a second implementation upfront, led to a much smoother integration with BOTH systems, without one or the other feeling like a hack.

