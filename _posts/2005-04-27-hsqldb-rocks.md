---
layout: post
title: "HSQLDB Rocks"
date: 2005-04-27
comments: false
tags:
 - java
 - database
---

After walking down the Test Driven Development path for the past year or so, I adopted the usual philosophy that unit tests should not interact with any external systems (webservices, databases, etc). This was all well and good for unit tests, but I have come across a number of instances where unit tests fall short of full code coverage. I have recently found a HUGE amout of value in other forms of software testing. Specifically, I have been implementing acceptance tests using the [FIT framework](http://fit.c2.com/), and these tests run with a full blown application instance (database, application server, etc).


This got me thinking that it would be very nice to use some kind of automated integration tests to verify that my Hibernate HQL was correctly formed. I definitely didn't want to go down the path of installing something like [MySQL](http://www.mysql.com) just to run these tests, and I didn't want to have to rely on some external database being up and running all the time. [HSQLDB](http://hsqldb.sourceforge.net/) is the perfect solution for this scenario. There's even a built in [Swing Database Manager](http://hsqldb.sourceforge.net/doc/guide/apf.html) that can view the contents of this scrap database for full debugging (org.hsqldb.util.DatabaseManagerSwing).


I should say that none of this would be possible without using Hibernate's HSQLDB dialect. It's pretty amazing that I can develop and run integration tests against an extremely lightweight embedded database and deploy the code to run against a different (more production like) database by only changing the configuration file.

