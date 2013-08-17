---
layout: post
title: "Say It. Do It. Prove It!"
date: 2008-04-30
comments: false
categories:
 - process
 - documentation
 - testing
---

There are lots of software development methodologies. I've voiced my opinions over the years on how to create great software, and these three small statements sum up a pretty large part of my software development philosophy.

   
   
Say it.
-------

   
   
Document your code. Standard javadocs are fine. Stick to method/class level docs with none of that body comment crap. Give a humane overview of what you're trying to accomplish with the block of code. This is also a great place to drop references to external documentation which may back up why a certain approach is being used.

   
   
Do it.
------

   
Write your code. Keep it clean and concise. Only do what you said you're going to do and nothing more.

   
   
Prove it.
---------

   
Unit tests. I don't believe you did what you said you were going to do without tests.

   
   
Traditional TDD heavily emphasizes writing unit tests which *can* be used as a form of documenting what you're going to do, but I still find it valuable to have some level of documentation within the code itself (especially for interfaces).

   
   
Honestly, if more developers would just keep to these simple tips, we'd be a lot better off.

