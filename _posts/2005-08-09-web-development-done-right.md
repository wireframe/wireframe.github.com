---
layout: post
title: "Web Development Done Right"
date: 2005-08-09
comments: false
categories:
 - java
 - wicket
---

My [deep burning hate for JSP]({% post_url 2005-02-09-jsp-is-joke %}) will never change. It is absolutely the[most incompetent]({% post_url 2005-02-10-jsp-late-binding %}) Java web technology ever created. Yet, with all of my [bitching and complaining about JSP]({% post_url 2004-10-22-two-faces-of-jsp %}), I've been fairly quiet on what is a better solution. JSP has been the only option at my day-job, and to be honest, I have not deployed a full blown production application using a different web technology. I've used plenty of other frameworks internally or for open-source projects, but JSP is where I've spent most of my time (not by choice).



[Velocity](http://jakarta.apache.org/velocity) is quite possibly the most obvious choise for replacing JSP. It's easy to pick up and is very similar to JSP in most cases. Velocity has created a certain niche as a tool to be used for user customization. [Confluence](http://atlassian.com/software/confluence/) and [Roller](http://www.rollerweblogger.org/page/project) are examples of how Velocity can be used for user customization of application templates. Velocity is also great for really enforcing MVC architecture (especially when using something like WebWork), but it doesn't solve all of my problems.



[Tapestry](http://jakarta.apache.org/tapestry/) has been in my sights for quite a while, but I haven't been able to take the plunge to [Unlearn what I have Learned](http://en.wikiquote.org/wiki/Yoda). I've gone through examples, tutorials and javadocs, but there's just something about Tapestry that doesn't quite feel right. Maybe the tedious xml that's needed; or maybe it's requirement to have abstract classes so that Tapestry can auto-proxy your classes. It just seems like I have to jump through so many hoops to get up and going.



And now there's [Wicket](http://wicket.sf.net). Talk about a mind blowing experience, it literally took me ten minutes to have a sample application up and running! The Wicket API is very Swing like, which was a welcome change for me, and allowed for a very familiar development experience. There is even an extension that allows for direct use of a Swing TreeModel. There are so many things that I like about this framework, but here's a quick list thus far:



  1. Component framework allows for building a library of reusable building blocks.


  2. Example applications are able to run out-of-the-box. The embedded Jetty instance makes startup a snap, and allows for you to start tweaking the example apps to really play around with the API.


  3. NO XML!





On the downside, Wicket's integration with Spring is still lacking. Most current examples that perform database operations use static Hibernate queries, and that's definately something I want to avoid. It shouldn't be too difficult to create a Spring PageFactory to allow for dependency injection into the Wicket page objects, hopefully.

