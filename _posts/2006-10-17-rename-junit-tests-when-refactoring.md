---
layout: post
title: "Rename JUnit Tests When Refactoring"
date: 2006-10-17
comments: false
categories:
 - java
 - testing
---

Modern IDE's have been putting a lot of effort into improving their tools to support code refactoring. Eclipse is still the champ in my opinion, but [NetBeans seems to be making headway as well](http://refactoring.netbeans.org/). One refactoring feature I have yet to see implemented that would make my life a little easier would be automatically rename JUnit test classes when the class being tested is renamed.

   
   
Since there is no real metadata available to map a particular JUnit test to the class being tested, this feature would rely mainly on naming conventions, but I'm willing to bet that this would still work 90% of the time. If someone has a class named Dog, the unit test will nearly always be DogTest. You could also infer this by checking all classes that extend from TestCase that reference the renamed class. Again, this may not be perfect, but it's far from impossible.
   
   
   
I've requested [this feature for Eclipse](https://bugs.eclipse.org/bugs/show_bug.cgi?id=136880), but they've refused to add it (which is their right). So, if anyone is interested in this feature, please make your voice heard by voting for this issue. If that doesn't drum up enough support, it may be necessary to extend and replace the current refactoring plugin with a custom one. Anyone out there an Eclipse plugin expert? :)

   
   
technorati tags:[java](http://technorati.com/tag/java), [eclipse](http://technorati.com/tag/eclipse)

