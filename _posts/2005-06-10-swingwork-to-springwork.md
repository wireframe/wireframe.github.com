---
layout: post
title: "Swingwork to Springwork?"
date: 2005-06-10
comments: false
tags:
 - java
 - swingwork
 - spring
---

It seems that my early adoption of [nanocontainer](http://www.nanocontainer.org) may not have been the best move for [swingwork](http://swingwork.codecrate.com). There's very little development being done on nanocontainer and extremely poor community support. It's basically vaporware. I was orignally impressed with their [webwork2 integration](http://www.nanocontainer.org/NanoWar+WebWork) and thought it would be fairly trivial to port the functionality to xwork/swingwork. This was obviously a mistake...


I've been digging into the new [spring-rcp project](http://www.springframework.org/spring-rcp) recently and can only describe it as, ["Impressive...most impressive"](http://en.wikiquote.org/wiki/Darth_Vader). It's most powerful feature, in my opinion, is that Swing components can now benefit from dependency injection, and that was my original reason for integrating swingwork with nanocontainer. The project is still very early, and documentation is severely lacking, but they have a very good petclinic demo to dig through as an example. It takes a bit of work to get up and going, but there is a very active community and there are [extension projects](https://jide-springrcp.dev.java.net/) being developed to extend the core spring-rcp functionality.


[XWork can use Spring internally for true IoC](http://wiki.opensymphony.com/display/WW/WebWork+2+Spring+Integration), so I wonder if there would be any benefit to porting swingwork to use spring internally? Would swingwork really be any different than spring-rcp?


Right now, I'm totally sold on spring. The [core functionality provided by spring and picocontainer](http://www.picocontainer.org/Container+Comparison) are very similar, but the spring community is what really makes it worthwhile. An active community should definately be considered when adopting a new library/framework.


