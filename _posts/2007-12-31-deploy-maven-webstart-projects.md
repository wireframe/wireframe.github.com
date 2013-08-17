---
layout: post
title: "Deploy Maven Webstart Projects"
date: 2007-12-31
comments: false
categories:
 - java
 - webstart
 - maven
---

I've continued to work on shard-cyclops this last week and just pushed out a new release that has a few updates including:



  - display the distance of the token path while moving around the grid


  - automate deployment of the project using the new codecrate webstart plugin




That's right, the codecrate webstart maven plugin can now *deploy* your distribution as well as create the fancy JNLP file. By adding your maven repository ID and URL to your plugin configuration, you can now upload your JNLP and jar artifacts automatically as part of your maven build!



```xml
&lt;plugin&gt;
  &lt;groupId&gt;com.codecrate&lt;/groupId&gt;
  &lt;artifactId&gt;webstart-maven-plugin&lt;/artifactId&gt;
  &lt;executions&gt;
    &lt;execution&gt;
&lt;id&gt;deploy-webstart&lt;/id&gt;
&lt;phase&gt;deploy&lt;/phase&gt;
&lt;goals&gt;
  &lt;goal&gt;deploy-jnlp&lt;/goal&gt;
 &lt;/goals&gt;
    &lt;/execution&gt;
  &lt;/executions&gt;
  &lt;configuration&gt;
    &lt;mainClass&gt;com.mysite.MyApp&lt;/mainClass&gt;

    &lt;id&gt;codecrate-ftp-repo&lt;/id&gt;
    &lt;url&gt;ftp://www.codecrate.com/shard/shard-cyclops&lt;/url&gt;
  &lt;/configuration&gt;
&lt;/plugin&gt;
```



The implementation was a bit *too* easy if you ask me. The maven-wagon library is intended to be an abstraction around file transfers so your plugin can transfer files across any protocal (ftp, scp, local, webdav, etc). I was right to be skeptical because it seems that the maven-wagon project is yet another red headed stepchild of the maven umbrella. When using an FTP repository, wagon only supports transferring individual files and not an entire directory. WTF? Supposedly, this is done because FTP is slow for transferring files one at a time, but who the hell cares? I've got all of my builds automated, so why would I care if it takes 10 seconds or 10 minutes to transfer files?



Oh well, I have a workaround place to transfer files one at a time to get around wagon's inadequacy. Yet again maven has taken a great idea (abstraction of file deployment for different protocols) and dropped the ball. It's obvious that maven suffers from NIH Syndrome (Not Invented Here) and is ignoring a lot of work other developers have done. [Commons VFS](http://www.jroller.com/phidias/entry/scripting_vfs) has a similar mission as wagon and has been around *much* longer. Why not leverage what's already out there?



Enough ranting. I'm psyched to have the new plugin out the door, and now updates to shard-cyclops should become a regular occurance. Next up, I need to create a new maven plugin that will generate a "pretty" html page with the appropriate magic javascript to detect the Java installation on client machines.


