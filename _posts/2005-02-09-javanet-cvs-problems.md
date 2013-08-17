---
layout: post
title: "java.net CVS problems"
date: 2005-02-09
comments: false
categories:
 - scm
 - java
---

Have any other java.net project owners noticed that the version of CVS used to host projects has some issues? I ran headlong into an issue that has prevented me from integrating CVS commit messages into my [JIRA instance](http://jira.codecrate.com). The underlying problem is that you can not run an r* commands against the java.net CVS servers (ex: rlog, rdiff, etc).

   
I first went to Atlassian and opened an [issue](http://jira.atlassian.com/browse/JRA-5759), thinking this was a problem with JIRA. The extremely prompt and helpful Atlassian people pointed me to [some information](http://lists.gnu.org/archive/html/bug-cvs/2003-09/msg00168.html) describing this as a bug with the CVS server. It just so happens that java.net is using this outdated version of the CVS server. The bug is scheduled to be fixed in the [next version of CVS](https://ccvs.cvshome.org/issues/show_bug.cgi?id=142 ), but my question is, when will java.net update their servers?

   
I did find that there is a bit of a [workaround](https://java-net.dev.java.net/issues/show_bug.cgi?id=31) for this problem. Instead of using the symbolic links to the CVS repository, you can use the literal path. This is a bit more fragile, but should work for now. Instead of using :pserver:guest@cvs.dev.java.net:/cvs, use :pserver:guest@cvs.dev.java.net:/shared/data/ccvs/repository.

