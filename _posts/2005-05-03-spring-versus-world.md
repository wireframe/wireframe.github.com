---
layout: post
title: "Spring Versus The World"
date: 2005-05-03
comments: false
tags:
 - java
 - spring
---

I sometimes find it hard to make it through some of the postings on [The Server Side](http://www.theserverside.com). So many of the articles spiral into some kind of religious debate over .NET versus J2EE, or Tapestry versus JSF. It's as bad as trying to read something on [Slashdot](http://www.slashdot.org).


Surprisingly, there was an [article posted last week](http://www.theserverside.com/news/thread.tss?thread_id=33576), that was actually informative in the whole web framework debate. A pair of developers entered a [rapid application development contest](<br />http://www.xebia.com/oth_publications_java_with_spring_just_as_productive_as_4gl.html) where every pair of developers used a different set of tools. They entered the competition using only opensource libraries at their disposal against J2EE, .NET and a slew of other development environments. I'm curious to know if any group of developers used Ruby on Rails? Instead of simply posting meaningless productivity benchmarks and claiming that a particular framework/toolset/IDE improves application development, this kind of competition is a real life use case. The opensource developer's toolset consisted of:


  - [Spring Framework](http://www.springframework.org)


  - [Eclipse IDE](http://www.eclipse.org)with [Eclipse Web Tools Platform](http://eclipse.org/webtools/index.html)


  - [Hibernate](http://www.hibernate.org)


  - Hibernate Synchronizer Eclipse plugin


  - [Tomcat](http://jakarta.apache.org/tomcat)


  - [MySQL](http://www.mysql.org)




One of the most interesting pieces in this article is that the Spring developers claim their biggest pain point was developing the user interface. There's no doubt in my mind that the root of this problem is that they decided to use JSP as their view technology. [I've said it once]({% post_url 2004-10-22-two-faces-of-jsp %}), and [I'll say it again]({% post_url 2005-02-10-jsp-late-binding %}), [JSP is the bane of Java web technologies]({% post_url 2005-02-09-jsp-is-joke %}). Some insightful posters at The Server Side commented that the developers could have easily improved their productivity by using a different view technology like Tapestry/Spindle or Wicket. I also question their use of the Eclipse Web Tools plugin for web development just because it's still very early. I personally tried out the plugin and didn't find it entirely useful or functional yet.


Unfortunately, the Spring developers placed in third, within 10% of the Oracle Toolset. I find it very encouraging to know that I have the best frameworks and tools at my fingertips that allow me to be more than competitive against the [big, bloated, expensive, commercial tools]({% post_url 2004-07-23-oracle-toy-store %}). And now I can see where Oracle gets their [pathetic claims of being 30% faster for developing web applications]({% post_url 2004-07-12-oracle-foolset %}). Developing with Spring and a standard WYSIWYG HTML editor I can develop just as fast, and create web applications a hell of a lot better.

