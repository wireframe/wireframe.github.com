---
layout: post
title: "Intrusive Frameworks"
date: 2004-11-11
comments: false
tags:
 - java
---

The sad state of most development frameworks out there today (struts, webwork), is that they force you to code to a particular design. I'm not talking about extending their classes or implementing particular interfaces. I'm talking about how the frameworks' objects are constructed and populated.


Most developers sell themselves (and their projects) short by buying into application frameworks. I spent a great deal of time integrating web frameworks like webwork and struts into my applications with the promise it would make my life easier. A younger and more naive self didn't see a problem with having all of my actions with no-arg constructors and allowing the framwork to call setter methods to get data into my action. Now, after taking a break from these frameworks and using dependency injection (IoC type 3) for my applications, I wanted to continue using this pattern on my web framework code.


The "Good Citizen Pattern" has become my new pattern of choice. For those of you that don't know about this amazing pattern, it basically states that once an object is constructed it should be in a "good state". No additional calls are required for it to be usable. How can these frameworks help my application if they force me to use no-arg constructors?


Enter picocontainer and nanocontainer to save the day. Nanocontainer has an extension to support popular webframeworks like webwork, and it allows for my actions to be constructed with the objects needed to execute the actions. I am very impressed with the work thus far, and I'm sure it will continue to grow in popularity.


Aslak (one of the main developers of picocontainer) had a great [interview](http://theserverside.com/talks/videos/AslakHellesoy/interview.tss?bandwidth=dsl) over at theserverside where he stated that if frameworks become intrusive to our development (ie: like forcing no-arg constructors) the framework has failed it's goal. I agree wholeheartedly.

