---
layout: post
title: "Is It REALLY Empty?"
date: 2006-07-19
comments: false
tags:
 - jsp
---

JSP is so damn ghetto.



Who would have thought that JSP is so incredibly incompetent that it can screw up one of the easiest operations? All I want to do is determine whether or not a collection is empty. Simple right? Well, obviously this is something too complex to be addressed by JSP.



So, here's my super simple usecase that **actually** works. The JSP is pretty straight forward.


```html
&lt;c:if test="${not empty myObject.entries}"&gt;
  The Collection is Not Empty!  The world is coming to an end!
&lt;/c:if&gt;
```



And there's nothing special about my object.


```java
public class MyObject {
  private Collection entries = new ArrayList();

  public Collection getEntries() {
    return entries;
  }
}
```



Now, guess what happens when I want my entries to ensure only one entry is added. You'd expect to change the colleciton from an ArrayList to a HashSet, and you'd be good to go right? Well, you'd be dead wrong.


```java
public class MyObject {
  private Collection entries = new HashSet();

  public Collection getEntries() {
    return entries;
  }

}
```



For some unknown reason, JSTL can not work with sets to determine empty collections. Lists are fine, and even Maps are supported, but not Sets. Way to go JSTL. You've proven yet again that JSP is worthless.



Luckily, I stumbled across [this blog that verifies my problem](http://weblogs.java.net/blog/mister__m/archive/2003/11/crazy_jstl_when.html), so I didn't spend all day digging into this.

