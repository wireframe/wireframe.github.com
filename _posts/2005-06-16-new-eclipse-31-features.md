---
layout: post
title: "New Eclipse 3.1 Features"
date: 2005-06-16
comments: false
categories:
 - eclipse
---

Wow, I just installed eclipse 3.1 RC2 and there are a few new features that I think are pretty impressive. Performance is definately better than 3.0.x, but that is really just an improvement and not a new feature.

   
   
New Execute/Debug Shortcuts
   
In Eclipse 3.0.x, there was no shortcut defined for Run -> Debug As and Run -> Run As actions. I used to do Alt + R -> A to bring up the list of debug actions. For example, to launch my current class as a Junit Test, I would use do Alt + R -> A -> 4. This definately had it's issues since the list of options would change if additional eclipse plugins were installed.

   
Eclipse 3.1 has added two new shortcuts for launching and debugging code. Alt + Shift + X is the new shortcut to eXecute code without breakpoints. Alt + Shift + D can be used to Debug code with breakpoints enabled. Both of these commands trigger a small popup with options to launch the current code as. The new options are keyed by letter so that typing J will launch/debug Java applications, and T will launch/debug JUnit Tests. The popup is a bit difficult to see, but it does the job okay. These new shortcuts are much more convenient than the old navigation, and I'm very glad to see them included in Eclipse 3.1.

   
   
CVS Commit Sets
   
This is a major innovation in my opinion. It's absolutely essential for me, since I'm usually working on multiple unrelated features at the same time. It's great to be able to group my changes as I code instead of scratching my head days later trying to figure out what file is for what change. I've used several IDE's over the years and I have never seen any IDE with such complete CVS integration. Eclipse's CVS integration is one of the main reasons I haven't dug into NetBeans. I'm sure NetBean's CVS integration has gotten better, but it was nothing special when I used it last. And don't even get me started on JDeveloper's pathetic CVS integration. I hope that Eclipse will give integration with [subversion](http://subversion.tigris.org) as much time as their CVS support.

