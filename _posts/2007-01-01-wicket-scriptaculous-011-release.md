---
layout: post
title: "Wicket Scriptaculous 0.1.1 Release"
date: 2007-01-01
comments: false
categories:
 - javascript
 - java
 - scriptaculous
 - wicket
---

I just published [an updated version of the Wicket/Scriptaculous Project](http://maven.codecrate.com/wicket-stuff/wicket-contrib-scriptaculous/0.1.1/wicket-contrib-scriptaculous-0.1.1.jar). This release is mainly a bugfix release, but there are a few notable changes.



### Effects API


This is the first release to offer a Java API to the scriptaculous Effects library. Here's an example of how it works today:



```java
new Effect.Highlight(this).toJavascript();
```



### AjaxEditInPlaceLabel Changes


The AjaxEditInPlaceLabel now has a few more extension points for really customizing it's functionality. Of particular interest is that you can now override what text is loaded for the user to edit. This allows for displaying different text than what is edited which can be useful if you want to customize formatting.



Man, I've really got to come up with some acronym or abbreviation for "The Wicket/Scriptaculous Project". It's too dang long to type all those characters. Maybe Wicktaculous? =)


