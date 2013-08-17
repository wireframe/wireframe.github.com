---
layout: post
title: "Spring Rich Client Browser Launcher"
date: 2006-09-15
comments: false
categories:
 - java
 - spring
 - springrcp
---

I've been debating the best avenue for client apps to present help information to users. The client applications I've written for [shard](http://shard.codecrate.com) are built on [Spring Rich Client](http://spring-rich-c.sf.net), which has built in support for [JHelp](http://java.sun.com/products/javahelp/) resources. Now, maybe I'm missing something, but working with JHelp has been anything but helpful. That's why I've decided to take a new direction to leverage the [shard project wiki for user help documentation](http://wiki.codecrate.com/display/SHA/User+Guide). This feels like a perfect use of a wiki, and users never have to worry about "out of date" documentation.



I've rolled my own browser launcher for previous projects, but this time, I'm using the opensource [BareBonesBrowserLauncher](http://www.centerkey.com/java/browser/). It's a lightweight version (~50 LOC) of the more robust [BrowserLauncher2](http://browserlaunch2.sourceforge.net/) library and it's worth a shot until my requirements get more complex.




Here's a snapshot of the code, and the complete source can be found as part of the shard project.


```java
public class BrowserLauncherCommand extends ApplicationWindowAwareCommand {
  private String url;

  protected void doExecuteCommand() {
    new BareBonesBrowserLauncher().openURL(url);
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }
}

```
The Spring configuration is just a drop in replacement for the default HelpContentsCommand

```xml
&lt;bean id="helpContentsCommand"
class="com.codecrate.shard.ui.command.BrowserLauncherCommand"&gt;
&lt;property name="url"&gt;
&lt;value&gt;http://wiki.codecrate.com/display/SHA/User+Guide&lt;/value&gt;
&lt;/property&gt;
&lt;/bean&gt;
```

This is another component could be useful to other spring-rich applications. Anyone interested in integrating this into the core? There are no external dependencies, so there shouldn't be too much fuss over allowing it in.
