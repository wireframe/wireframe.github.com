---
layout: post
title: "More Dynamic For Your Static"
date: 2006-06-13
comments: false
tags:
 - javascript
---

I've been undergoing an experiment to build [my own website](http://ryan.codecrate.com), and I've come to realize the importance of Javascript for next generation websites. I'm predicting that there will be a significant paradigm shift where websites will move away from using dynamic content hosted on Java application servers and instead use remote services exposed through Javascript API's (which might in turn be hosted on Java app servers).



This is quite a radical change for me. I've been hosting websites for years using application servers even if the website only needed simple header/footer/gutter wrapping. It took a bit of work, but here's how I took the jump from dynamic sites to static.



### Solving Header/Footer/Gutter



Every website I've built has required some form of standard navigation decoration. I've used [sitemesh](http://www.opensymphony.com/sitemesh/) for nearly all of my projects, and it is by far the best solution out there for dynamic page decoration. Obviously, without an application server, something needed to change, and luckily I ran across a tool called [staticmesh](http://www.pols.co.uk/downloads/static-mesh/). Staticmesh is built ontop of sitemesh for offline website generation. So, instead of dynamically decorating pages at request time, I use site mesh to decorate pages at "build time". I whipped up a quick little Maven2 plugin in about 10 minutes, and just like that, I had a solution for 90% of my application server needs. I can share my Maven2 plugin if anyone is interested...



### Get Dynamic!



Once I had a working "plain old static site", I wasn't expecting much more and this is where Javascript really began to surprise me. There's a ton of excellent website widgets that can be dropped onto a static site to really liven it up. I was especially interested in integrating a picture gallery and some form of rss aggregator onto my site.



I've been an [avid user](http://www.flickr.com/photos/wireframe) of [flickr](http://www.flickr.com) for quite some time, and their Javascript solution works right out of the box. I'm not a big fan of their table based layout for the pictures, but it get's the job done, and has decent CSS usage to customize the look.



Next on my list was trying to integrate rss feeds. After several nights searching around, the best I had come up with was [Javascirpt integration that relied on a PHP server to stream the RSS](http://www.rss-to-javascript.com/). This really didn't interest me since I'm trying to build a site that's not dependent on an application server, and that's when I discovered the magic of Google. [Google Reader](http://reader.google.com) is an online blog aggregator that exposes it's feeds to a Javascript API. I've been using Google Reader as an "official" replacement for bloglines for a couple monthes now, but I didn't know about their Javascript API until recently.



That took care of my current needs, but I was definately excited to see a whole slew of other Javascript widgets that could be integrated into purely static sites. [Right Cart looks extremely promising for integrating a complete shopping expreience into a static website, and I may look into this again later if I [start selling CD's online](http://ryan.codecrate.com/music/). The [dojo toolkit](http://dojotoolkit.org/) also has some great examples of Javascript widgets for things like a complete image slideshow too.



Changing from a dynamic hosted site to a purely static site takes some work but so far, it's been well worth the work. And it's definitely taught me that, "Not all roads lead to Java". Maybe all roads lead to Javascript?
