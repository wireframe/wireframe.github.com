---

title: "JSP Late Binding"
date: 2005-02-10
comments: false
tags:
 - java
 - jsp
---

My old friend JSP has caused me yet more pain. In my current project, I've been stung by the pervasive Late Binding issue with JSP. If I try and reference a method or class that doesn't exist on the page, I get a horrendous error message at runtime. This is the ultimate of inconveniences since it has escaped through my development/testing process. The bottom line is no matter how well I've architected my code to only place particular objects into JSP's context (using WebWork or any other web framework), every time I refactor or rename a method, I have to search through all of my JSP's for references to that method. This is a BIG problem when you've got a system with literally thousands of JSP's. It just doesn't scale, and slows down development to the point that people are afraid to refactor because code might break something. Definately a problem for "agile" development.


I think it's clear that JSP is not intended for large scale projects, and that it should be used only in "toy" or R&D applications. I've been happy with velocity, but it still has the same issues with late binding. Granted, it does a much nicer job than JSP by only printing out the unresolved expression instead of dumping a stack trace. So, maybe it's time I checked out Tapestry. After some initial searching and reading through the documentation, it definitely fits the bill, but the project does not seem nearly as active as other web frameworks.

