---
layout: post
title: "Recent Shard Developments"
date: 2008-07-06
comments: false
tags:
 - shard
 - opensource
---

It's been a busy few weeks now that [4th edition Dungeons and Dragons](http://dndinsider.com) is out the door!  I've spent the majority of my free time digging into the new rule books, and you can definitely call me a fan of the new system.  I'm very impressed by the streamlined game engine that avoids any "rule lawyering" and keeps the focus on having FUN!

To coincide with the 4th edition release, I've continued development on [shard](http://shard.codecrate.com).  My initial goals are to revamp the codebase and prepare for implementing as many 4th edition rules as possible. The shard-grid API is first up and there are a few really exciting features that are underway.  Of particular interest is a brand new path

finding algorithm that will dynamically build a path around obstacles

AND avoids difficult terrain whenever possible.

Some may question whether shard conflicts with the upcoming 4th edition digital tools, but I just can't stand to see tools created that only run on Windows.  Seriously, what self respecting D&D nerd willingly runs Windows!?  The fact that I run Linux at home and a Mac at work and neither of these platforms are supported means that I'm out of luck and will be looking to other options for running my digital D&D campaign.

In other news, the shard codebase has moved off of [java.net](http://shard.dev.java.net) and onto [github](http://github.com/wireframe/shard)!  This shouldn't be a big surprise since shard only used java.net as a source code repository, and CVS sucks major ass.  Git is the absolute bomb, and I'm very excited to see folks experiment and enhance shard in a much more open fashion by using git.  Hey, forking is good!

 

