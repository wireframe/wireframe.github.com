---
layout: post
title: "Spring-RCP Snapshots Available"
date: 2005-06-15
comments: false
tags:
 - spring
 - springrcp
---

I've been putting in a fair amount of work lately on two spring-rcp applications for [shard](http://shard.codecrate.com). One is for managing all customizable d20 data, and the other is a character generator. Shard is built using maven, and since spring-rcp does not have any published artifacts (or snapshots), it's been a bit of a pain to integrate the applications into my build process.


To solve this problem, I decided to publish [CVS snapshots of spring-rcp](http://maven.codecrate.com/spring-rcp/jars/) on [my public maven repository](http://maven.codecrate.com). Anyone interested in developing a spring-rcp application with maven can simply update their list of repositories to include my server.


project.properties

```
#repository settings
maven.repo.remote=http://maven.codecrate.com,http://www.ibiblio.org/maven
```


I've also included [other dependencies](http://maven.codecrate.com/javahelp/jars/) that spring-rcp required to get my applications up and running. These dependencies weren't available at [ibiblio](http://www.ibiblio.org/maven). If there is not a release sometime soon of spring-rcp, I may continue to publish updated CVS snapshots from time to time.


