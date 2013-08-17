---
layout: post
title: "XDoclet2 Downfall"
date: 2005-03-05
comments: false
categories:
 - java
 - documentation
---

I've nearly reached the breaking point trying to adopt XDoclet2 and I find it ridiculous that [it's developers keep pushing people to migrate to XDoclet2 when it is so unusable](http://marc.theaimsgroup.com/?l=turbine-maven-user&m=110977713323716&w=2). It's now been over 3 weeks and I have yet to get my extremely simple hibernate project up and going. So far, I have filed four bugs with the XDoclet2 Plugin project and each one has been closed with the assurance "It should work now" (see issues [XDT-42](http://jira.codehaus.org/browse/XDP-42), [XDT-43](http://jira.codehaus.org/browse/XDP-43), [XDT-44](http://jira.codehaus.org/browse/XDP-44) and [XDT-45](http://jira.codehaus.org/browse/XDP-45) for the issues I've files so far). These problems are such show-stoppers that a single integration or acceptance test would have blown up in the developer's faces. I'm sick and tired of being the guinea pig for their pathetic plugins. You would think the developers would take the extra twenty seconds and actually test their plugins, especially since one on the touted features of XDoclet2 is it's "testability".

   
To think, I was a BIG supporter of the original XDoclet and did the majority of my J2EE development with it's help. Now, I see that XDoclet (and similar code-generation tools) should be avoided at all costs. It's a tool that hides the greater underlying problem; if you NEED thousands of lines of XML generated for you by a tool, it's time to look for some other tools that don't require thousands of lines of XML.

   
I have now seriously considered just handcoding my hibernate files because although it is painfully slow, it is 100% reliable. It's a sad day indeed...

