---
layout: post
title: "Spring Bloat"
date: 2005-02-19
comments: false
tags:
 - java
 - spring
---

I was severely disappointed yesterday to see how bloated Spring's library is with unnecessary libraries. Sure Hibernate support is great, but why have it included as part of the core library? I use JDO currently, and so it doesn't make sense to have the extra jars bloating the size of my webapp. It certainly isn't difficult to componitize your application and distribute modules as seperate jars. Just take a look at [swingwork](http://swingwork.codecrate.com) and [shard](http://shard.codecrate.com) as examples for how to componitize your API so that user's don't need to download 50 packages just to get your stuff up and going. I find it disturbing that it's acceptable for a lightweight framework to come as a [27MB download](http://prdownloads.sourceforge.net/springframework/spring-framework-1.1.4-with-dependencies.zip?download)!


Here's a short list of all the junk thrown into the "default" spring package:



  - hibernate


  - jdo


  - a ton of jakarta-commons libraries


  - jsf


  - log4j


  - quartz


  - velocity


  - jakarta-poi


  - a whole lot more...


