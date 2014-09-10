---

title: "Deploying Webstart Apps with Maven"
date: 2005-07-11
comments: false
tags:
 - java
---

First, let me describe my goal. I would like to be able to deploy my current [webstart applications](http://shard.codecrate.com) using maven. In the past, I've deployed internal corporate applications using webstart, but deploying a public customer application is quite different. With an internal application, you can dicate or force all users to be running the most current (SNAPSHOT) version. This is not the case when you are dealing with a public app. For example, I would like to allow users running version 0.3 of my application to continue using that version until they decide to run version 0.4. This would also allow for early adopters to run the next SNAPSHOT version while maintaining their current stable installation.



The current Maven support for deploying webstart applications is pretty weak. I'm currently using a postGoal to build and package the webstart files with my [main project site documentation](http://shard.codecrate.com). Then, when I deploy my site, the webstart files are included and hosted by the same webserver that hosts the project docs.



This definately isn't desirable, since I want to concurrently serve up multiple versions of the same artifact. The only way around this would be to have completely different sites for each version of the artifact.



The repository layout for maven2 seems to almost solve my problems. It provides a versioned layout for artifacts, which has been my largest problem thus far. This type of layout would be usuable for most of my use cases:


```
myProject/
 /jnlps/
 /1.0/myProject-1.0.jnlp
 /myProject-1.0.jar
 /projectDependency-2.0.jar
```



Deploying the dependencies along with the artifacts is not currently supported, and I would be very interested to hear if maven2 will offer better support for deployment of webstart (or just plain desktop) applications.



All Webstart applications still have the basic problem that the .jnlp file has to be hardcoded with the servername and path. This restricts the deployment of the application to one location and can't be rsync'd to other servers that act as mirrors. For example, if my application is to be deployed on [ibiblio](http://www.ibiblio.org/maven), I have to hardcode that in the .jnlp file which means, it won't run if it's hosted just on my [codecrate maven repository](http://maven.codecrate.com).

