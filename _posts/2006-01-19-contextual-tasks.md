---
layout: post
title: "Contextual Tasks"
date: 2006-01-19
comments: false
categories:
 - java
 - shard
 - swing
---

Admit it, whether you're building a web based or a client application, building good GUI's is hard. I don't care if you're using a visual tool, or building them by hand, it's hard to build a user interface that is "user friendly". I haven't delved too much into the area of Application Usability, but I have picked up a few tricks here to help me build usable UI's.

   
   
Using contextual tasks is one way to present users with only "meaningful operations" when they need them. Windows XP popularized this technique with their file explorer by showing particular actions based on what the user had selected (ex: "Burn CD", "Move Files", etc). I only wish Microsoft wouldn't have been the one to popularize these contextual tasks...oh well.

   
   
Based on user feedback, I've integrated contextual tasks into [shard](http://shard.codecrate.com) to help users choose actions relevent to specific operations. The feedback I received was great, and it seemed like user's were genuinely confused about what they were supposed to do with the application. Hopefully, these contextual tasks will be a step in the right direction to help alleviate user confusion.

   
   
The Apache licensed [common components from l2fprod](http://common.l2fprod.com/index.php) has an excellent JTaskPane, and seemed like the obvious choise at first. Once I started digging into the l2fprod documentation though, several critical questions came up that have me wondering if it's really what I should be using.

   
   
First, "Where does the definitive JTaskPane live, and who's working on it?" [Pieces of the common l2fprod library have been integrated into SwingX](http://www.jroller.com/page/l2fprod/?anchor=r_i_p_jtaskpanegroup_hello), and [JDNC also has its own copy of the JTaskPane](https://jdnc-incubator.dev.java.net/documentation/l2fprod/). So, which is the "true" JTaskPane? SwingX and JDNC require JDK 1.5, and I hope the JTaskPane can remain compatible with JDK 1.4! What's truly baffling though, is that between these three projects, there is no official release of the component.

   
   
There's also the outstanding question of whether or not this code is still under development. There are [several missing features](https://jdnc-incubator.dev.java.net/documentation/l2fprod/JTaskPaneGroup-plans.html); the most obvious of which is that the JTaskPane does not integrate with custom look and feels!

   
   
technorati tags: [java](http://technorati.com/tag/java), [swing](http://technorati.com/tag/swing), [shard](http://technorati.com/tag/shard)

