---
layout: post
title: "Maven2 Delivers"
date: 2005-11-11
comments: false
categories:
 - java
 - maven
---

First of all, I need to compliment the [Maven2](http://maven.apache.org) developers for delivering an amazing plugin architecture. I have recently been spending a good deal of time migrating our current Ant build to Maven2. We have a good deal of custom work done in our current build, so it's no trivial task. WSDL2Java and JDO bytecode enhancement are two major pieces that we need to support with Maven2, and it only took a couple hours to get these features working. Building custom Mojos was very straightforward, and I welcome the ability to program a plugin in straight Java. No XML or Jelly scripting required. Not bad!

   
   
I'd like to move [Shard](http://shard.codecrate.com) to use Maven2 as soon as possible, but there's no webstart deployment support yet. Since the Maven2 Mojos are so simple to write, I might whip one up and see if it can be contributed back to the Maven community.

