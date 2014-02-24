---
layout: post
title: "Official Testdox Maven Plugin Release"
date: 2007-09-08
comments: false
tags:
 - java
 - testing
 - maven
---

It seems as though the [Codehaus Mojo Project](http://mojo.codehaus.org) has reached the end of the line.  After finishing up my [testdox maven plugin]({% post_url 2007-03-06-testdox-maven-plugin %}), I tried to [contribute my plugin](http://jira.codehaus.org/browse/MOJO-681) to the Codehaus Project, but it has fallen on deaf ears.  I guess it's time to take things into my own hands, and so I'm happy to announce the [first official release of the testdox maven plugin](http://maven.codecrate.com/com/codecrate/maven/plugins/testdox-maven-plugin/).



Enabling the plugin is a snap.  Just add this xml block to your maven2 project and the next time you build your site documentation, the superfancy testdox report will be included in your project reports.


```xml
&lt;repositories&gt;
  &lt;repository&gt;
    &lt;id&gt;codecrate-repository&lt;/id&gt;
    &lt;name&gt;Codecrate Repository&lt;/name&gt;
    &lt;url&gt;http://maven.codecrate.com/&lt;/url&gt;
  &lt;/repository&gt;
&lt;/repositories&gt;

&lt;reporting&gt;
  &lt;plugins&gt;
    &lt;plugin&gt;
      &lt;groupId&gt;com.codecrate.maven.plugins&lt;/groupId&gt;
      &lt;artifactId&gt;testdox-maven-plugin&lt;/artifactId&gt;
    &lt;/plugin&gt;
  &lt;/plugins&gt;
&lt;/reporting&gt;
```



Just incase you've missed out on my previous [blog]({% post_url 2006-04-25-running-code-doesn-lie %})[entries]({% post_url 2007-03-06-testdox-maven-plugin %}), the testdox report creates a human readable HTML report of your JUnit test suites.  Try it out today, and let me know what you think!



It's unfortunate that the Codehaus Mojo project is in the state that it is.  Since the Maven core codebase is ASF licensed, non-ASF contributions can not be included in the Maven core.  That makes this this extension project extremely important to encourage users to develop plugins for the "rest of the non-ASF" world.



This is exactly why the wicket-stuff project is such an important partner to the core wicket project.  And wicket-stuff is definitely doing things right. Tons of contributions and an extremely low barrier for new projects to get up and running.

