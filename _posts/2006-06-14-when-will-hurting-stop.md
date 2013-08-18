---
layout: post
title: "When Will The Hurting Stop?"
date: 2006-06-14
comments: false
categories:
 - jsp
---

It's been a _long_time since I've [blogged about]({% post_url 2005-02-09-jsp-is-joke %}) [how much I **HATE** JSP]({% post_url 2004-10-22-two-faces-of-jsp %}). Today marks yet another day in the unending saga of pain and misery, and yet another reason this beast needs to be put to sleep.



I seriously just spent the past two days troubleshooting why my page shows one chunk of information with correct encoding, and another piece all jumbled. Of course, if I would have _known_it was an "encoding issue", it wouldn't have taken me so long, but that's not exactly the first place I checked since it worked for half the page. The "Standard" JSTL import tag isn't exactly a red flag for losing the current page encoding.



Just to be perfectly clear why this pisses me off. My webapp renders all pages with UTF-8 encoding (I have actually taken the time to verify that this is true for the entire application). The **problem** is when you use JSTL to import common JSP fragments into your page. JSP _conveniently_ drops the current page encoding when importing the fragment.



```
<c:import charEncoding="UTF-8" url="/WEB-INF/views/jsp/myPage.jsp" />
```



I've tried a whole lot of things over the past two days to solve this issue, and every one of them proved fruitless.


  - Data setup problem. Maybe it just looks bad for this one object?
  - Data conversion/truncation issue. If it's correct in the database, is it getting mangled somewhere else?
  - Wrong tags (struts, jstl, spring). Does JSTL have different behaviour than Struts tags?



Of course! It's a JSP problem! From this day forward, may this be a new starting point for all of my troubleshooting. Always blame JSP first, until proven otherwise.



Let this blog be a testiment to the suckyness of JSP. If you use JSP, stop using JSP. If you can't stop using JSP, consider tossing yourself from a balcony to avoid dealing with it's suckyness. If you wish to live, even though you work with JSP, make sure you set your encoding when using the JSTL import tag.





technorati tags:

[java](http://technorati.com/tag/java),

[jsp](http://technorati.com/tag/jsp)


