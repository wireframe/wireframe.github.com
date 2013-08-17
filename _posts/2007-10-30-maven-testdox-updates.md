---
layout: post
title: "Maven TestDox Updates"
date: 2007-10-30
comments: false
categories:
 - java
 - testing
 - maven
---

Based on some recent [user suggestions](http://jira.codehaus.org/browse/MOJO-681), I've released a [new version of the maven testdox plugin](http://maven.codecrate.com/com/codecrate/maven/plugins/testdox-maven-plugin/).

   
   
Notable changes in this release are to try and make the report even more "human readable":

   
   
  - trim off package name for the test class name (ex: com.mysite.FooTest becomes Foo)

   
  - add spaces to the test class name (ex: FooBarTest becomes Foo bar)

   
   
   
Let me know if there are any other things that can be done to improve this plugin. Actually, if anyone out there would like to help make the HTML report look a bit more "spiffy", I could use the help!

   
   
See my [previous](http://jroller.com/wireframe/entry/running_code_doesn_t_lie)[blog](http://www.jroller.com/wireframe/entry/testdox_maven_plugin)[posts](http://www.jroller.com/wireframe/entry/official_testdox_maven_plugin_release) for the history of this plugin.

   
