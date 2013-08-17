---
layout: post
title: "Prevent Caching of Javascript Files"
date: 2006-05-11
comments: false
categories:
 - performance
 - javascript
 - java
---

I spend the majority of my "real" work on a webapp that goes through weekly releases. The majority of javascript for the app was written inline, until recent UI designers started extracting javascript into external .js files. The rational for moving the javascript to separate files is to avoid pushing excess bytes across the wire with every request and allow for browsers to cache files.

   
   
Since the browser now caches these javascript files, we're now running into an interesting issue. When we roll out updates to the webapp, the new webpages may reference updated javascript, and the browser might not refresh it's reference to the javascript files. This is a thorn in developer's sides when trying to make local changes as well. Using the [Firefox web developer extension](http://chrispederick.com/work/webdeveloper/) to clear the browser's cached files is about the only thing that prevents me from pulling my hair out some days.

   
   
I've been searching for better solutions to prevent browser caching, and as far as I can tell, there are two possible solutions for this problem. One is to make the webapp force static file cache expiration by using a custom cache key. [Matt Raible](http://www.raibledesigns.com/page/rd/20030714#prevent_caching_of_javascript_and) has a pretty old post on this, and I've seen Wicket developers comment on a similar issue with AJAX images being cached by the browser. It seems like anytime a file is referenced by url and not truly static, we should always be adding "?rand=123123" to the url. It's not exactly elegant, but it's very explicit. The other option seems to rely on configuring your webserver (like Apache) to know when to refresh the files, but I'm pretty clueless when it comes to webserver configuration.

   
   
I'm starting to wonder why people have an issue with inline javascript...

