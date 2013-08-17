---
layout: post
title: "Spring-RCP/JTaskPane Promoted To L2FProd"
date: 2006-02-20
comments: false
categories:
 - java
 - spring
 - springrcp
---

The common Swing components created by [l2fprod.com](http://common.l2fprod.com) just accepted the code I wrote recently to [integrate Spring-RCP with JTaskPane](http://jroller.com/page/wireframe/?anchor=integrate_jtaskpane_with_spring_rcp).

   
   
I was [contacted last week by Frederic](http://forum.springframework.org/showthread.php?t=21867), the core developer for the l2fprod project, to try and collaborate on the spring-rcp integration. All of my code was written under the ASL 2.0 license, so he was able to [migrate my code directly into his project](https://l2fprod-common.dev.java.net/source/browse/l2fprod-common/src/java/springrcp/com/l2fprod/common/springrcp/) really quickly.

   
   
Since Frederic is much more knowledgable about the JTaskPane component, he was able to add a few new features as well. He also published a [new tutorial on how to use the components](http://common.l2fprod.com/articles/taskpane-springrcp.php), which should be a big help to get people up and going.

   
   
Last night, I pulled down the [newest snapshot](http://common.l2fprod.com/download.php) of the common l2fprod components, and integrated it into [shard](http://shard.codecrate.com). I only had to change the class imports and the spring xml file to use the new components. It was almost too easy...

   
   
This is a big win in my book. I removed my custom code, and having it published by the l2fprod project, there's a much greater chance that others will use this code. It just goes to show how powerful opensource development can really be.

   
   
   
technorati tags:
   
[java](http://technorati.com/tag/java),
   
[swing](http://technorati.com/tag/swing),
   
[spring](http://technorati.com/tag/spring),
   
[rcp](http://technorati.com/tag/rcp),
   
[shard](http://technorati.com/tag/shard)
   
   
