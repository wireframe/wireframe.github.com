---
layout: post
title: "Down with BI systems"
date: 2003-12-30
comments: false
categories:
 - java
---

What the heck is the obsession with overpriced fancy toys called Business Information Systems? In the most general sense, they are reporting engines. Some have admiditly nice features, but none that I can justify 10,000 bucks for. Case and point is Oracle's Reporting engine. I've sat through enough demo's to see the thing in action and see my colleague's jaws drop to the floor, regardless of the price tag. It doesn't take a genius to realize that a "comparable" solution could be written from scratch in about a month without the feature bloat. I have done so myself, but without the little extras that the big names throw in, it turns no heads.

   
   
I see a genuine need in the open source community for a high performance, full featured reporting engine. Taking a look at the current offerings, I see a lot of potential. [JasperReports](http://jasperreports.sf.net) is an EXCELLENT reporting engine, and [JFreeChart](http://www.jfree.org) has the data graphing down to a "T". [OpenReports](http://oreports.sf.net) attempts bring these reports to the web tier, and I think it does a fairly good job, but there is more work to be done. Here is a list of features I need to see in a reporting solution:

   
   
  1. Display the buisness data in different report/chart combinations. Summarizing data into graphs is EXTREMELY big selling point. [Devx has a great article](http://www.devx.com/xml/Article/7956/1954)on how to do this, and all that would need to be done would to have the report generated, then transform the XML report into a chartable dataset.
  2. Caching. Reports can be data hogs and take too much time to build. Each report should be configured for a length of time to be cached. If a user queries the report with the same parameters, pull from the cache instead of requerying.
  3. Scheduling and delivery. Again, long running reports are normally scheduled for "non business hours", then either saved in cache, or delivered (ex: by email) to users.

   
   
I have started a project over at java.net called [RIVA](http://riva.dev.java.net) to address a few of these problems, and hopefully collaborate with other projects to come up with some kind of solution.

