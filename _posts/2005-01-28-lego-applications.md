---
layout: post
title: "Lego Applications"
date: 2005-01-28
comments: false
tags:
 - java
 - design
---

There's a lot of hype surrounding the term Service Oriented Architecture (SOA). This development pattern has been around a long time, but for some reason, it's recently been brought into the lime light. While working on my last web application, I got to thinking that it would be very useful to consider all of the actions throughout the application as individual services. Common services would be things like: Login, ViewAccountInfo, DownloadStuff, etc. This mentality would lead to developing applications more like building with Legos. Each action can be linked from any number of other actions, and it's result can be directed to any number of results.


This leaves me wondering why something like this doesn't exist today? With Webwork being a prime example of this development style, why aren't there sets of reusable web actions distributed around the net? I can see great value in a jakarta-commons type of library for reusable services or prebuilt actions. All that would be required of the developer would be to plug in the workflow to link the services/actions together.

