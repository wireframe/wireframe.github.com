---
layout: post
title: "TestDox Maven Plugin"
date: 2007-03-06
comments: false
categories:
 - java
 - testing
---

You may see a new maven2 plugin showing up soon at the [Codehaus Mojo project sandbox](http://mojo.codehaus.org/). I just submitted a new maven2 plugin for generating an HTML report using [TestDox](http://agiledox.sourceforge.net/). This should make a great accessory report to the existing maven junit reports, and should be more usable by non-techie folks.

   
   
I've [written about TestDox in the past](http://jroller.com/page/wireframe?entry=running_code_doesn_t_lie), and I finally got off my lazy ass because it has tremendous value for me. It actually was pretty painless to create, and there's definitely opportunities for improvements, but hey, it works.

   
   
Here's an example of what the output will be. The only difference is that the report will be fully integrated with the maven generated site with all the fancy links and menus.

   
   
### TestDoxFormatter

   
   
  - Pretty class name removes test suffix

   
  - Pretty method name removes test prefix

   
   
   
Enjoy, and make sure to let me know what would make this plugin more useful.

