---
layout: post
title: "Storing JARS in CVS"
date: 2004-07-09
comments: false
categories:
 - java
---

I'm an avid user of Maven, and I've been baffled lately about the problems people have with pulling jars out of CVS and putting them into a maven repository. Maven gives us developers an elegant way of handling dependencies, and I keep hearing whining about "why change it if it isn't broken". The remote repository makes it extremely easy to share dependencies between projects without needing 4 copies on the filesystem. I have yet to see a single Ant build system do that (I should know since I spent over a year maintaining our old Ant build system). It's really no different than the common practice of high traffic websites splitting thier images onto a different server to allow their codebase to change without re-releasing images.

   
Also, if you're working with CVS, you are inherently working with branches. It makes absolutely no sense to have binary jars checked into each branch of a project. The size of a "lib" directory can grow so quickly on large projects, that the time it takes to checkout code borders on the side of craziness. This makes it nearly impossible to do agile development when, by the time you have the code checked out, a new branch has ben cut. =)

   
The last problem I see mainly has to do with Ant, but surfaces in this type of environment. "Library Rot" occurs when your "lib" directory contains a whole slew of jars, and you don't know what's used in your project. This is because a typical Ant build system builds the compile classpath using "lib/*.jar", and so the lib directory continues to grow because no developer knows if something is needed or used. The only way to tell if something IS used, is to delete it and try to rebuild.

   
Yes, change is painful, but in this case, change is good.

