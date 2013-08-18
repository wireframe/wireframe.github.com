---
layout: post
title: "Oracle Toy Store"
date: 2004-07-23
comments: false
categories:
 - java
 - oracle
---

I found it somewhat ironic that the same day I posted my blog somewhat blasting Oracle's J2EE offerings, TheServerSide posted an [announcement](http://theserverside.com/news/thread.tss?thread_id=27179) that Oracle has released a new demo application called "Toy Store". There were quite a few very critical and insightful comments made by developers, and it seems that I am not alone in my frustration with Oracle's Toolset!



My own critique of the "Toy Store" would follow a few of the other comments posted:


  1. Code Generation is excessively abused! See my previous blog
  [why code templating should be used instead of code generation]({% post_url 2004-01-05-code-templates-vs-code-generation %}).


  2. XML is not code. The argument that XML is used to CONFIGURE the code is pretty ridiculous if it takes you just as much XML as Java to configure the Java. This tells me that there is a severe design flaw in the application. How is it possible to even refactor the application, when you are so tightly bound to these configuration files? Why not look into something much more elegant like AOP?


  3. Oracle's documentation and communication is absolutely horrible. Seems like the comment that [open sourcing Java would lead to bad documentation](http://weblogs.java.net/pub/wlg/1647)is absolutely moot when you have terrible documentation comming from a commercial company. Has anyone out there tried to use their [OTN](http://otn.oracle.com)!?!


  4. It appears that there is [one sole person](http://radio.weblogs.com/0118231/)championing knowledge of how the Oracle Tool Suite is intended to work. Maybe this is because Oracle's own documentation is so poor that no one else has figured it out yet (including their own consultants).

