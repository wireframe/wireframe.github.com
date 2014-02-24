---
layout: post
title: "Test Driven Death"
date: 2007-02-14
comments: false
tags:
 - java
 - testing
---

It's just another form of TDD...



This may sound weird coming from me, but there are times when unit testing can do more harm than good. Writing test code incorrectly, can lead to code strangulation. I've seen this come up time and time again when dealing with a legacy codebase that was written cowboy with no unit tests, and now the team wants to try and insulate the codebase by adding unit tests. Needless to say, this is extremely difficult since code is rarely written to be testable unless tests already exist.



In the end, unit tests become extremely bloated and difficult to understand. What's the problem with this scenario? Isn't having the unit test actually a good thing? No. Not necessarily. Now that the codebase has built up a suite of brittle, bloated unit tests, the business code becomes even more difficult to change. Every change to the business layer has the potential to break the unit tests, since the tests were not first class citizens and are usually just hacked together. Each time a test breaks, developers must dig through the test to see if something is really wrong, or if the test just needs to be hacked some more to accommodate the recent changes.



Agile software development uses unit tests to facilitate and enable change. Having these tests allows for developers to work quickly without worrying about breaking functionality. Unit tests written after the fact actually inhibit change and slow down development as a whole.

