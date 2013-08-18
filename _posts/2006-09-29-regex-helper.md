---
layout: post
title: "RegEx Helper"
date: 2006-09-29
comments: false
categories:
 - java
 - eclipse
 - regex
---

I've always had difficulty with regular expressions. It's one area of programming that has always confused me.



I've been working to improve shard's support for complex dice expressions (ex: 1d8 + 2d6) and regular expressions have been the only way for me to get things to work. I took a stab at adding this feature a while back, but had to roll back the changes because it broke backwards compatability. It was just too hard to test. Sure, I've got pretty extensive unit tests, but there was no good way for me to test, in real-time, how my regular expression would perform against a given input.



Yesterday I tried out a pretty sweet eclipse plugin to provide real-time feedback for regular expressions, [QuickREx](http://www.bastian-bergerhoff.com/eclipse/features/web/QuickREx/toc.html). The plugin was great at providing real-time feedback for how my regular expression would perform against any number of test strings.



In less than an hour, I was able to finally put to rest [the longest outstanding feature request for shard](http://wiki.codecrate.com/display/SHA/2006/09/28/1d6+Plus+2d8+%3D+FUN)! Thank you QuickREx developers!
