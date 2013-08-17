---
layout: post
title: "Seperate Artifacts For Seperate Dependencies"
date: 2006-01-23
comments: false
categories:
 - java
 - spring
 - maven
---

[Maven2](http://maven.apache.org) is a definate step up from Maven1, but some of the "must have features" (ie: transitive dependencies), are not as fleshed out as they need to be. If Maven2 hopes to de-throne [Ant](http://ant.apache.org) and become the de-facto project management tool, transitive dependencies need to be re-addressed ASAP.



If I were to pick a "home run" example of where transitive dependencies could really be an advantage, it would be when starting a new project using [Spring](http://springframework.org). If I were a new user, I would expect to only have to specify the pieces I need, and the rest should be provided for me. My pom should contain as little as this:

```xml
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-orm&lt;/artifactId&gt;
  &lt;version&gt;1.2.5&lt;/version&gt;
&lt;/dependency&gt;
```



Sadly, things are not this way...yet. One of the main problems, is the introduction of the  dependency attribute. This lack-luster feature allows for frameworks to publish their artifacts with an ungodly number of dependencies, and force unknowing developers that use their framework to specify what pieces they don't want.



Spring-ORM is the perfect example of this flaw. Why in the world do I have to specify [over 20 dependency excludes](https://shard.dev.java.net/source/browse/shard/shard-hibernate/pom.xml?rev=1.21&view=auto&content-type=text/vnd.viewcvs-markup) just to get started with my project!?! Sure, Spring-ORM is packaged as one massive jar, but I highly doubt there are developers that use [Hibernate2, AND Hibernate3, AND JDO, AND Toplink, AND EJB's](http://www.ibiblio.org/maven2/org/springframework/spring-orm/1.2.6/spring-orm-1.2.6.pom). What's so difficult about exposing different POM's for different sets of dependencies? Maven2 allows for projects to publish POM's, and this seems to fit perfectly. Ideally, there should be a Spring-ORM-Hibernate dependency that only has the things I need. Then there's no need for this whole "excludes" feature.

Now that Maven2 is getting some "real world" use, these issues need to be brought to the forefront and addressed so that transitive dependencies will hopefully be useful again.
