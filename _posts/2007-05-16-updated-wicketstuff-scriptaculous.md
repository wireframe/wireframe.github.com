---
layout: post
title: "Updated Wicketstuff-Scriptaculous Project"
date: 2007-05-16
comments: false
categories:
 - java
 - scriptaculous
 - wicket
---

Just incase anyone thought that the [wicket-contrib-scriptaculous project]({% post_url 2007-01-01-wicket-scriptaculous-011-release %}) had dropped off the face of the earth, this is just a reminder that it's still going strong!



There have been a number of _great_changes made lately (which I will be blogging about later), including a **new project name** (which was _much_needed). I now give you the **wicketstuff-scriptaculous project**.



For those maven users out there, you can start using the _bleeding edge_ development version by pointing to the wicketstuff maven repository and adding the wicketstuff-scriptaculous dependency as follows:



```xml
&lt;repositories&gt;
  &lt;repository&gt;
    &lt;id&gt;wicket-stuff-repository&lt;/id&gt;
    &lt;name&gt;Wicket-Stuff Repository&lt;/name&gt;
    &lt;url&gt;http://www.wicketstuff.org/maven/repository/&lt;/url&gt;
  &lt;/repository&gt;
&lt;/repositories&gt;

&lt;dependencies&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.wicketstuff&lt;/groupId&gt;
    &lt;artifactId&gt;wicketstuff-scriptaculous&lt;/artifactId&gt;
    &lt;version&gt;1.3-SNAPSHOT&lt;/version&gt;
  &lt;/dependency&gt;
&lt;/dependencies&gt;
```
