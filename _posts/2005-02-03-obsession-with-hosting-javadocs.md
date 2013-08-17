---
layout: post
title: "Obsession with Hosting Javadocs"
date: 2005-02-03
comments: false
categories:
 - java
 - documentation
---

I don't exactly understand what the recent obsession is with hosting javadocs ([jdocs](http://www.jdocs.org), [koders](http://www.koders.com), [jsourcery](http://www.jsourcery.com/)). I do appreciate the fact that people are hosting them though, so that I don't need to go and download them all the time. But, it's irritating that every hosting site has different versions of the API. What we really need is for the artifact repository that Maven has invented to expand into hosting javadocs and source files. This would allow for archival of javadocs for each release, as well as the source files.



Example maven repository that holds artifacts/sources/javadocs:


```
/myrepo/myproject/
 /jars/myjar-1.0.jar
 /javadocs/1.0/index.html
 /sources/1.0/Foo.java
```


I know there's been talk about this functionality being done in Maven2, but I have yet to hear any concrete implementation details. As an added bonus, it would be great to have IDE integration to pull both javadocs and the reference sources when importing a new artifact.


With this recent jockying for who's got the best source/javadoc service, I think this is definately something the Java community needs.

