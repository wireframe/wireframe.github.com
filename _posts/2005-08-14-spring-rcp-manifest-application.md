---
layout: post
title: "Spring-RCP Manifest Application Descriptor"
date: 2005-08-14
comments: false
categories:
 - java
 - spring
 - springrcp
---

One of my [first patches to spring-rcp](http://opensource.atlassian.com/projects/spring/browse/RCP-113) was just applied (partially). My goal was to enhance the ApplicationDescriptor object to pull the version information from a manifest instead of being hardcoded in a spring xml file. This makes sense for me since I package my application using maven, and maven automatically puts the version information directly into the manifest. The patch that was applied creates the ApplicationDescriptor interface, but there's still no concrete implementation to extract the version from the manifest in spring-rcp.



I figured I might as well post my intent here, and if someone else is interested, maybe someone from spring-rcp will add it to the core.



```java
package com.codecrate.springrcp;

import org.springframework.richclient.application.ApplicationDescriptor;

public class ManifestApplicationDescriptor implements ApplicationDescriptor {
  private final String version;

  public ManifestApplicationDescriptor(Class target) {
    this.version = target.getPackage().getImplementationVersion();
  }

  public String getVersion() {
    return version;
  }

  public String getBuildId() {
    return null;
  }
}

```



And here's how to wire it up using spring.


```xml
<bean id="applicationDescriptor"
 class="com.codecrate.springrcp.ManifestApplicationDescriptor">
  <constructor-arg>
    <value>foo.bar.myVersionedClass</value>
  </constructor-arg>
</bean>
```


There may be some question as to why I leave the build id null. Well, I personally don't believe in a build id. I believe that every release should be tagged in some way in your source code manager to be 100% reproducable. A user/developer should be able to download the 1.0 branch and have it build exactly the same. A product should use 1.0-SNAPSHOT until it is ready to release, and then branch or tag all files as 1.0 when ready.

