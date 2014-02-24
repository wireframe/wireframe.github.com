---
layout: post
title: "Maven and XDoclet2"
date: 2005-02-16
comments: false
tags:
 - java
 - documentation
---

It's been a while since I've used XDoclet, but now that I'm starting to use Hibernate, I thought I would see what XDoclet could do for me. First let it be known that I use Maven for my projects, and I have been [extremely unimpressed with the XDoclet's integration with Maven thus far](http://wiki.codehaus.org/maven/CreatingEjbApplications). That being said, I'm all for second chances, and so I decided to really give this some investigation.


Getting XDoclet2 up and running with Maven was surprisingly easy, and I'm very impressed that it is no longer necessary to "jump through hoops" to get up and going. I started by following the [examples posted on the XDoclet2 website](http://xdoclet.codehaus.org/maven-plugin/example-hibernate.html), but quickly found out that it's out of date. I needed to use the following dependencies instead of the one's listed in the example. Once the dependencies were in place, I was up and going by adding some pretty straightforward properties. I now can use XDoclet2 for my maven projects by manually invoking maven xdoclet2, or by setting up a pregoal for java:compile.


```
xdoclet-plugins
maven-xdoclet2-plugin
1.0-SNAPSHOT
plugin
http://xdoclet.codehaus.org


xdoclet-plugins
xdoclet-plugin-hibernate
SNAPSHOT
http://xdoclet-plugins.sf.

true
```


```
#snippet from project.properties
#hibernate properties
hibernate.dialect=net.sf.hibernate.dialect.HSQLDialect
hibernate.show_sql=true
hibernate.hbm2ddl.auto=create-drop
hibernate.connection.driver_class=org.hsqldb.jdbcDriver
hibernate.connection.url=jdbc:hsqldb:.
hibernate.connection.username=sa
hibernate.connection.password=
maven.hibernate.version=2.1
maven.hibernate.showsql=${hibernate.show_sql}
maven.hibernate.dialect=${hibernate.dialect}
maven.hibernate.hbm2ddlauto=${hibernate.hbm2ddl.auto}
maven.hibernate.driver=${hibernate.connection.driver_class}
maven.hibernate.jdbcUrl=${hibernate.connection.url}
maven.hibernate.userName=${hibernate.connection.username}
maven.hibernate.password=${hibernate.connection.password}

#xdoclet properties
maven.xdoclet.0=hibernate
maven.xdoclet.0.fileset.0.dir=${basedir}/src/java
maven.xdoclet.0.fileset.0.include=**/*.java
maven.xdoclet.0.hibernate=org.xdoclet.plugin.hibernate.HibernateMappingPlugin
maven.xdoclet.0.hibernate.destdir=${basedir}/target/generated-source/java
maven.xdoclet.1=hibernate2
maven.xdoclet.1.fileset.0.dir=${basedir}/src/java
maven.xdoclet.1.fileset.0.include=**/*.java
maven.xdoclet.1.hibernate2=org.xdoclet.plugin.hibernate.HibernateConfigPlugin
maven.xdoclet.1.hibernate2.destdir=${basedir}/target/generated-source/java
maven.xdoclet.1.hibernate2.showsql=${maven.hibernate.showsql}
maven.xdoclet.1.hibernate2.dialect=${maven.hibernate.dialect}
maven.xdoclet.1.hibernate2.jdbcdriver=${maven.hibernate.driver}
maven.xdoclet.1.hibernate2.jdbcurl=${maven.hibernate.jdbcUrl}
maven.xdoclet.1.hibernate2.jdbcusername=${maven.hibernate.userName}
maven.xdoclet.1.hibernate2.jdbcpassword=${maven.hibernate.password}
maven.xdoclet.1.hibernate2.hbm2ddlauto=${maven.hibernate.hbm2ddlauto}
```


I do have a couple notable complaints from my experience thus far. First, I think that it's very confusing that XDoclet was completely rewritten using new technology, and it's simply named XDoclet2. I think something like "NextDoclet" would do a much better job of getting people's attention and avoiding confusion with the old platform. As a side note, I also question the rewrite of Maven that is simply named Maven2.


Also, one of the promises held by the developers for XDoclet2 is that it would be much easier to test and thus would have less bugs. Well, this does not seem to be the case yet. While attempting to use the new hibernate plugin, which should have been a straight forward port from the old version since no new functionality has been added, I discovered that it has some crippling bugs that render it basically unusable. I've filed these issues with the developers, so we'll see when they get this plugin actually working.



  - [empty xml properties inserted into configuration file](http://jira.codehaus.org/browse/XDP-43)


  - [hibernate config plugin uses wrong dtd](http://jira.codehaus.org/browse/XDP-42)


