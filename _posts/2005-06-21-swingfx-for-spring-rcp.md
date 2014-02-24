---
layout: post
title: "SwingFX for Spring-RCP"
date: 2005-06-21
comments: false
tags:
 - java
 - swing
 - spring
 - springrcp
---

I've been continually impressed by the Swing tricks that [Romain Guy has published on his blog](http://www.jroller.com/page/gfx). I'm convinced that Swing applications don't need to look as crappy as they commonly do. Since I've been digging into [Spring-RCP](http://www.springframework.org/spring-rcp) lately, I decided to try and bring some of Romain's innovations over to Spring. This would allow for simple applications to get going quickly and look great without having to re-implement all the nice to have features.


My first feature is an attempt to add support for [nice looking drop shadows on startup splash screens](http://www.jroller.com/page/gfx/?anchor=better_shadow). Romain's code was very easy to follow, and it was fairly trivial to port it to Spring-RCP. I've opened [a new issue on the Spring-RCP JIRA with a complete patch for this feature](http://opensource.atlassian.com/projects/spring/browse/RCP-126), and if anyone is interested in seeing this feature in Spring-RCP, please vote for it! My current implementaion could be improved to allow for applications to choose which splash screen to display (original or drop shadowed), so maybe I'll put some more time into this feature soon.


My next challange will be to add a new splash screen that tracks the progress of the Spring initialization. I find it quite annoying that there's currently no feedback to show the user how long startup will take. I opened this as a [seperate issue in JIRA](http://opensource.atlassian.com/projects/spring/browse/RCP-112), and will hopefully have something up and running soon.

