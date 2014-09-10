---

title: "Maven2 Eclipse Plugin Tips"
date: 2006-06-30
comments: false
tags:
 - java
 - eclipse
 - maven
---

I've been using [Maven2](http://maven.apache.org) as my primary build tool for [shard](http://shard.codecrate.com) for several monthes now. Since I'm also a long time user of maven1, my integration of maven and eclipse has been pretty minimal. Basically, I only used maven as a convenience tool to generate my eclipse .classpath files. It was far from ideal since it still relied on me using the command line maven to download the dependecies into a common location for eclipse to slurp up.



I just recently decided to dig a bit more into the [maven2 eclipse plugin](http://maven.apache.org/eclipse-plugin.html), and surprisingly, I've found it quite useful. The M2Eclipse plugin integrates maven into eclipse as an external tool. No need to download and install maven seperately. All commands that need to be executed (like clean, install, etc) can be run as an external tool.



Dealing with multiple sub-projects became a pain pretty quickly because I had to setup individual commands for each project. Since shard has _several_ sub-projects (core, dice, hibernate, minotaur, phoenix, gui-core, transfer, sheets), it really sucked to have to create an install goal for each one. Here's a quick trick when dealing with multiple sub-projects like shard to get around creating individual goals per project.



Create a new external goal using the eclipse wizard and use some eclipse variables to execute whatever goal you want on the **currently selected project**. This allows you to only create one goal for each unique operation (compile, test, install, etc).



```
Base Directory:
${workspace_loc:/${project_name}}

Goals:
install
```
