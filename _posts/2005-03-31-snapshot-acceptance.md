---
layout: post
title: "SNAPSHOT acceptance"
date: 2005-03-31
comments: false
tags:
 - java
 - documentation
---

I just recently had a run-in with one of the XDoclet2 developers regarding the current hibernate plugin. Sure, [the issues I have raised](http://jira.codehaus.org/browse/XDP-42) are "Fixed in CVS", but the [SNAPSHOT jar](http://dist.codehaus.org/xdoclet-plugins/jars/xdoclet-plugin-hibernate-20050222.202417.jar) is still several weeks old and without the fixes. It's not so much a problem for me personally to download and build the jar, but I am more concerned with other developers on my projects. I use maven to resolve my project dependencies so that beginning developers do not have to worry about getting out of synch. This is especially useful in a continuous integration environment when SNAPSHOT builds can be published by other developers, and automatically picked up on the next local build.


I find it confusing that in this day and age, I still hear so many developers suggest for users to "Just download the code and build from CVS." With tools like [cruisecontrol](http://cruisecontrol.sf.net) and [maven](http://maven.apache.org) around that understand SNAPSHOT software, why aren't projects taking advantage of this!? When I look at a project and see they offer a SNAPSHOT version, I think to myself, "How nice. If I have any problems with this version, I will automatically pick up the latest changes when they are published." So, it is very misleading when SNAPSHOT versions of projects are anything but SNAPSHOTS. I think the bottom line is that if projects are not going to keep SNAPSHOT versions of their software uptodate, I don't think they should be using them.

