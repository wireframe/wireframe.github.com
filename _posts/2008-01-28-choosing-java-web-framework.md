---
layout: post
title: "Choosing a Java Web Framework"
date: 2008-01-28
comments: false
tags:
 - java
 - wicket
---

Last week I was asked to give a presentation comparing Java web frameworks for an upcoming project. This is very similar to the [a presentation given by Matt Raible](http://raibledesigns.com/rd/entry/comparing_jvm_web_frameworks_presentation), so I started there to see what he had to say. He's obviously done a lot of work with the appfuse project which supports a pretty impressive number of frameworks out of the box. I'd highly recommend folks checkout the documentation he's done over the years and even [watch his presentation from past conferences](http://parleys.com/display/PARLEYS/Comparing+Java+Web+Frameworks?showComments=true).



After going through his [slides](http://static.raibledesigns.com/repository/presentations/ComparingJavaWebFrameworks-ApacheConUS2007.pdf) and [presentations](http://static.raibledesigns.com/repository/presentations/ComparingJVMWebFrameworks-ApacheConUS2007.pdf) there are a few comments I'd like to toss in. For the most part, Matt is a pretty objective reviewer of the frameworks, but his bias is definitely from the point of view of a web developer and not a Java developer. There's nothing wrong with that, but some of the points he makes aren't really valid for me as a straight up Java developer. The best point made in is presentation is, **Use whatever tool is right for your project/team**. There is no **one** web framework that will be best for all projects.



Before plunging into the various frameworks, a very important decision must be made. The most often overlooked question when choosing a web framework is what programming paradigm are you looking for? Do you want a component or an action based framework? Choosing between component or action frameworks is as important as choosing what language you'll use. I would personally make this decision before choosing the actual framework. Since most developers don't know the difference between the two, here's a brief intro:



Action frameworks focus mainly on request/response processing. They tend to have a lower barrier to entry and are more simplistic than component oriented frameworks. Action frameworks tend to be very procedural with little reuse of code/components or object oriented design (ever tried to reuse components with JSP?). Even the coveted Ruby on Rails falls into this category (though it is a fantastic action framework).



Component frameworks remove the restriction of basic "request/response" processing and focus on object oriented web design. It takes a considerable mind shift to work with component frameworks, but the benefits include developing object oriented applications where components/widgets can be reused across the application very easily. Developers strong in Java and Object Oriented design will have an easier time picking up Component frameworks while developers more familiar with procedural or scripting frameworks will take some time adjusting.



And now, the abbreviated version of my presentation...



### Action frameworks



  - Struts...sucks...that includes Struts2


  - Spring MVC...would you like some Java with your xml?




### Component frameworks



  - JSF...you've got to be kidding me


  - Wicket...ROXORS!




It's just that simple! =) This version of the presentation was a big hit, but if you need more explanation, here you go...



Action Frameworks
=================



[Spring MVC](http://static.springframework.org/spring/docs/2.0.x/reference/mvc.html)
----------



Spring MVC is a Model2/Action web framework built on top of the popular spring framework library. It builds on the standard concepts of Models, Views, and Controllers and adds a well defined lifecycle for binding, validation, etc.



Many parts of the framework are pluggable. You can choose from several different view layers (JSP, Velocity, Freemarker, etc). The framework is sometimes too flexible and causes confusion on how to best accomplish a task.



Lots of configuration in xml is necessary. Even with the new annotation support, you'll still need to feel comfortable with xml to configure many parts of the system.



Developers will need to understand core Java concepts such as Inversion of Control and Dependency Injection in order to be productive with Spring MVC (or Spring in general).



Spring MVC is a bare bones web framework which is very customizable, but comes with very little out of the box. Everything from security to redirect-after-post to ajax must be built within your webapp.



NOTE: Every web framework offers integration with spring, so it is not necessary to use Spring MVC in order to use spring for your business/service layer.



[Struts2](http://struts.apache.org)
-------



Struts2 is another Model2 web framework that has been around much longer than Spring MVC. It's an evolution of the legacy struts framework and integrated with the popular WebWork framework. It is more mature than Spring MVC with a larger community of developers and users.



The Struts2 API is fairly complex since they have abstractions in place to mask working with HTTP specific implementations. It takes quite a bit of time to learn the "Struts2 way" (ex: interceptors). Finding documentation and user support is frustrating since there is still such a large community around the legacy Struts1 framework.



Requires lots of configuration using either annotations or xml files.



Quite a few user contributed plugins of varying quality.



Able to work with a variety of view technologies (JSP, Velocity, Freemarker). Provides a number of utility tags to output common constructs (form inputs, etc). The default rendering of the tags can be customized to fit the look/layout you need.



Very powerful library used for rendering view layer (OGNL) can be useful, but has very poor feedback so if anything goes wrong, you'll have extreme difficulty figuring it out. Wicket used to use OGNL and ditched it in favor of a simpler/easier to understand custom library.



Component Frameworks
====================



JSF
---



JSF is the "Standard" component framework created by the JCP and distributed as part of Java EE systems. Using JSF requires running a full-blown Java application server, and can not be run on standard servlet containers without extra work.



Although the JSF design is a standard, there is no standard implementation. There are several implementations of the standard, each with strengths/weaknesses. For example, Seam is a particular JSF implementation that has gained a lot of traction recently, but building a "Seam" application is not the same as building a "JSF" application. Building to a Standard API is intended to allow for portability between implementations, but that is far from reality. Since you end up building to a specific implementation, why build with a standard at all?



Considerable ramp up time and tool support is a requirement to be productive. Instead of just working with standard Java and HTML, you end up locking into a particular toolset. The tools get you up and running very quickly, but you pay for the convenience since you can only build what the tool supports and they restrict how much you can do with the internal framework.



Simple things are definitely not simple. JSF relies on tools to do all of the grunt work instead of having simple conventions or sensible defaults. JSP's become cluttered and unreadable very quickly with all of the custom tags required. Design of JSF is targeted for internal/intranet applications and does not easily support web security or bookmarkable urls because of this.



Releases are far and few between. Since JSF is designed by committees, it takes an extremely long time to agree upon new features. For example, AJAX took the world by storm over the past few years and all of the other major web frameworks were able to evolve to accommodate AJAX, while JSF still lags behind.



User community is very absent. Commercial JSF vendors are the only people actually using (and selling) this stuff. Very few open source plugins/components available.



[Wicket](http://wicket.apache.org)
------



Wicket is a component based framework with an API more similar to building Swing applications than traditional Model2 web applications. It has a much smaller learning curve than other component based frameworks (ex: JSF, Tapestry).



Wicket is the only framework that provides for a true separation of concerns where the view layer is standard HTML and behavior/logic is captured in Java. This allows for a team of web designers to use standard WYSIWYG HTML editors to build the UI without any knowledge of programming languages or tag library syntax. This is in stark contrast to all other frameworks that require lots of custom tags and logic to litter the view layer causing the page to not be previewable outside a running application.



Wicket is the most performant web framework out of the box when it comes to handling web resources. By default, all javascript, css, and images are compressed, minified, and cached by browsers. Downloading and rendering static resources account for ~80% of the end user experience which makes this feature very important for building high volume, scalable sites. Wicket is also extremely secure by default since it uses server side session management for navigating around the site, but it is still very easy to create stateless pages and bookmarkable urls.



Out of the box Ajax support makes it easy to build Web 2.0 applications.



Wicket has an extremely active community. Questions asked on the mailing lists are answered by core developers within minutes. It is now a top level project at Apache, and has seen a huge increase in popularity with the recent 1.3 release. There are a large number of user contributed projects (wicket-extensions, wicketstuff) that provide extensions and integrations with other libraries (hibernate, spring, scriptaculous, rss/atom generation, etc).



It's FUN! Seriously, it took me ten minutes to build my first webapp with wicket. Try it and see for yourself.



DISCLAIMER: I'm a contributor to several wicketstuff projects (scriptaculous, hibernate, rss). This may show my bias, but it also shows how easy (and fun) it is to create custom components.


