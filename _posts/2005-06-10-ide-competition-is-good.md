---
layout: post
title: "IDE Competition is Good"
date: 2005-06-10
comments: false
categories:
 - java
 - swing
 - eclipse
 - swt
---

I've gone through my share of development IDE's. First it was JBuilder, then NetBeans, now Eclipse. There have been many reasons over the years for me to switch IDE's (price, features, speed), and I have stuck with Eclipse for the past two years because it "just works". At least it did work until I [migrated my development environment from Windows to Linux](http://www.jroller.com/page/wireframe/20050113#legal_beagle), and noticed that the performance of Eclipse went down the toilet. Seriously, I'm working with 1GB of RAM, SATA hard drive and a 2.4 Ghz P4. I just can't excuse the kind of performance I'm seeing.



This has caused me to rethink why I moved to Eclipse. I originally switched from NetBeans to Eclipse because NetBeans was sooo slooow, but now it seems like NetBeans may have finally stepped up to the plate to address their slowness. This [blog from a NetBean's developer](http://cld.blog-city.com/read/1126337.htm) provides some EXCELLENT insight into what NetBeans has done to improve their IDE. His view is biased (since he is a NetBeans developer), yet I found it very fair and informational. I think the ONLY reason that the NetBeans team has invested so much time into the area of performance is because of the threat of Eclipse. And in the end, competition is good for us developers. Each IDE pushes the envelope a bit further and forces the other IDE's to play catchup. The area of refactoring is one particular "hot topic" where Eclipse has offered a plethora of features that NetBeans is just beginning to roll out.



I can now faithfully say that my previous blog claiming that
[SWT was the wrong choice for Eclipse was correct]({% post_url 2004-07-27-no-jsr-for-swt %}).
Eclipse developers are now stuck improving their SWT client libraries across multiple hardware configurations, instead of improving their IDE and rich client support. Swing is NOT slow, and it has been proven time and time again to be the right direction for client side Java development. Sun has thrown a TON of resources at Swing, starting with JDK 1.4, and the work that is being done in this area is very encouraging. Has anyone out there seen the [OpenGL integration](http://today.java.net/pub/a/today/2004/11/12/graphics2d.html) for the [Java2D pipeline](http://weblogs.java.net/blog/campbell/archive/2005/03/strcrazy_improv_1.html)!?!? This is the kind of stuff that makes me excited to be working on Swing applications. If Swing or AWT is broken, as some people claim, PROVE IT! And now, with the next release of Java, we can actually [fix the problem](https://mustang.dev.java.net/collaborate.html), instead of investing resources into a seperate solution.

